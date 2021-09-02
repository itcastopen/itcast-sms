package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.dto.MailListDTO;
import com.itheima.sms.entity.MailListEntity;

import java.util.List;

/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
public interface MailListService extends IService<MailListEntity> {

    List<MailListDTO> listByPage(Page<MailListEntity> page, MailListDTO mailListDTO);
}
