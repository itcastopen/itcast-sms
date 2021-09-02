package com.itheima.sms.dto;

import com.itheima.sms.entity.MailListEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
@Data
@ApiModel(description = "通讯录")
public class MailListDTO extends MailListEntity {
    @ApiModelProperty("分组id")
    private String groupId;
}
