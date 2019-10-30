$(document).ready(function () {
    let roleReq = {
        id: '',
        name: '',
        description: '',
        sort: ''
    };
    let rpReq = {
        roleId:'',
        permissionIds:[]
    };
    let roleTableId = "#role-table";
    let rolePageUrl = "/role/role-page-data";
    let roleAddUrl = '/role/role-add';
    let roleEditUrl = '/role/role-edit';
    let roleDelUrl = '/role/role-delete/';
    let rpSaveUrl = "/rolepermission/rp-save";
    let rpSelectedUrl = "/rolepermission/rp-tree/";
    //默认放columns前面，否则会注册不上
    window.operateEvents = {
        //修改
        "click #roleEdit": function (e, value, row, index) {
            console.log(row);
            $("#roleId").val(row.id);
            $("#roleName").val(row.name);
            $("#roleDescription").val(row.description);
            $("#roleSort").val(row.sort);
            $("#roleModel").modal('show');
        },
        "click #rolePermission": function (e, value, row, index) {
            clearRPForm();
            rpReq.roleId = row.id;
            //获取权限树
            $.get(rpSelectedUrl + row.id, function (res) {
                if (res.code === '0000') {
                    buildPermissionTree(res.data);
                }
            });
            $("#rolePermissionModal").modal('show');
        },
        "click #roleDelete": function (e, value, row, index) {
            REQUEST.get(roleDelUrl + row.id, function (res) {
                if (res.code === '0000') {
                    roleTable.refresh(roleTableId)
                }
            });
        }
    };
    //默认放columns前面，否则会注册不上
    var columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left', width: 300},
        {field: 'name', title: '名称', align: 'center'},
        {field: 'description', title: '描述', align: 'center'},
        {field: 'sort', title: '排序', align: 'center'},
        {
            field: 'option', title: '操作', align: 'center', width: 300, events: window.operateEvents,
            formatter: function (value, row, index) {
                let edit = '<button type="button" id="roleEdit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>  ';
                let rp = '<button type="button" id="rolePermission" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>授权</button>  ';
                let del = '<button type="button" id="roleDelete" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>  ';
                return edit + rp + del;
            }
        }
    ];
    let roleTable = ReimuTable(window);
    roleTable.initTable(roleTableId, rolePageUrl, columns);

    //add
    $("#roleBtn").click(function () {
        roleReq.id = $("#roleId").val();
        roleReq.name = $("#roleName").val();
        roleReq.description = $("#roleDescription").val();
        roleReq.sort = $("#roleSort").val();
        let postUrl = roleReq.id !== '' && roleReq.id !== null ? roleEditUrl : roleAddUrl;
        REQUEST.post(postUrl,roleReq,function (res) {
            if (res.code === '0000') {
                $("#roleModel").modal('hide');
                roleTable.refresh(roleTableId);
                clearForm();
                $.message({
                    message: res.message,
                    type: 'success'
                });
            }
        });
    });
    $("#rolePermissionBtn").click(function () {
        //授权
        let chkValue =[];
        $('input[name="SelectPermission"]:checked').each(function(){
            chkValue.push($(this).val());
        });
        rpReq.permissionIds = chkValue;
        REQUEST.post(rpSaveUrl,rpReq,function (res) {
            if (res.code === '0000') {
                $("#rolePermissionModal").modal('hide');
                clearRPForm();
                $.message({
                    message: res.message,
                    type: 'success'
                });
            }
        });
    });

    $("#roleCancelBtn").click(function () {
        clearForm();
        $("#roleModel").modal('hide');
    });

    function clearForm() {
        roleReq = {
            id: '',
            name: '',
            description: '',
            sort: ''
        };
        $("#roleId").val('');
        $("#roleName").val('');
        $("#roleDescription").val('');
        $("#roleSort").val('');
    }

    function clearRPForm(){
        rpReq = {
            roleId:'',
            permissions:[]
        };
        $(".select-rp-tree-group").remove();
    }


    //加载权限树
    function buildPermissionTree(permissionTree) {
        if(permissionTree === null || permissionTree.length <=0){
            return;
        }
        let inHtml = '';
        for (let i = 0; i < permissionTree.length; i++) {
            inHtml += '<div class="form-group select-rp-tree-group">';
            inHtml += '<div class="col-sm-2"><label><b>'+permissionTree[i].name+' :</b></label></div>';
            let list = permissionTree[i].list;
            if(list !== null){
                inHtml += '<div class="col-sm-10">';
                inHtml += '<div class="row">';
                for(let j = 0;j<list.length;j++){
                    if(j != 0 && j%4 == 0){
                        inHtml += '</div>';
                        inHtml += '<div class="row">';
                    }
                    let checked = list[j].checked;
                    inHtml += '<div class="col-sm-3"><label>';
                    inHtml += '<input type="checkbox" name="SelectPermission" value="'+list[j].id+'" class="ace ace-checkbox-2" ';
                    if(checked){
                        inHtml += 'checked="checked"';
                    }
                    inHtml += '/><span class="lbl">'+list[j].name+'</span>';
                    inHtml += '</label></div>';
                }
                inHtml += '</div>';
                inHtml += '</div>';
            }
            inHtml += '</div>';
        }
        $('#rolePermissionCheckForm').append(inHtml);

    }

});

