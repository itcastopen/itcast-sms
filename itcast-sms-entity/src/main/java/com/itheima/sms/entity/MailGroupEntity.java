package com.itheima.sms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.itheima.sms.entity.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 通讯组
 *
 * @author 传智播客
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("mail_group")
@ApiModel(description = "通讯组")
public class MailGroupEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "类型")
    private String type;

    @ApiModelProperty(value = "备注")
    private String remark;

}
