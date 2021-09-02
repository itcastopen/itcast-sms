package com.itheima.sms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.annotation.DefaultParams;
import com.itheima.tools.base.BaseController;
import com.itheima.tools.base.R;
import com.itheima.tools.database.mybatis.conditions.Wraps;
import com.itheima.tools.database.mybatis.conditions.query.LbqWrapper;
import com.itheima.sms.dto.SensitiveListDTO;
import com.itheima.sms.entity.SensitiveListEntity;
import com.itheima.sms.service.SensitiveListService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 敏感词
 *
 * @author 传智播客
 *
 */
@RestController
@RequestMapping("sensitivelist")
@Api(tags = "敏感词")
public class SensitiveListController extends BaseController {
    @Autowired
    private SensitiveListService sensitiveListService;

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
    public R<Page<SensitiveListEntity>> page(SensitiveListDTO sensitiveListDTO) {
        Page<SensitiveListEntity> page = getPage();
        LbqWrapper<SensitiveListEntity> wrapper = Wraps.lbQ();

        wrapper.like(SensitiveListEntity::getContent, sensitiveListDTO.getContent())
                .like(SensitiveListEntity::getType, sensitiveListDTO.getType())
                .orderByDesc(SensitiveListEntity::getCreateTime);

        sensitiveListService.page(page, wrapper);
        return R.success(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public R<SensitiveListEntity> get(@PathVariable("id") String id) {
        SensitiveListEntity data = sensitiveListService.getById(id);

        return R.success(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @DefaultParams
    public R save(@RequestBody SensitiveListEntity entity) {

        sensitiveListService.save(entity);

        return R.success();
    }

    @PutMapping
    @ApiOperation("修改")
    @DefaultParams
    public R update(@RequestBody SensitiveListEntity entity) {

        sensitiveListService.updateById(entity);

        return R.success();
    }

    @DeleteMapping
    @ApiOperation("删除")
    public R delete(@RequestBody List<String> ids) {

        sensitiveListService.removeByIds(ids);

        return R.success();
    }
}
