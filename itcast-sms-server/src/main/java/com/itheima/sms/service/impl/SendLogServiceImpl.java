package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.entity.ReceiveLogEntity;
import com.itheima.sms.entity.SendLogEntity;
import com.itheima.sms.mapper.ReceiveLogMapper;
import com.itheima.sms.mapper.SendLogMapper;
import com.itheima.sms.service.SendLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 日志表
 *
 * @author 传智播客
 *
 */
@Service
public class SendLogServiceImpl extends ServiceImpl<SendLogMapper, SendLogEntity> implements SendLogService {

    @Autowired
    private ReceiveLogMapper receiveLogMapper;

    @Override
    public boolean save(SendLogEntity entity) {

        ReceiveLogEntity receiveLogEntity = new ReceiveLogEntity();
        receiveLogEntity.setStatus(entity.getStatus());
        LambdaUpdateWrapper<ReceiveLogEntity> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(ReceiveLogEntity::getApiLogId, entity.getApiLogId());
        receiveLogMapper.update(receiveLogEntity, wrapper);

        return super.save(entity);
    }
}
