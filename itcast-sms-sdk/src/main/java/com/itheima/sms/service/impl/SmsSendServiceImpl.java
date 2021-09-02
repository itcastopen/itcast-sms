package com.itheima.sms.service.impl;


import com.alibaba.fastjson.JSON;
import com.itheima.sms.dto.R;
import com.itheima.sms.dto.SmsBatchParamsDTO;
import com.itheima.sms.dto.SmsParamsDTO;
import com.itheima.sms.service.SmsSendService;
import com.itheima.sms.utils.SmsEncryptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Service
@Slf4j
public class SmsSendServiceImpl implements SmsSendService {
    @Value("${itheima.sms.auth}")
    private boolean auth;
    @Value("${itheima.sms.domain}")
    private String domain;
    @Value("${itheima.sms.accessKeyId}")
    private String accessKeyId;
    @Value("${itheima.sms.accessKeySecret}")
    private String accessKeySecret;
    @Value("${itheima.sms.signature:}")
    private String signature;


    private String send = "/sms/send";
    private String batchSend = "/sms/batchSend";

    @Override
    public R sendSms(SmsParamsDTO smsParamsDTO) {
        if (StringUtils.isBlank(smsParamsDTO.getSignature())) {
            smsParamsDTO.setSignature(signature);
        }
        smsParamsDTO.setAccessKeyId(accessKeyId);
        if (auth) {
            if (StringUtils.isBlank(accessKeyId) || StringUtils.isBlank(accessKeySecret)) {
                R.fail("accessKey 不能为空");
            }
            smsParamsDTO.setTimestamp(String.valueOf(System.currentTimeMillis()));
            smsParamsDTO.setEncryption(SmsEncryptionUtils.encode(smsParamsDTO.getEncryption(), smsParamsDTO.getAccessKeyId(), accessKeySecret));
        }

        if (StringUtils.isBlank(domain)) {
            R.fail("domain 不能为空");
        }

        CloseableHttpClient httpclient = HttpClients.createDefault();

        log.debug("SMS auth:{}", auth);
        log.debug("SMS domain:{}", domain);
        log.debug("SMS accessKeyId:{}", accessKeyId);
        log.debug("SMS accessKeySecret:{}", accessKeySecret);

        HttpPost post = new HttpPost(domain + send);

        post.setHeader("Content-Type", "application/json; charset=UTF-8");

        StringEntity stringEntity = new StringEntity(JSON.toJSONString(smsParamsDTO), "UTF-8");
        post.setEntity(stringEntity);


        try {
            CloseableHttpResponse response = httpclient.execute(post);
            HttpEntity entity = response.getEntity();

            if (200 == response.getStatusLine().getStatusCode()) {
                log.info("httpRequest access success, StatusCode is:{}", response.getStatusLine()
                        .getStatusCode());
                String responseContent = EntityUtils.toString(entity);
                log.info("responseContent is :" + responseContent);
                return JSON.parseObject(responseContent, R.class);
            } else {
                log.error("httpRequest access fail ,StatusCode is:{}", response.getStatusLine().getStatusCode());
                return R.fail("status is " + response.getStatusLine().getStatusCode());
            }
        } catch (Exception e) {
            log.error("error :", e);
            return R.fail(e.getMessage());
        } finally {
            post.releaseConnection();
        }
    }

    @Override
    public R batchSendSms(SmsBatchParamsDTO smsBatchParamsDTO) {
        if (CollectionUtils.isEmpty(smsBatchParamsDTO.getSignature())) {
            smsBatchParamsDTO.addSignature(signature);
        }
        smsBatchParamsDTO.setAccessKeyId(accessKeyId);
        if (auth) {
            if (StringUtils.isBlank(accessKeyId) || StringUtils.isBlank(accessKeySecret)) {
                R.fail("accessKey 不能为空");
            }
            smsBatchParamsDTO.setTimestamp(String.valueOf(System.currentTimeMillis()));
            smsBatchParamsDTO.setEncryption(SmsEncryptionUtils.encode(smsBatchParamsDTO.getEncryption(), smsBatchParamsDTO.getAccessKeyId(), accessKeySecret));
        }

        if (StringUtils.isBlank(domain)) {
            R.fail("domain 不能为空");
        }

        CloseableHttpClient httpclient = HttpClients.createDefault();

        log.debug("SMS auth:{}", auth);
        log.debug("SMS domain:{}", domain);
        log.debug("SMS accessKeyId:{}", accessKeyId);
        log.debug("SMS accessKeySecret:{}", accessKeySecret);

        HttpPost post = new HttpPost(domain + batchSend);

        post.setHeader("Content-Type", "application/json; charset=UTF-8");

        StringEntity stringEntity = new StringEntity(JSON.toJSONString(smsBatchParamsDTO), "UTF-8");
        post.setEntity(stringEntity);


        try {
            CloseableHttpResponse response = httpclient.execute(post);
            HttpEntity entity = response.getEntity();

            if (200 == response.getStatusLine().getStatusCode()) {
                log.info("httpRequest access success, StatusCode is:{}", response.getStatusLine()
                        .getStatusCode());
                String responseContent = EntityUtils.toString(entity);
                log.info("responseContent is :" + responseContent);
                return JSON.parseObject(responseContent, R.class);
            } else {
                log.error("httpRequest access fail ,StatusCode is:{}", response.getStatusLine().getStatusCode());
                return R.fail("status is " + response.getStatusLine().getStatusCode());
            }
        } catch (Exception e) {
            log.error("error :", e);
            return R.fail(e.getMessage());
        } finally {
            post.releaseConnection();
        }
    }
}
