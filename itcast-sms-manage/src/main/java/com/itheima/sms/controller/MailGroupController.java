package com.itheima.sms.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.sms.annotation.DefaultParams;
import com.itheima.tools.base.BaseController;
import com.itheima.tools.base.R;
import com.itheima.tools.database.mybatis.conditions.Wraps;
import com.itheima.tools.database.mybatis.conditions.query.LbqWrapper;
import com.itheima.sms.dto.MailGroupDTO;
import com.itheima.sms.entity.MailGroupEntity;
import com.itheima.sms.entity.MailListGroupEntity;
import com.itheima.sms.service.MailGroupService;
import com.itheima.sms.service.MailListGroupService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 通讯组
 *
 * @author 传智播客
 *
 */
@RestController
@RequestMapping("mailgroup")
@Api(tags = "通讯组")
public class MailGroupController extends BaseController {
    @Autowired
    private MailGroupService mailGroupService;
    @Autowired
    private MailListGroupService mailListGroupService;

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
    public R<Page<MailGroupEntity>> page(MailGroupDTO mailGroupDTO) {
        Page<MailGroupEntity> page = getPage();
        LbqWrapper<MailGroupEntity> wrapper = Wraps.lbQ();

        wrapper.like(MailGroupEntity::getName, mailGroupDTO.getName())
                .eq(MailGroupEntity::getType, mailGroupDTO.getType())
                .orderByDesc(MailGroupEntity::getCreateTime);

        mailGroupService.page(page, wrapper);
        return R.success(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public R<MailGroupEntity> get(@PathVariable("id") String id) {
        MailGroupEntity data = mailGroupService.getById(id);

        return R.success(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @DefaultParams
    public R save(@RequestBody MailGroupDTO entity) {

        mailGroupService.save(entity);

        updateMailList(entity);
        return R.success();
    }

    @PutMapping
    @ApiOperation("修改")
    @DefaultParams
    public R update(@RequestBody MailGroupDTO entity) {

        mailGroupService.updateById(entity);
        updateMailList(entity);
        return R.success();
    }

    private void updateMailList(MailGroupDTO entity) {
        if (!CollectionUtils.isEmpty(entity.getMailIds())) {
            LambdaQueryWrapper<MailListGroupEntity> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(MailListGroupEntity::getGroupId, entity.getId());
            mailListGroupService.remove(wrapper);
            List<MailListGroupEntity> mailListGroups = entity.getMailIds().stream().map(item -> {
                MailListGroupEntity mailListGroupEntity = new MailListGroupEntity();
                mailListGroupEntity.setGroupId(entity.getId());
                mailListGroupEntity.setListId(item);
                return mailListGroupEntity;
            }).collect(Collectors.toList());
            mailListGroupService.saveBatch(mailListGroups);
        }
    }

    @DeleteMapping
    @ApiOperation("删除")
    public R delete(@RequestBody List<String> ids) {

        mailGroupService.removeByIds(ids);
        ids.forEach(item -> {
            LambdaQueryWrapper<MailListGroupEntity> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(MailListGroupEntity::getGroupId, item);
            mailListGroupService.remove(wrapper);
        });
        return R.success();
    }

}
