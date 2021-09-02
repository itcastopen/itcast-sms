package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.entity.ConfigEntity;
import com.itheima.sms.mapper.ConfigMapper;
import com.itheima.sms.service.ConfigService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 配置表
 *
 * @author 传智播客
 *
 */
@Service
public class ConfigServiceImpl extends ServiceImpl<ConfigMapper, ConfigEntity> implements ConfigService {

    @Override
    public List<ConfigEntity> findByTemplateSignature(String template, String signature) {

        Map params = new HashMap();
        params.put("template", template);
        params.put("signature", signature);

        return baseMapper.findByTemplateSignature(params);
    }
}
