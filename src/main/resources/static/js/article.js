$(document).ready(function () {
    let articleReq = {
        id: '',
        name: '',
        description: '',
    };
    let articleTableId = '#article-table';
    let pageUrl = '/article/list';
    let articleEditUrl = '/article/update';
    let articleDelUrl = '/article/delete/';
    //默认放columns前面，否则会注册不上
    window.operateEvents = {
        //修改
        "click #articleEdit": function (e, value, row, index) {
            loadPage("/common/edit-page/"+row.id,"文章编辑");
        },

        "click #articleDelete": function (e, value, row, index) {
            REQUEST.get(articleDelUrl + row.id, function (res) {
                articleTable.refresh(articleTableId)
            });
        }
    };
    let columns = [
        {checkbox: true},
        {field: 'id', title: 'ID', align: 'left', visible: false},
        {field: 'title', title: '标题', align: 'center'},
        {field: 'description', title: '描述', align: 'center'},
        {field: 'viewsNum', title: '浏览量', align: 'center'},
        {field: 'starNum', title: '点赞', align: 'center'},
        {field: 'commentNum', title: '评论量', align: 'center'},
        {
            field: 'status', title: '状态', align: 'center',
            formatter: function (value) {
                if (value === 0) {
                    return '草稿';
                } else if (value === 1) {
                    return '发布';
                } else if (value === 2) {
                    return '删除';
                }
                return '';
            }
        },
        {
            field: 'createTime', title: '创建时间', align: 'center'
        },
        {
            field: 'option', title: '操作', align: 'center', width: 200, events: window.operateEvents,
            formatter: function (value, row, index) {
                var d = '<div id="articleEdit" type="button" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</div>    ';
                var f = '<button id="articleDelete" type="button" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>';
                return d + f;
            }
        }
    ];
    let articleTable = ReimuTable(window);
    articleTable.initTable(articleTableId, pageUrl, columns);
    //add
    $("#articleBtn").click(function () {
        articleReq.id = $("#articleId").val();
        articleReq.name = $("#articleName").val();
        articleReq.description = $("#articleDescription").val();
        let postUrl = articleReq.id !== '' && articleReq.id !== null ? articleEditUrl : articleAddUrl;

        REQUEST.post(postUrl, articleReq, function (res) {
            $("#articleModel").modal('hide');
            articleTable.refresh(articleTableId);
            clearForm();
            $.message({
                message: res.message,
                type: 'success'
            });
        });
    });

    $("#articleCancel").click(function () {
        clearForm();
        $("#articleModel").modal('hide');
    });

    function clearForm() {
        articleReq = {
            id: '',
            name: '',
            description: '',
        };
        $("#articleId").val('');
        $("#articleName").val('');
        $("#articleDescription").val('');
    }

});