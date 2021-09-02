package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.PlatformEntity;

/**
 * 平台表
 *
 * @author 传智播客
 *
 */
public interface PlatformService extends IService<PlatformEntity> {

    PlatformEntity getByAccessKeyId(String accessKeyId);
}
