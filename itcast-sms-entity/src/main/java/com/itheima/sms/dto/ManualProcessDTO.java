package com.itheima.sms.dto;

import com.itheima.sms.entity.ManualProcessEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * 人工处理任务表
 *
 * @author 传智播客
 */
@Data
@ApiModel(description = "人工处理任务表")
public class ManualProcessDTO extends ManualProcessEntity {

}
