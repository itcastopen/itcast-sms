package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.entity.ReceiveLogEntity;
import com.itheima.sms.mapper.ReceiveLogMapper;
import com.itheima.sms.service.ReceiveLogService;
import org.springframework.stereotype.Service;

/**
 * 接收日志表
 *
 * @author 传智播客
 *
 */
@Service
public class ReceiveLogServiceImpl extends ServiceImpl<ReceiveLogMapper, ReceiveLogEntity> implements ReceiveLogService {

}
