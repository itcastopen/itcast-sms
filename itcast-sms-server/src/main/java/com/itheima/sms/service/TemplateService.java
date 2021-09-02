package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.TemplateEntity;

/**
 * 模板表
 *
 * @author 传智播客
 *
 */
public interface TemplateService extends IService<TemplateEntity> {

    TemplateEntity getByCode(String template);

    String getConfigCodeByCode(String id, String template);
}
