package com.itheima.sms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.itheima.sms.entity.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("mail_list")
@ApiModel(description = "通讯录")
public class MailListEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "姓名")
	private String name;

	@ApiModelProperty(value = "部门")
	private String dept;

	@ApiModelProperty(value = "职位")
	private String position;

	@ApiModelProperty(value = "电话")
	private String phone;

	@ApiModelProperty(value = "邮箱")
	private String email;

	@ApiModelProperty(value = "QQ")
	private String qq;

	@ApiModelProperty(value = "微信")
	private String wechat;

	@ApiModelProperty(value = "类型")
	private String type;

	@ApiModelProperty(value = "备注")
	private String remark;

}
