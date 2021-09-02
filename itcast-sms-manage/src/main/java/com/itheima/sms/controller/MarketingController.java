package com.itheima.sms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.annotation.DefaultParams;
import com.itheima.tools.base.BaseController;
import com.itheima.tools.base.R;
import com.itheima.tools.database.mybatis.conditions.Wraps;
import com.itheima.tools.database.mybatis.conditions.query.LbqWrapper;
import com.itheima.sms.dto.MarketingDTO;
import com.itheima.sms.entity.MarketingEntity;
import com.itheima.sms.entity.ReceiveLogEntity;
import com.itheima.sms.entity.SendLogEntity;
import com.itheima.sms.entity.TemplateEntity;
import com.itheima.sms.entity.base.BaseEntity;
import com.itheima.sms.service.MarketingService;
import com.itheima.sms.service.ReceiveLogService;
import com.itheima.sms.service.SendLogService;
import com.itheima.sms.service.TemplateService;
import com.itheima.sms.dto.SmsBatchParamsDTO;
import com.itheima.sms.service.SmsSendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static com.itheima.tools.exception.code.ExceptionCode.BASE_VALID_PARAM;


/**
 * 营销短信
 *
 * @author 传智播客
 *
 */
@RestController
@RequestMapping("marketing")
@Api(tags = "营销短信")
@Slf4j
public class MarketingController extends BaseController {

    @Autowired
    private MarketingService marketingService;

    @Autowired
    private SmsSendService smsSendService;

    @Autowired
    private ReceiveLogService receiveLogService;

    @Autowired
    private SendLogService sendLogService;

    @Autowired
    private TemplateService templateService;

    /**
     * [查询] 分页查询
     *
     * @return
     * @author 传智播客
     *
     */
    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "current", value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = "size", value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = "排序字段", value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "排序方式", value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "startCreateTime", value = "开始时间（yyyy-MM-dd HH:mm:ss）", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "endCreateTime", value = "结束时间（yyyy-MM-dd HH:mm:ss）", paramType = "query", dataType = "String")
    })
    public R<Page<MarketingDTO>> page(MarketingDTO entity) {
        Page<MarketingEntity> page = getPage();
        LbqWrapper<MarketingEntity> wrapper = Wraps.lbQ();

        wrapper.like(StringUtils.isNotEmpty(entity.getTitle()), MarketingEntity::getTitle, entity.getTitle())
                .like(StringUtils.isNotEmpty(entity.getCreateUserName()), MarketingEntity::getCreateUserName, entity.getCreateUserName())
                .eq(entity.getStatus() != null, MarketingEntity::getStatus, entity.getStatus())
                .ge(getStartCreateTime() != null, BaseEntity::getCreateTime, getStartCreateTime())
                .le(getEndCreateTime() != null, BaseEntity::getCreateTime, getEndCreateTime())
                .orderByDesc(MarketingEntity::getCreateTime);

        marketingService.page(page, wrapper);
        List<MarketingEntity> record = page.getRecords();
        Page<MarketingDTO> resPage = new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        List<MarketingDTO> newRecord = record.stream().map(item -> {
            MarketingDTO marketingDTO = new MarketingDTO();
            BeanUtils.copyProperties(item, marketingDTO);
            TemplateEntity templateEntity = templateService.getByCode(item.getTemplate());
            try {
                if (templateEntity != null) {
                    String content = templateEntity.getContent();
                    if (StringUtils.isNotBlank(item.getContent())) {
                        JSONObject jsonObject = JSON.parseObject(item.getContent());
                        for (String key : jsonObject.keySet()) {
                            content = content.replaceAll("\\$\\{" + key + "}", jsonObject.getString(key));
                        }
                    }
                    marketingDTO.setContentText(content);
                }
            } catch (Exception e) {
            }
            return marketingDTO;
        }).collect(Collectors.toList());
        resPage.setRecords(newRecord);
        return success(resPage);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public R<MarketingDTO> get(@PathVariable("id") String id) {
        MarketingEntity data = marketingService.getById(id);

        MarketingDTO marketingDTO = new MarketingDTO();
        BeanUtils.copyProperties(data, marketingDTO);
        TemplateEntity templateEntity = templateService.getByCode(data.getTemplate());
        String content = templateEntity.getContent();
        if (StringUtils.isNotBlank(data.getContent())) {
            JSONObject jsonObject = JSON.parseObject(data.getContent());
            for (String key : jsonObject.keySet()) {
                content = content.replaceAll("\\$\\{" + key + "}", jsonObject.getString(key));
            }
        }
        marketingDTO.setContentText(content);

        return R.success(marketingDTO);
    }

    @PostMapping
    @ApiOperation("保存")
    @DefaultParams
    public R save(@RequestBody MarketingEntity entity) {
        if (StringUtils.isNotBlank(entity.getContent()) && entity.getContent().startsWith("[")) {
            JSONObject jsonObject = new JSONObject();
            JSONArray jsonArray = JSON.parseArray(entity.getContent());
            for (int i = 0; i < jsonArray.size(); i++) {
                jsonObject.putAll(jsonArray.getJSONObject(i));
            }
            entity.setContent(jsonObject.toJSONString());
        }
        if (StringUtils.isNotBlank(entity.getMobiles())) {
            Set<String> set = Arrays.asList(entity.getMobiles().split(",")).stream().collect(Collectors.toSet());
            entity.setMobileNumber(set.size());
            entity.setMobiles(String.join(",", set));
        }
        if (StringUtils.isBlank(entity.getCreateUserName())) {
            entity.setCreateUserName("赵丽");
        }
        marketingService.save(entity);

        return R.success();
    }

    @PutMapping
    @ApiOperation("修改")
    @DefaultParams
    public R update(@RequestBody MarketingEntity entity) {
        if (StringUtils.isNotBlank(entity.getContent()) && entity.getContent().startsWith("[")) {
            JSONObject jsonObject = new JSONObject();
            JSONArray jsonArray = JSON.parseArray(entity.getContent());
            for (int i = 0; i < jsonArray.size(); i++) {
                jsonObject.putAll(jsonArray.getJSONObject(i));
            }
            entity.setContent(jsonObject.toJSONString());
        }
        if (StringUtils.isNotBlank(entity.getMobiles())) {
            Set<String> set = Arrays.asList(entity.getMobiles().split(",")).stream().collect(Collectors.toSet());
            entity.setMobileNumber(set.size());
            entity.setMobiles(String.join(",", set));
        }

        marketingService.updateById(entity);

        return R.success();
    }

    @PutMapping("audit")
    @ApiOperation("审核")
    @DefaultParams
    public R audit(@RequestBody MarketingEntity entity) {

        if (1 == entity.getStatus()) {
            MarketingEntity marketingEntity = marketingService.getById(entity.getId());
            if (marketingEntity == null) {
                return R.fail("参数异常");
            }
            SmsBatchParamsDTO smsBatchParamsDTO = new SmsBatchParamsDTO();
            smsBatchParamsDTO.setMobile(Arrays.asList(marketingEntity.getMobiles().split(",")));
            smsBatchParamsDTO.addParams(JSON.parseObject(marketingEntity.getContent(), LinkedHashMap.class));
            smsBatchParamsDTO.addTemplate(marketingEntity.getTemplate());
            smsBatchParamsDTO.addSignature(marketingEntity.getSignature());
            smsBatchParamsDTO.setBatchCode(marketingEntity.getId());
            com.itheima.sms.dto.R r = smsSendService.batchSendSms(smsBatchParamsDTO);
            log.info("短信发送结果:{}", r);
            if (r.getIsError()) {
                return R.fail(r.getMsg());
            }
        }

        if (StringUtils.isBlank(entity.getUpdateUserName())) {
            entity.setUpdateUserName("李丹");
        }
        marketingService.updateById(entity);

        return R.success();
    }

    @PutMapping("reSend")
    @ApiOperation("重新发送")
    @DefaultParams
    public R reSend(@RequestBody MarketingEntity entity) {
        LambdaQueryWrapper<ReceiveLogEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ReceiveLogEntity::getBusiness, entity.getId());
        wrapper.eq(ReceiveLogEntity::getStatus, 0);
        List<ReceiveLogEntity> logList = receiveLogService.list(wrapper);
        List<String> apiLogIds = logList.stream().map(item -> item.getApiLogId()).collect(Collectors.toList());


        List<String> mobiles = logList.stream().map(item -> item.getMobile()).collect(Collectors.toList());
        entity = marketingService.getById(entity.getId());
        SmsBatchParamsDTO smsBatchParamsDTO = new SmsBatchParamsDTO();
        smsBatchParamsDTO.setMobile(mobiles);
        smsBatchParamsDTO.addParams(JSON.parseObject(entity.getContent(), LinkedHashMap.class));
        smsBatchParamsDTO.addTemplate(entity.getTemplate());
        smsBatchParamsDTO.addSignature(entity.getSignature());
        smsBatchParamsDTO.setBatchCode(entity.getId());
        com.itheima.sms.dto.R r = smsSendService.batchSendSms(smsBatchParamsDTO);
        log.info("短信发送结果:{}", r);
        if (r.getIsError()) {
            return R.fail(r.getMsg());
        }

        receiveLogService.remove(wrapper);

        LambdaQueryWrapper<SendLogEntity> sendWrapper = new LambdaQueryWrapper<>();
        sendWrapper.in(SendLogEntity::getApiLogId, apiLogIds);
        sendLogService.remove(sendWrapper);

        return R.success();
    }

    @DeleteMapping
    @ApiOperation("删除")
    public R delete(@RequestBody List<String> ids) {

        marketingService.removeByIds(ids);

        return R.success();
    }

    /**
     * 导入
     */
    @PostMapping("upload")
    @ApiOperation("导入")
    public R<? extends Object> upload(@RequestParam(value = "file") MultipartFile file) {
        if (file.isEmpty()) {
            return fail(BASE_VALID_PARAM.build("导入内容为空"));
        }
        return marketingService.upload(file);
    }
}
