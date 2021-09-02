package com.itheima.sms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.dto.MailListDTO;
import com.itheima.sms.entity.MailListEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
@Repository
public interface MailListMapper extends BaseMapper<MailListEntity> {

    List<MailListDTO> listByPage(Page<MailListEntity> page, MailListDTO mailListDTO);
}
