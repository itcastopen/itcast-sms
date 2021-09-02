package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.dto.ConfigDTO;
import com.itheima.sms.entity.ConfigSignatureEntity;

/**
 * 配置—签名表
 */
public interface ConfigSignatureService extends IService<ConfigSignatureEntity> {

    void merge(ConfigDTO entity);
}
