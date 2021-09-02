package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.entity.ManualProcessEntity;
import com.itheima.sms.mapper.ManualProcessMapper;
import com.itheima.sms.service.ManualProcessService;
import org.springframework.stereotype.Service;

/**
 * 人工处理任务表
 *
 * @author 传智播客
 *
 */
@Service
public class ManualProcessServiceImpl extends ServiceImpl<ManualProcessMapper, ManualProcessEntity> implements ManualProcessService {

}
