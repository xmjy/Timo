package com.linln.modules.order.service.impl;

import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.order.domain.Detail;
import com.linln.modules.order.repository.DetailRepository;
import com.linln.modules.order.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author albert.fang
 * @date 2021/01/27
 */
@Service
public class DetailServiceImpl implements DetailService {

    @Autowired
    private DetailRepository detailRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Detail getById(Long id) {
        return detailRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Detail> getPageList(Example<Detail> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return detailRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param detail 实体对象
     */
    @Override
    public Detail save(Detail detail) {
        return detailRepository.save(detail);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return detailRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}