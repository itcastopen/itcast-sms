package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.ConfigEntity;

import java.util.Collection;
import java.util.List;

/**
 * 配置表
 *
 * @author 传智播客
 *
 */
public interface ConfigService extends IService<ConfigEntity> {

    /**
     * 通道配置信息列表
     * @return
     */
    List<ConfigEntity> listForConnect();

    List<ConfigEntity> listForNewConnect();

    boolean updateBatchById(Collection<ConfigEntity> entityList);
}
