$(document).ready(function () {
    let userReq = {
        id:'',
        username:'',
        nickname:'',
        email:'',
        gender:'',
        status:'',
        information:'',
        roleId:''
    };
    let roleList = [];
    let userTableId = "#user-table";
    let pageUrl = "/user/user-page-data";
    let addUrl = "/user/user-add";
    let editUrl = "/user/user-edit";
    let userDelUrl = "/user/user-delete/";
    let roleAllUrl = "/role/list/all";

    //默认放columns前面，否则会注册不上
    window.operateEvents = {
        //修改
        "click #userEdit": function (e, value, row, index) {
            $("#userId").val(row.id);
            $("#userUsername").val(row.username);
            $("#userNickname").val(row.nickname);
            $("#userEmail").val(row.email);
            $("#userGender").val(row.gender);
            $("#userInformation").val(row.information);
            $("#userRoleId").val(row.roleId);
            $("#userModal").modal('show');
        },
        "click #userDelete": function (e, value, row, index) {
            REQUEST.get(userDelUrl + row.id, function (res) {
                userTable.refresh(userTableId)
            });
        }
    };

    let columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left',visible: false},
        {field: 'photo', title: '头像', align: 'left'},
        {field: 'username', title: '用户名', align: 'left'},
        {field: 'nickname', title: '昵称', align: 'center'},
        {field: 'email', title: '邮箱', align: 'center'},
        {
            field: 'gender', title: '性别', align: 'center',
            formatter: function (value) {
                if (value === 0) {
                    return '男';
                } else if (value === 1) {
                    return '女';
                }
                return '保密';
            }
        },
        {field: 'status', title: '状态', align: 'center'},
        {field: 'information', title: '状态', align: 'center',visible: false},
        {
            field: 'option', title: '操作', align: 'center', width: 200,events: window.operateEvents,
            formatter: function (value, row, index) {
                let d = '<button id="userEdit" type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>    ';
                let f = '<button id="userDelete" type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>';
                return d + f;
            }
        }
    ];

    let userTable = ReimuTable(window);
    userTable.initTable(userTableId, pageUrl, columns);

    $("#userBtn").click(function () {
        userReq.id = $("#userId").val();
        userReq.username = $("#userUsername").val();
        userReq.password = $("#userPassword").val();
        userReq.nickname = $("#userNickname").val();
        userReq.email = $("#userEmail").val();
        userReq.gender = $("#userGender").val();
        userReq.information = $("#userInformation").val();
        userReq.roleId = $("#userRoleId").val();
        let postUrl = userReq.id !=='' && userReq.id !== null ? editUrl: addUrl;
        REQUEST.post(postUrl,userReq,function (res) {
            $("#userModal").modal('hide');
            userTable.refresh(userTableId);
            clearForm();
            $.message({
                message: res.message,
                type: 'success'
            });
        });
    });

    $("#userCancelBtn").click(function () {
        $("#userModal").modal('hide');
        clearForm();
    });

    function clearForm() {
        userReq = {
            id:'',
            username:'',
            password:'',
            nickname:'',
            email:'',
            gender:'',
            status:'',
            information:'',
            roleId:''
        };
        $("#userId").val('');
        $("#userUsername").val('');
        $("#userPassword").val('');
        $("#userNickname").val('');
        $("#userEmail").val('');
        $("#userGender").val('2');
        $("#userRoleId").val('');
        $("#userInformation").val('');
    }

    REQUEST.get(roleAllUrl,function (res) {
        roleList = res.data;
        for(let i = 0;i<roleList.length;i++){
            $("#userRoleId").append('<option value="'+ roleList[i].id +'">'+ roleList[i].name+'</option>')
        }
    })



});