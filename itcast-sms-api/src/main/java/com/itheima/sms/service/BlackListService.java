package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.BlackListEntity;

import java.util.List;

/**
 * 黑名单
 *
 * @author 传智播客
 *
 */
public interface BlackListService extends IService<BlackListEntity> {

    List<String> listByType(String s);
}
