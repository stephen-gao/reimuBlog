package com.reimu.service;

import com.reimu.model.vo.ShowVO;

public interface IndexService {

    ShowVO getIndexVO();

    ShowVO getPage(Integer pageNo);

    ShowVO getOneShowById(String id);
}
