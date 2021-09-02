package com.itheima.sms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.sms.dto.MailListDTO;
import com.itheima.sms.entity.MailListEntity;
import com.itheima.sms.mapper.MailListMapper;
import com.itheima.sms.service.MailListService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
@Service
public class MailListServiceImpl extends ServiceImpl<MailListMapper, MailListEntity> implements MailListService {
    @Override
    public List<MailListDTO> listByPage(Page<MailListEntity> page, MailListDTO mailListDTO) {
        return this.baseMapper.listByPage(page, mailListDTO);
    }
}
