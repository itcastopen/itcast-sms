package com.itheima.sms.dto;

import com.itheima.sms.entity.SensitiveListEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;


/**
 * 敏感词
 *
 * @author 传智播客
 *
 */
@Data
@ApiModel(description = "敏感词")
public class SensitiveListDTO extends SensitiveListEntity {

}
