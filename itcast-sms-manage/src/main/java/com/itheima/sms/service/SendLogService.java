package com.itheima.sms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.sms.entity.SendLogEntity;
import com.itheima.sms.vo.MarketingStatisticsCountVO;
import com.itheima.sms.vo.SendLogPageVO;
import com.itheima.sms.vo.SendLogVO;
import com.itheima.sms.vo.StatisticsCountVO;

import java.util.List;
import java.util.Map;

/**
 * 日志表
 *
 * @author 传智播客
 *
 */
public interface SendLogService extends IService<SendLogEntity> {

    Page<SendLogVO> pageLog(Page<SendLogVO> page, Map<String, Object> params);

    List<StatisticsCountVO> trend(Map params);

    Page<StatisticsCountVO> countPage(Page<StatisticsCountVO> page, Map<String, Object> params);

    List<Map> countForConfig(Map params);

    List<Map> rateForConfig(Map params);

    MarketingStatisticsCountVO getMarketingCountByBusinessId(String id);

    Page<SendLogPageVO> sendLogPage(Page<SendLogPageVO> page, SendLogPageVO sendLogPageVO);
}
