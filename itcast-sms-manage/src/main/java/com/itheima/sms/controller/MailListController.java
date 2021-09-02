package com.itheima.sms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.annotation.DefaultParams;
import com.itheima.tools.base.BaseController;
import com.itheima.tools.base.R;
import com.itheima.tools.database.mybatis.conditions.Wraps;
import com.itheima.tools.database.mybatis.conditions.query.LbqWrapper;
import com.itheima.sms.dto.MailListDTO;
import com.itheima.sms.entity.MailListEntity;
import com.itheima.sms.service.MailListService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 通讯录
 *
 * @author 传智播客
 *
 */
@RestController
@RequestMapping("maillist")
@Api(tags = "通讯录")
public class MailListController extends BaseController {
    @Autowired
    private MailListService mailListService;

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
    public R<Page<MailListEntity>> page(MailListDTO mailListDTO) {
        Page<MailListEntity> page = getPage();
        LbqWrapper<MailListEntity> wrapper = Wraps.lbQ();

        wrapper.like(MailListEntity::getName, mailListDTO.getName())
                .like(MailListEntity::getType, mailListDTO.getType())
                .eq(MailListEntity::getDept, mailListDTO.getDept())
                .like(MailListEntity::getEmail, mailListDTO.getEmail())
                .like(MailListEntity::getPhone, mailListDTO.getPhone())
                .like(MailListEntity::getQq, mailListDTO.getQq())
                .like(MailListEntity::getWechat, mailListDTO.getWechat())
                .like(MailListEntity::getPosition, mailListDTO.getPosition())
                .orderByDesc(MailListEntity::getCreateTime);

        mailListService.page(page, wrapper);
        return R.success(page);
    }

    @GetMapping("list")
    @ApiOperation("自定义分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "current", value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = "size", value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = "排序字段", value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "排序方式", value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "startCreateTime", value = "开始时间（yyyy-MM-dd HH:mm:ss）", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "endCreateTime", value = "结束时间（yyyy-MM-dd HH:mm:ss）", paramType = "query", dataType = "String")
    })
    public R<Page<MailListEntity>> list(MailListDTO mailListDTO) {
        Page<MailListEntity> page = getPage();

        mailListService.listByPage(page, mailListDTO);
        return R.success(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public R<MailListEntity> get(@PathVariable("id") String id) {
        MailListEntity data = mailListService.getById(id);

        return R.success(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @DefaultParams
    public R save(@RequestBody MailListEntity entity) {

        mailListService.save(entity);

        return R.success();
    }

    @PutMapping
    @ApiOperation("修改")
    @DefaultParams
    public R update(@RequestBody MailListEntity entity) {

        mailListService.updateById(entity);

        return R.success();
    }

    @DeleteMapping
    @ApiOperation("删除")
    public R delete(@RequestBody List<String> ids) {

        mailListService.removeByIds(ids);

        return R.success();
    }

}
