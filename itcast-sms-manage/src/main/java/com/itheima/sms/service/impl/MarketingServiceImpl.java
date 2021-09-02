package com.itheima.sms.service.impl;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.tools.base.R;
import com.itheima.sms.dto.MarketingDTO;
import com.itheima.sms.entity.MarketingEntity;
import com.itheima.sms.excel.MarketingExcelDTO;
import com.itheima.sms.mapper.MarketingMapper;
import com.itheima.sms.service.MarketingService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * 营销短信
 *
 * @author 传智播客
 *
 */
@Service
@Slf4j
public class MarketingServiceImpl extends ServiceImpl<MarketingMapper, MarketingEntity> implements MarketingService {
    private static Pattern PHONE_PATTERN = Pattern.compile("^[1]\\d{10}$");

    @Override
    public IPage<MarketingDTO> customPage(Page<MarketingDTO> page, Map<String, Object> params) {
        IPage<MarketingDTO> ipage = this.baseMapper.custom(page, params);
        page.setRecords(ipage.getRecords());
        return ipage;
    }

    @SneakyThrows
    @Override
    public R<? extends Object> upload(MultipartFile file) {
        List<MarketingExcelDTO> marketingExcelDTOS = ExcelImportUtil.importExcel(file.getInputStream(), MarketingExcelDTO.class, new ImportParams());

        int count = marketingExcelDTOS.size();
        log.debug("导入收信人 解析文件:{} 条", count);
        List<String> mobiles = new ArrayList<>();
        List<String> errormsgs = new ArrayList<>();
        for (int i = 0; i < marketingExcelDTOS.size(); i++) {
            MarketingExcelDTO marketingExcelDTO = marketingExcelDTOS.get(i);
            if (StringUtils.isNotBlank(marketingExcelDTO.getMobile()) && PHONE_PATTERN.matcher(marketingExcelDTO.getMobile()).matches()) {
                mobiles.add(marketingExcelDTO.getMobile());
            } else {
                errormsgs.add("第" + (i + 1) + "条导入失败，格式错误");
            }
        }
        int success = mobiles.size();
        log.debug("导入收信人 校验通过:{} 条", success);

        Map result = new HashMap();
        result.put("count", count);
        result.put("success", success);
        result.put("fail", count - success);
        result.put("mobiles", mobiles);
        result.put("errormsgs", errormsgs);
        return R.success(result);
    }
}
