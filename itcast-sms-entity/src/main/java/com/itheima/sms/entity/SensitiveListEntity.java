package com.itheima.sms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.itheima.sms.entity.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 敏感词
 *
 * @author 传智播客
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("sensitive_list")
@ApiModel(description = "敏感词")
public class SensitiveListEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "类型：全部、短信、邮件、微信")
	private String type;

	@ApiModelProperty(value = "内容：手机号")
	private String content;

	@ApiModelProperty(value = "备注")
	private String remark;

}
