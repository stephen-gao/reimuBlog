$(document).ready(function () {
    var roleReq = {
        id: '',
        name: '',
        description: '',
        sort: ''
    };
    var roleTableId = "#role-table";
    var url = "/role/role-page-data";
    var permissionTree = [];
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
        "click #rolePermission": function () {
            $("#rolePermissionModal").modal('show');
        },
        "click #roleDelete": function (e, value, row, index) {
            $.get("/role/role-delete/" + row.id, function (res) {
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
                var edit = '<button type="button" id="roleEdit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>  ';
                var rp = '<button type="button" id="rolePermission" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>授权</button>  ';
                var del = '<button type="button" id="roleDelete" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>  ';
                return edit + rp + del;
            }
        }
    ];
    var roleTable = ReimuTable(window);
    roleTable.initTable(roleTableId, url, columns);

    //add
    $("#roleBtn").click(function () {
        roleReq.id = $("#roleId").val();
        roleReq.name = $("#roleName").val();
        roleReq.description = $("#roleDescription").val();
        roleReq.sort = $("#roleSort").val();
        var postUrl = roleReq.id !== '' && roleReq.id !== null ? '/role/role-edit' : '/role/role-add';
        console.log(roleReq.id);
        $.ajax({
            type: 'POST',
            url: postUrl,
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(roleReq),
            dataType: 'json',
            success: function (res) {
                if (res.code === '0000') {
                    $("#roleModel").modal('hide');
                    roleTable.refresh(roleTableId);
                    clearForm();
                    $.message({
                        message: res.message,
                        type: 'success'
                    });
                }
            }
        });
    });

    function clearForm() {
        $("#roleId").val('');
        $("#roleName").val('');
        $("#roleDescription").val('');
        $("#roleSort").val('');
    }


    //预加载数据
    $.get("/permission/permission-tree", function (res) {
        if (res.code === '0000') {
            console.log(res.data);
            permissionTree = res.data;
            for (var i = 0; i < permissionTree.length; i++) {
                $('#rolePermissionCheckBox').append('<div class="row">')
                $('#rolePermissionCheckBox').append('<div class="col-sm-2">'+permissionTree[i].name+'</div>')
                var list = permissionTree[i].list;
                if(list !== null){
                    for(var j = 0;j<list.length;j++){
                        $('#rolePermissionCheckBox').append('<div class="col-sm-2"><span>'+permissionTree[i].name+'</span></div>')
                    }
                }
                $('#rolePermissionCheckBox').append('</div>')
            }

        }
    });

});

