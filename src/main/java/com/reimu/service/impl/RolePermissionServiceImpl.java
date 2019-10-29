package com.reimu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.reimu.dao.PermissionMapper;
import com.reimu.entity.Permission;
import com.reimu.entity.RolePermission;
import com.reimu.dao.RolePermissionMapper;
import com.reimu.model.tree.TreeItem;
import com.reimu.model.vo.PermissionVO;
import com.reimu.service.IRolePermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色权限表  服务实现类
 * </p>
 *
 * @author gaosheng
 * @since 2019-10-22
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements IRolePermissionService {

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<PermissionVO> initPermissionSelectTree(String roleId) {
        List<PermissionVO> tree = new ArrayList<>();
        // 查询已经选中的节点
        QueryWrapper selectWrapper = new QueryWrapper();
        selectWrapper.eq("role_id", roleId);
        List<RolePermission> selectedlist = rolePermissionMapper.selectList(selectWrapper);

        // 查询所有的父节点
        QueryWrapper treeWrapper = new QueryWrapper();
        treeWrapper.eq("pid", "root");
        treeWrapper.eq("type", 0);
        treeWrapper.orderByAsc("sort");
        List<Permission> pList = permissionMapper.selectList(treeWrapper);
        pList.forEach(po -> {
            PermissionVO vo = new PermissionVO();
            BeanUtils.copyProperties(po, vo);
            List<PermissionVO> subvos = new ArrayList<>();
            // 查询父节点下的子节点
            QueryWrapper wrap = new QueryWrapper();
            wrap.eq("pid", vo.getId());
            wrap.orderByAsc("type");
            wrap.orderByAsc("sort");
            List<Permission> subs = permissionMapper.selectList(wrap);
            // 构建节点树
            subs.forEach(sub -> {
                PermissionVO subVO = new PermissionVO();
                BeanUtils.copyProperties(sub, subVO);
                // 判断子节点是否被选中
                subVO.setChecked(isSelected(selectedlist, sub.getId()));
                subvos.add(subVO);
            });
            vo.setList(subvos);
            tree.add(vo);
        });
        return tree;
    }

    @Override
    public List<TreeItem> initMenuTree(String userId) {
        // 查询该用户所属角色的授权节点
        List<RolePermission> rolePermissions = rolePermissionMapper.getRPByUserId(userId);
        // 查询所有的父节点
        QueryWrapper pWrapper = new QueryWrapper();
        pWrapper.eq("pid", "root");
        pWrapper.orderByAsc("sort");
        List<Permission> pList = permissionMapper.selectList(pWrapper);
        // 构建树节点
        List<TreeItem> pTree = new ArrayList<>();
        pList.forEach(p -> {
            TreeItem pItem = new TreeItem();
            pItem.setId(p.getId());
            pItem.setCode(p.getCode());
            pItem.setText(p.getName());
            pItem.setPid(p.getPid());
            pItem.setType(p.getType());
            pItem.setIcon(p.getIcon());
            // 查询所有子节点
            QueryWrapper cWrapper = new QueryWrapper();
            cWrapper.eq("pid", p.getId());
            cWrapper.eq("type", 1);
            cWrapper.orderByAsc("sort");
            List<Permission> cList = permissionMapper.selectList(cWrapper);
            // 构建树
            List<TreeItem> cTree = new ArrayList<>();
            cList.forEach(c -> {
                if(isSelected(rolePermissions,c.getId())) {
                    TreeItem cItem = new TreeItem();
                    cItem.setId(c.getId());
                    cItem.setPid(c.getPid());
                    cItem.setCode(c.getCode());
                    cItem.setText(c.getName());
                    cItem.setType(c.getType());
                    cItem.setName(p.getName()+","+c.getName());
                    cTree.add(cItem);
                }
            });
            if(pItem.getType() == 0 && !CollectionUtils.isEmpty(cTree)){
                pItem.setChildren(cTree);
                pTree.add(pItem);
            }
        });

        return pTree;
    }

    private boolean isSelected(List<RolePermission> list, String pid) {

        if (CollectionUtils.isEmpty(list)) {
            return false;
        }
        for (RolePermission rp : list) {
            if (rp.getPermissionId().equals(pid)) {
                return true;
            }
        }
        return false;
    }
}
