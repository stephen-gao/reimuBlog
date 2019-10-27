$(document).ready(function () {
    var userTableId = "#user-table";
    var url = "/user/user-page-data";
    var columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left'},
        {field: 'photo', title: '头像', align: 'left'},
        {field: 'username', title: '用户名', align: 'left'},
        {field: 'nickname', title: '昵称', align: 'center'},
        {field: 'email', title: '邮箱', align: 'center'},
        {field: 'gender', title: '性别', align: 'center',
            formatter:function (value) {
                if(value === 0){
                    return '男';
                }else if(value === 1){
                    return '女';
                }
                return '保密';
            }
        },
        {
            field: 'option', title: '操作', align: 'center', width:200,
            formatter: function (value, row, index) {
                var d = '<button type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>    ';
                var f = '<button type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-lock bigger-100"></i>冻结</button>';
                return d + f;
            }
        }
    ];

    var userTable = ReimuTable(window);
    userTable.initTable(userTableId,url,columns)

});