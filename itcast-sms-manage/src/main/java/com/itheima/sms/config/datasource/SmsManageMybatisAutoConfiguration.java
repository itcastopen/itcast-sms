package com.itheima.sms.config.datasource;


import com.itheima.tools.database.datasource.BaseMybatisConfiguration;
import com.itheima.tools.database.properties.DatabaseProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;

/**
 * 配置一些拦截器
 */
@Configuration
@Slf4j
public class SmsManageMybatisAutoConfiguration extends BaseMybatisConfiguration {


    public SmsManageMybatisAutoConfiguration(DatabaseProperties databaseProperties) {
        super(databaseProperties);
    }

}
