package com.itheima.sms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.itheima.sms.entity.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 营销短信
 */

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("marketing")
@ApiModel(description = "营销短信")
public class MarketingEntity extends BaseEntity {

    @ApiModelProperty("主题")
    private String title;

    @ApiModelProperty("模板")
    private String template;

    @ApiModelProperty("签名")
    private String signature;

    @ApiModelProperty("用户组名称，可能没有")
    private String mailGroup;

    @ApiModelProperty("手机号:多个用，分隔")
    private String mobiles;

    @ApiModelProperty("手机号个数")
    private Integer mobileNumber;

    @ApiModelProperty("手机号导入文件名")
    private String mobileFile;

    @ApiModelProperty("短信参数")
    private String content;

    @ApiModelProperty("状态 0：待审核 1：通过 2：驳回")
    private Integer status;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty(value = "申请人")
    private String createUserName;
    @ApiModelProperty(value = "修改人")
    private String updateUserName;

}
