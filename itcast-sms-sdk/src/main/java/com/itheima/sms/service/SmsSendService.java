package com.itheima.sms.service;

import com.itheima.sms.dto.R;
import com.itheima.sms.dto.SmsBatchParamsDTO;
import com.itheima.sms.dto.SmsParamsDTO;

public interface SmsSendService {
    R sendSms(SmsParamsDTO smsParamsDTO);

    R batchSendSms(SmsBatchParamsDTO smsBatchParamsDTO);
}
