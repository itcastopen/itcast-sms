package com.itheima.sms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.tools.base.R;
import com.itheima.sms.dto.MarketingDTO;
import com.itheima.sms.entity.MarketingEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * 营销短信
 *
 * @author 传智播客
 *
 */
public interface MarketingService extends IService<MarketingEntity> {

    IPage<MarketingDTO> customPage(Page<MarketingDTO> page, Map<String, Object> params);

    R<? extends Object> upload(MultipartFile file);
}
