package com.itheima.sms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.dto.SignatureDTO;
import com.itheima.sms.entity.SignatureEntity;

import java.util.List;
import java.util.Map;

/**
 * 签名表
 */
public interface SignatureService extends IService<SignatureEntity> {

    String getNextCode();

    IPage<SignatureDTO> customPage(Page<SignatureDTO> page, Map params);

    List<SignatureDTO> customList(Map params);

    SignatureEntity getByCode(String code);

    SignatureEntity getByName(String name);
}
