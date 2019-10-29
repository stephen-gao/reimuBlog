$(document).ready(function () {
    var roleReq = {
        id:'',
        code:'',
        name:'',
        description:'',
        pid:'',
        sort:''
    };
    var permissionParents = [];
    var permissionTableId = "#permission-table";
    var url = "/permission/permission-page-data";
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
            $("#permissionModel").modal('show');
        },

        "click #permissionDelete": function (e, value, row, index) {
            $.get("/permission/permission-delete/"+row.id, function(res){
                if(res.code === '0000'){
                    permissionTable.refresh(permissionTableId)
                }
            });
        }
    };
    var columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left' , visible:false},
        {field: 'code', title: '编码', align: 'center'},
        {field: 'name', title: '名称', align: 'center'},
        {field: 'description', title: '描述', align: 'center'},
        {field: 'type', title: '类型', align: 'center',
            formatter:function (value) {
                if(value === 0){
                    return '叶子';
                }else if(value === 1){
                    return '根';
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
    var permissionTable = ReimuTable(window);
    permissionTable.initTable(permissionTableId,url,columns);
    //add
    $("#permissionBtn").click(function () {
        roleReq.id = $("#permissionId").val();
        roleReq.name = $("#permissionName").val();
        roleReq.code = $("#permissionCode").val();
        roleReq.description = $("#permissionDescription").val();
        roleReq.pid = $("#permissionPid").val();
        roleReq.sort = $("#permissionSort").val();
        var postUrl = roleReq.id !== ''&& roleReq.id !== null?'/permission/permission-edit':'/permission/permission-add';
        console.log(roleReq.id);
        $.ajax({
            type: 'POST',
            url: postUrl,
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(roleReq),
            dataType: 'json',
            success: function(res){
                if(res.code === '0000'){
                    $("#permissionModel").modal('hide');
                    permissionTable.refresh(permissionTableId);
                    clearForm();
                    $.message({
                        message:res.message,
                        type:'success'
                    });
                }
            }
        });
    });

    function clearForm(){
        $("#permissionId").val('');
        $("#permissionName").val('');
        $("#permissionCode").val('');
        $("#permissionDescription").val('');
        $("#permissionSort").val('');
        $("#permissionPid").val('root');
    }
    //预加载数据
    $.get("/permission/permission-parent", function(res){
        if(res.code === '0000'){
            permissionParents = res.data;
            if(permissionParents.length > 0){
                for(var i=0;i<permissionParents.length;i++){
                    $("#permissionPid").append('<option value="'+ permissionParents[i].id +'">'+ permissionParents[i].name+'</option>')
                }
            }
        }
    });
});