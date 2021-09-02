package com.itheima.sms.dto;

import com.itheima.sms.entity.ReceiveLogEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * 接收日志表
 *
 * @author 传智播客
 */
@Data
@ApiModel(description = "接收日志表")
public class ReceiveLogDTO extends ReceiveLogEntity {

}
