package com.linln.admin.order.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotNull;

/**
 * @author albert.fang
 * @date 2021/01/27
 */
@Data
public class DetailValid implements Serializable {

    private Long id;
}