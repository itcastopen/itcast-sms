package com.itheima.sms.service;

import com.itheima.sms.dto.SmsBatchParamsDTO;
import com.itheima.sms.dto.SmsParamsDTO;

public interface SmsSendService {
    void send(SmsParamsDTO smsParamsDTO);

    void batchSend(SmsBatchParamsDTO smsBatchParamsDTO);
}
