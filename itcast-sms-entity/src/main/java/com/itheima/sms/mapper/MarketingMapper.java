package com.itheima.sms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.dto.MarketingDTO;
import com.itheima.sms.entity.MarketingEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 营销短信
 */
@Repository
public interface MarketingMapper extends BaseMapper<MarketingEntity> {

    IPage<MarketingDTO> custom(Page<MarketingDTO> page,@Param("params") Map<String, Object> params);
}
