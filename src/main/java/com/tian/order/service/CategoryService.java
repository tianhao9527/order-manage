package com.tian.order.service;

import com.tian.common.pojo.Pie;
import com.tian.common.pojo.Result;
import com.tian.order.pojo.Category;

import java.util.List;

public interface CategoryService {

    List<Category> getIncomeOrExpenditure(Integer category_type,Long userId);


    List<Category> selectCategoryPage(int i, int pageSize);

    Result update(Category category);

    Result addCategory(Category category);

    Result delete(Long id);

    Category selectCategoryById(Long categoryId);

    List<Pie> showPie(Long userId);
}
