$(document).ready(function () {
    let categoryReq = {
        id:'',
        name:'',
        description:'',
        sort:''
    };
    let categoryTableId = '#category-table';
    let pageUrl = '/manage/category/list';
    let categoryEditUrl = '/manage/category/update';
    let categoryAddUrl = '/manage/category/add';
    let categoryDelUrl = '/manage/category/delete/';
    //默认放columns前面，否则会注册不上
    window.operateEvents= {
        //修改
        "click #categoryEdit": function (e, value, row, index) {
            console.log(row);
            $("#categoryId").val(row.id);
            $("#categoryName").val(row.name);
            $("#categoryDescription").val(row.description);
            $("#categorySort").val(row.sort);
            $("#categoryModel").modal('show');
        },

        "click #categoryDelete": function (e, value, row, index) {
            REQUEST.get(categoryDelUrl+row.id, function(res){
                categoryTable.refresh(categoryTableId)
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
                var d = '<button id="categoryEdit" type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>    ';
                var f = '<button id="categoryDelete" type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>';
                return d + f;
            }
        }
    ];
    let categoryTable = ReimuTable(window);
    categoryTable.initTable(categoryTableId,pageUrl,columns);
    //add
    $("#categoryBtn").click(function () {
        categoryReq.id = $("#categoryId").val();
        categoryReq.name = $("#categoryName").val();
        categoryReq.description = $("#categoryDescription").val();
        categoryReq.sort = $("#categorySort").val();
        let postUrl = categoryReq.id !== ''&& categoryReq.id !== null?categoryEditUrl:categoryAddUrl;

        REQUEST.post(postUrl,categoryReq,function (res) {
            $("#categoryModel").modal('hide');
            categoryTable.refresh(categoryTableId);
            clearForm();
            $.message({
                message:res.message,
                type:'success'
            });
        });
    });

    $("#categoryCancel").click(function () {
        clearForm();
        $("#categoryModel").modal('hide');
    });

    function clearForm(){
        categoryReq = {
            id:'',
            name:'',
            description:'',
        };
        $("#categoryId").val('');
        $("#categoryName").val('');
        $("#categoryDescription").val('');
    }

});