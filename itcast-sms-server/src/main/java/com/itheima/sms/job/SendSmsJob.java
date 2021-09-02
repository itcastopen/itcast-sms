package com.itheima.sms.job;

import com.itheima.sms.config.RedisLock;
import com.itheima.tools.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Slf4j
public class SendSmsJob {

    @Autowired
    private SendTimingSms sendTimingSms;

    @Autowired
    private RedisLock redisLock;

    @Scheduled(cron = "10 0/1 * * * ?")     //每分钟的第10秒执行一次
    public void sendTimingSms() throws InterruptedException {
        String timing = DateUtils.format(new Date(), "yyyy-MM-dd HH:mm");
        String lockKey = "SEND_TIMING_SMS" + timing;
        // 三十秒释放锁
        String token = redisLock.tryLock(lockKey, 1000 * 50);
        log.info("定时发送短信任务准备执行:{} ,分布式锁:{}", timing, token);
        if (StringUtils.isNotBlank(token)) {
            // 获取锁成功
            sendTimingSms.execute(timing);
        }
    }
}
