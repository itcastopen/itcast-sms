package com.itheima.sms.job;

public interface SendTimingSms {
    void execute(String timing) throws InterruptedException;
}
