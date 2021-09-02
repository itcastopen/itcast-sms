package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.ConfigEntity;

import java.util.List;

/**
 * 配置表
 *
 * @author 传智播客
 *
 */
public interface ConfigService extends IService<ConfigEntity> {

    List<ConfigEntity> findByTemplateSignature(String template, String signature);
}
