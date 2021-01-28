package com.linln.modules.order.service;

import com.linln.common.enums.StatusEnum;
import com.linln.modules.order.domain.Detail;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author albert.fang
 * @date 2021/01/27
 */
public interface DetailService {

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<Detail> getPageList(Example<Detail> example);

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    Detail getById(Long id);

    /**
     * 保存数据
     * @param detail 实体对象
     */
    Detail save(Detail detail);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}