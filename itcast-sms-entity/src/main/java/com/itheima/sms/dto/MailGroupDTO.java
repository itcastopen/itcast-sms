package com.itheima.sms.dto;

import com.itheima.sms.entity.MailGroupEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;


/**
 * 通讯组
 *
 * @author 传智播客
 *
 */
@Data
@ApiModel(description = "通讯组")
public class MailGroupDTO extends MailGroupEntity {
    @ApiModelProperty("通讯录id集合")
    private List<String> mailIds;
}
