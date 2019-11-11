package com.reimu.service;

import com.reimu.model.vo.ShowVO;

public interface IndexService {

    ShowVO getIndexVO();

    ShowVO getPage(Integer pageNo);

    ShowVO getCategoryPage(Integer pageNo,String categoryId);

    ShowVO getOneShowById(String id);
}
