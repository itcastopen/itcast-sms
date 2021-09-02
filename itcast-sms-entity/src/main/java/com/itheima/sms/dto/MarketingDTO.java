package com.itheima.sms.dto;

import com.itheima.sms.entity.MarketingEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;


@Data
@ApiModel(description = "营销")
public class MarketingDTO extends MarketingEntity {

    @ApiModelProperty("变量")
    private List<String> paramFields;

    @ApiModelProperty("签名")
    private String signatureName;

    @ApiModelProperty("短信内容")
    private String contentText;
}
