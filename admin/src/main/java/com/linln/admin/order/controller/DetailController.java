package com.linln.admin.order.controller;

import com.linln.admin.order.validator.DetailValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.order.domain.Detail;
import com.linln.modules.order.service.DetailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author albert.fang
 * @date 2021/01/27
 */
@Controller
@RequestMapping("/order/detail")
public class DetailController {

    @Autowired
    private DetailService detailService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("order:detail:index")
    public String index(Model model, Detail detail) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("title", match -> match.contains())
                .withMatcher("remark", match -> match.contains());

        // 获取数据列表
        Example<Detail> example = Example.of(detail, matcher);
        Page<Detail> list = detailService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/order/detail/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("order:detail:add")
    public String toAdd() {
        return "/order/detail/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("order:detail:edit")
    public String toEdit(@PathVariable("id") Detail detail, Model model) {
        model.addAttribute("detail", detail);
        return "/order/detail/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"order:detail:add", "order:detail:edit"})
    @ResponseBody
    public ResultVo save(@Validated DetailValid valid, Detail detail) {
        // 复制保留无需修改的数据
        if (detail.getId() != null) {
            Detail beDetail = detailService.getById(detail.getId());
            EntityBeanUtil.copyProperties(beDetail, detail);
        }

        // 保存数据
        detailService.save(detail);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("order:detail:detail")
    public String toDetail(@PathVariable("id") Detail detail, Model model) {
        model.addAttribute("detail",detail);
        return "/order/detail/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("order:detail:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (detailService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}