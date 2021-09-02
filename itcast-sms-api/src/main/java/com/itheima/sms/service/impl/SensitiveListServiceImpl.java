package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.entity.SensitiveListEntity;
import com.itheima.sms.mapper.SensitiveListMapper;
import com.itheima.sms.service.SensitiveListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 敏感词
 *
 * @author 传智播客
 *
 */
@Service
public class SensitiveListServiceImpl extends ServiceImpl<SensitiveListMapper, SensitiveListEntity> implements SensitiveListService {

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public String listByType(String type) {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        String sensitive = ops.get("Sensitive_" + type);
        if (StringUtils.isEmpty(sensitive)) {
            LambdaQueryWrapper<SensitiveListEntity> wrapper = new LambdaQueryWrapper();
            wrapper.eq(SensitiveListEntity::getType, type);
            List<SensitiveListEntity> sensitiveListEntities = baseMapper.selectList(wrapper);
            List<String> sensitives = sensitiveListEntities.stream().map(item -> item.getContent()).collect(Collectors.toList());
            sensitive = org.apache.commons.lang3.StringUtils.join(sensitives, ",") + ",";
            ops.set("Sensitive_" + type, sensitive, 60, TimeUnit.SECONDS);
        }
        return sensitive;
    }
}
