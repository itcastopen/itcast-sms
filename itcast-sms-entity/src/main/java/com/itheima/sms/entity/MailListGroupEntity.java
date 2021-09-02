package com.itheima.sms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.itheima.sms.entity.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 通讯录-通讯组
 *
 * @author 传智播客
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("mail_list_group")
@ApiModel(description = "通讯录-通讯组")
public class MailListGroupEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;


	@ApiModelProperty(value = "通讯录id")
	private String listId;

	@ApiModelProperty(value = "通讯组id")
	private String groupId;

}
