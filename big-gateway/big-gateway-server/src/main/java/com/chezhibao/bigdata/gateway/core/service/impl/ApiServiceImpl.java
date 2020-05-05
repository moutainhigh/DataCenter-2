package com.chezhibao.bigdata.gateway.core.service.impl;

import com.chezhibao.bigdata.gateway.bo.ApiInfoBO;
import com.chezhibao.bigdata.gateway.core.service.RedisApiServiceDelegate;
import com.chezhibao.bigdata.gateway.pojo.ApiInfo;
import com.chezhibao.bigdata.gateway.core.service.ApiService;
import com.chezhibao.bigdata.gateway.core.service.ApiServiceDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author WangCongJun
 * Created by WangCongJun on 2019/2/20.
 */
@Service
public class ApiServiceImpl implements ApiService {

    @Autowired
    private ApiServiceDelegate apiServiceDelegate;

    @Autowired
    private RedisApiServiceDelegate redisApiServiceDelegate;

    @Override
    public ApiInfo getApiInfo(ApiInfoBO apiInfoBO) {
//        return apiServiceDelegate.doGetApiInfo(apiInfoBO);
        return redisApiServiceDelegate.doGetApiInfo(apiInfoBO);
    }
}
