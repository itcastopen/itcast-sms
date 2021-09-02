package com.itheima.sms.redismq;


import com.itheima.sms.factory.SmsConnectLoader;
import com.itheima.sms.model.ServerTopic;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Component;


/**
 * 高优先级队列
 */
@Component
@Slf4j
public class HighServerReceiver implements MessageListener {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private SmsConnectLoader smsConnectLoader;

    @Override
    public void onMessage(Message message, byte[] pattern) {
        RedisSerializer<?> valueSerializer = redisTemplate.getDefaultSerializer();
        String deserialize = valueSerializer.deserialize(message.getBody()).toString();
        log.info("收到的服务id消息：{}", deserialize);
        ServerTopic serverTopic = ServerTopic.load(deserialize);
        switch (serverTopic.getOption()) {
            case ServerTopic.USE_NEW_CONNECT: //应用通道连接池
                log.info("服务：{} ,发起新连接应用", serverTopic.getValue());
                smsConnectLoader.changeNewConnect();
                break;
            case ServerTopic.INIT_CONNECT:   //创建通道连接池
                log.info("服务：{} ,发起新连接初始化", serverTopic.getValue());
                smsConnectLoader.initConnect();
                break;
            default:
                break;
        }
    }
}
