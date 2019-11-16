$(document).ready(function () {
    let specialReq = {
        id:'',
        name:'',
        description:'',
        sort:''
    };
    let specialTableId = '#special-table';
    let pageUrl = '/manage/special/list';
    let specialEditUrl = '/manage/special/update';
    let specialAddUrl = '/manage/special/add';
    let specialDelUrl = '/manage/special/delete/';
    //默认放columns前面，否则会注册不上
    window.operateEvents= {
        //修改
        "click #specialEdit": function (e, value, row, index) {
            console.log(row);
            $("#specialId").val(row.id);
            $("#specialName").val(row.name);
            $("#specialDescription").val(row.description);
            $("#specialSort").val(row.sort);
            $("#specialModel").modal('show');
        },

        "click #specialDelete": function (e, value, row, index) {
            REQUEST.get(specialDelUrl+row.id, function(res){
                specialTable.refresh(specialTableId)
            });
        }
    };
    let columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left' , visible:false},
        {field: 'name', title: '名称', align: 'center'},
        {field: 'description', title: '描述', align: 'center'},
        {field: 'url', title: '地址', align: 'center'},
        {field: 'sort', title: '排序', align: 'center'},
        {
            field: 'option', title: '操作', align: 'center', width:200, events:window.operateEvents,
            formatter: function (value, row, index) {
                var d = '<button id="specialEdit" type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>    ';
                var f = '<button id="specialDelete" type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>';
                return d + f;
            }
        }
    ];
    let specialTable = ReimuTable(window);
    specialTable.initTable(specialTableId,pageUrl,columns);
    //add
    $("#specialBtn").click(function () {
        specialReq.id = $("#specialId").val();
        specialReq.name = $("#specialName").val();
        specialReq.description = $("#specialDescription").val();
        specialReq.sort = $("#specialSort").val();
        let postUrl = specialReq.id !== ''&& specialReq.id !== null?specialEditUrl:specialAddUrl;

        REQUEST.post(postUrl,specialReq,function (res) {
            $("#specialModel").modal('hide');
            specialTable.refresh(specialTableId);
            clearForm();
            $.message({
                message:res.message,
                type:'success'
            });
        });
    });

    $("#specialCancel").click(function () {
        clearForm();
        $("#specialModel").modal('hide');
    });

    function clearForm(){
        specialReq = {
            id:'',
            name:'',
            description:'',
        };
        $("#specialId").val('');
        $("#specialName").val('');
        $("#specialDescription").val('');
    }

});