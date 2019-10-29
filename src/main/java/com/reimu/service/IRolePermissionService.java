package com.reimu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.reimu.entity.RolePermission;
import com.reimu.model.tree.TreeItem;
import com.reimu.model.vo.PermissionVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
public interface IRolePermissionService extends IService<RolePermission> {

    List<PermissionVO> initPermissionSelectTree(String roleId);

    List<TreeItem> initMenuTree(String userId);
}
