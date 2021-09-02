package com.itheima.sms.enumeration;

import lombok.AllArgsConstructor;
import lombok.Getter;


/**
 * <p>
 * 模板类型 1：验证码，2：验证码
 * </p>
 */
@Getter
@AllArgsConstructor
public enum TemplateType {

    VERIFICATION(1, "验证码"),
    NOTICE(2, "通知"),
    MARKETING(3, "推广"),

    ;

    private int code;
    private String desc;

    public static TemplateType getDesc(int code) {
        for (TemplateType it : TemplateType.values()) {
            if (it.getCode() == code) {
                return it;
            }
        }
        return null;
    }
}
