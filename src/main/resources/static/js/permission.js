$(document).ready(function () {
    let permissionReq = {
        id:'',
        code:'',
        name:'',
        icon:'',
        type:'',
        description:'',
        pid:'',
        sort:''
    };
    let permissionParents = [];
    let permissionTableId = '#permission-table';
    let pageUrl = '/permission/permission-page-data';
    let permissionParentUrl = '/permission/permission-parent';
    let permissionEditUrl = '/permission/permission-edit';
    let permissionAddUrl = '/permission/permission-add';
    let permissionDelUrl = '/permission/permission-delete/';
    //默认放columns前面，否则会注册不上
    window.operateEvents= {
        //修改
        "click #permissionEdit": function (e, value, row, index) {
            console.log(row);
            $("#permissionId").val(row.id);
            $("#permissionName").val(row.name);
            $("#permissionCode").val(row.code);
            $("#permissionDescription").val(row.description);
            $("#permissionSort").val(row.sort);
            $("#permissionPid").val(row.pid);
            $("#permissionType").val(row.type);
            $("#permissionIcon").val(row.icon);
            $("#permissionModel").modal('show');
        },

        "click #permissionDelete": function (e, value, row, index) {
            REQUEST.get(permissionDelUrl+row.id, function(res){
                if(res.code === '0000'){
                    permissionTable.refresh(permissionTableId)
                }
            });
        }
    };
    let columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left' , visible:false},
        {field: 'name', title: '名称', align: 'center'},
        {field: 'code', title: '编码', align: 'center'},
        {field: 'description', title: '描述', align: 'center'},
        {field: 'type', title: '类型', align: 'center',
            formatter:function (value) {
                if(value === 0){
                    return '根菜单';
                }else if(value === 1){
                    return '子菜单';
                }else if(value === 2){
                    return '接口';
                }
                return '未定义';
            }
        },
        {field: 'icon', title: '图标', align: 'center'},
        {field: 'sort', title: '排序', align: 'center'},
        {
            field: 'option', title: '操作', align: 'center', width:200, events:window.operateEvents,
            formatter: function (value, row, index) {
                var d = '<button id="permissionEdit" type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>    ';
                var f = '<button id="permissionDelete" type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>';
                return d + f;
            }
        }
    ];
    let permissionTable = ReimuTable(window);
    permissionTable.initTable(permissionTableId,pageUrl,columns);
    //add
    $("#permissionBtn").click(function () {
        permissionReq.id = $("#permissionId").val();
        permissionReq.name = $("#permissionName").val();
        permissionReq.code = $("#permissionCode").val();
        permissionReq.description = $("#permissionDescription").val();
        permissionReq.pid = $("#permissionPid").val();
        permissionReq.sort = $("#permissionSort").val();
        permissionReq.type = $("#permissionType").val();
        permissionReq.icon = $("#permissionIcon").val();
        let postUrl = permissionReq.id !== ''&& permissionReq.id !== null?permissionEditUrl:permissionAddUrl;

        REQUEST.post(postUrl,permissionReq,function (res) {
            if(res.code === '0000'){
                $("#permissionModel").modal('hide');
                permissionTable.refresh(permissionTableId);
                clearForm();
                $.message({
                    message:res.message,
                    type:'success'
                });
            }
        });
    });

    $("#permissionCancel").click(function () {
        clearForm();
        $("#permissionModel").modal('hide');
    });

    function clearForm(){
        permissionReq = {
            id:'',
            code:'',
            name:'',
            icon:'',
            type:'',
            description:'',
            pid:'',
            sort:''
        };
        $("#permissionId").val('');
        $("#permissionName").val('');
        $("#permissionCode").val('');
        $("#permissionDescription").val('');
        $("#permissionSort").val('');
        $("#permissionPid").val('root');
        $("#permissionType").val('0');
        $("#permissionIcon").val('');
    }
    //预加载数据
    REQUEST.get(permissionParentUrl, function(res){
        if(res.code === '0000'){
            permissionParents = res.data;
            if(permissionParents.length > 0){
                for(let i=0;i<permissionParents.length;i++){
                    $("#permissionPid").append('<option value="'+ permissionParents[i].id +'">'+ permissionParents[i].name+'</option>')
                }
            }
        }
    });
});