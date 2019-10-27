function ReimuTable(window){

    function initTable(tableId,url,tableColumns){
        $(tableId).bootstrapTable({
            url: url,     //请求后台的URL（*）
            method: 'post',                 //请求方式（*）
            contentType: 'application/json',
            classes: ' table table-bordered table-hover table-striped',// 表格样式
            pagination: true,       //显示分页
            paginationPreText: '上一页',
            paginationNextText: '下一页',
            locale: 'zh-CN',
            sidePagination: "server", //服务端分页
            pageNumber: 1,  //初始化加载第一页，默认第一页
            pageSize: 10,  //每页的记录行数（*）
            pageList: [10, 15, 20, 30], //可供选择的每页的行数（*）
            iconSize: 'xs',
            buttonsClass: 'primary',
            selectItemName: 'id',//复选框选中字段
            queryParamsType: 'pageNumber',
            columns: tableColumns,
            responseHandler: function (res) {
                return {                            //return bootstrap-table能处理的数据格式
                    "total": res.data.total,
                    "rows": res.data.records
                }
            }
        })
    }
    
    function refresh(tableId) {
        $(tableId).bootstrapTable('refresh');
    }

    return {initTable: initTable,refresh:refresh};

}