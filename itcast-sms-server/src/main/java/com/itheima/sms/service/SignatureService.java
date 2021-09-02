package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.SignatureEntity;

/**
 * 签名表
 *
 * @author 传智播客
 *
 */
public interface SignatureService extends IService<SignatureEntity> {

    SignatureEntity getByCode(String signature);

    String getConfigCodeByCode(String id, String signature);
}
