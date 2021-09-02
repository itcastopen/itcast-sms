package com.itheima.sms.controller;

import com.itheima.tools.base.R;
import com.itheima.sms.dto.SmsBatchParamsDTO;
import com.itheima.sms.dto.SmsParamsDTO;
import com.itheima.sms.exception.SmsException;
import com.itheima.sms.service.SmsSendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 短信发送接口
 * header 中存放鉴权信息、平台信息
 * body 中只有短信内容
 *
 * @author 传智播客
 *
 */
@RestController
@RequestMapping("sms")
@Api(tags = "短信")
@Slf4j
public class SmsSendController {

    @Autowired
    private SmsSendService smsSendService;

    @PostMapping("send")
    @ApiOperation("发送短信")
    public R send(@RequestBody SmsParamsDTO smsParamsDTO) {
        log.info("发送短信 params:{}", smsParamsDTO);
        try {
            smsSendService.send(smsParamsDTO);
        } catch (SmsException e) {
            log.error("发送异常", e);
            return R.fail(e.getMessage());
        }
        return R.success();
    }

    @PostMapping("batchSend")
    @ApiOperation("批量发送短信(手机号、签名、模板、参数 一一对应)")
    public R batchSend(@RequestBody SmsBatchParamsDTO smsBatchParamsDTO) {
        log.info("批量发送短信 params:{}", smsBatchParamsDTO);
        try {
            smsSendService.batchSend(smsBatchParamsDTO);
        } catch (SmsException e) {
            return R.fail(e.getMessage());
        }
        return R.success();
    }
}
