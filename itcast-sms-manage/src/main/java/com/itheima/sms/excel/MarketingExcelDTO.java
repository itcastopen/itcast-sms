package com.itheima.sms.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ExcelTarget("Marketing")
public class MarketingExcelDTO implements Serializable {

    @Excel(name = "手机号", orderNum = "1", isImportField = "true_st")
    private String mobile;

}
