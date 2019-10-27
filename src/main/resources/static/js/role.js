$(document).ready(function () {
    var roleReq = {
        id:'',
        name:'',
        description:'',
        sort:''
    };
    var roleTableId = "#role-table";
    var url = "/role/role-page-data";
    var permissionTree = [];
    //默认放columns前面，否则会注册不上
    window.operateEvents= {
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
            $.get("/role/role-delete/"+row.id, function(res){
                if(res.code === '0000'){
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
            field: 'option', title: '操作', align: 'center', width:300, events:window.operateEvents,
            formatter: function (value, row, index) {
                var edit = '<button type="button" id="roleEdit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>编辑</button>  ';
                var rp = '<button type="button" id="rolePermission" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-pencil bigger-100"></i>授权</button>  ';
                var del = '<button type="button" id="roleDelete" class="btn btn-danger btn-sm"><i class="ace-icon fa fa-trash-o bigger-100"></i>删除</button>  ';
                return edit + rp + del;
            }
        }
    ];
    var roleTable = ReimuTable(window);
    roleTable.initTable(roleTableId,url,columns);

    //add
    $("#roleBtn").click(function () {
        roleReq.id = $("#roleId").val();
        roleReq.name = $("#roleName").val();
        roleReq.description = $("#roleDescription").val();
        roleReq.sort = $("#roleSort").val();
        var postUrl = roleReq.id !== ''&& roleReq.id !== null?'/role/role-edit':'/role/role-add';
        console.log(roleReq.id);
        $.ajax({
            type: 'POST',
            url: postUrl,
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(roleReq),
            dataType: 'json',
            success: function(res){
                if(res.code === '0000'){
                    $("#roleModel").modal('hide');
                    roleTable.refresh(roleTableId);
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
        $("#roleId").val('');
        $("#roleName").val('');
        $("#roleDescription").val('');
        $("#roleSort").val('');
    }


    // $('#rolePermissionTree1').ace_tree({
    //     dataSource: tree_data,
    //     multiSelect: true,
    //     cacheItems: true,
    //     'open-icon' : 'ace-icon tree-minus',
    //     'close-icon' : 'ace-icon tree-plus',
    //     'itemSelect' : true,
    //     'folderSelect': false,
    //     'selected-icon' : 'ace-icon fa fa-check',
    //     'unselected-icon' : 'ace-icon fa fa-times',
    //     loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
    // });

    jQuery(function($) {
        var tree_data = {
            'for-sale': {text: 'For Sale', type: 'folder'},
            'vehicles': {text: 'Vehicles', type: 'folder'},
            'rentals': {text: 'Rentals', type: 'folder'},
            'real-estate': {text: 'Real Estate', type: 'folder'},
            'pets': {text: 'Pets', type: 'folder'},
            'tickets': {text: 'Tickets', type: 'item'},
            'services': {text: 'Services', type: 'item'},
            'personals': {text: 'Personals', type: 'item'}
        }
        tree_data['for-sale']['additionalParameters'] = {
            'children': {
                'appliances': {text: 'Appliances', type: 'item'},
                'arts-crafts': {text: 'Arts & Crafts', type: 'item'},
                'clothing': {text: 'Clothing', type: 'item'},
                'computers': {text: 'Computers', type: 'item'},
                'jewelry': {text: 'Jewelry', type: 'item'},
                'office-business': {text: 'Office & Business', type: 'item'},
                'sports-fitness': {text: 'Sports & Fitness', type: 'item'}
            }
        }
        tree_data['vehicles']['additionalParameters'] = {
            'children': {
                'cars': {text: 'Cars', type: 'folder'},
                'motorcycles': {text: 'Motorcycles', type: 'item'},
                'boats': {text: 'Boats', type: 'item'}
            }
        }
        tree_data['vehicles']['additionalParameters']['children']['cars']['additionalParameters'] = {
            'children': {
                'classics': {text: 'Classics', type: 'item'},
                'convertibles': {text: 'Convertibles', type: 'item'},
                'coupes': {text: 'Coupes', type: 'item'},
                'hatchbacks': {text: 'Hatchbacks', type: 'item'},
                'hybrids': {text: 'Hybrids', type: 'item'},
                'suvs': {text: 'SUVs', type: 'item'},
                'sedans': {text: 'Sedans', type: 'item'},
                'trucks': {text: 'Trucks', type: 'item'}
            }
        }

        tree_data['rentals']['additionalParameters'] = {
            'children': {
                'apartments-rentals': {text: 'Apartments', type: 'item'},
                'office-space-rentals': {text: 'Office Space', type: 'item'},
                'vacation-rentals': {text: 'Vacation Rentals', type: 'item'}
            }
        }
        tree_data['real-estate']['additionalParameters'] = {
            'children': {
                'apartments': {text: 'Apartments', type: 'item'},
                'villas': {text: 'Villas', type: 'item'},
                'plots': {text: 'Plots', type: 'item'}
            }
        }
        tree_data['pets']['additionalParameters'] = {
            'children': {
                'cats': {text: 'Cats', type: 'item'},
                'dogs': {text: 'Dogs', type: 'item'},
                'horses': {text: 'Horses', type: 'item'},
                'reptiles': {text: 'Reptiles', type: 'item'}
            }
        };
        console.log(tree_data);

        $('#rolePermissionTree1').ace_tree({
            dataSource: tree_data,
            multiSelect: true,
            cacheItems: true,
            'open-icon': 'ace-icon tree-minus',
            'close-icon': 'ace-icon tree-plus',
            'itemSelect': true,
            'folderSelect': false,
            'selected-icon': 'ace-icon fa fa-check',
            'unselected-icon': 'ace-icon fa fa-times',
            loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
        });
    })

    // //预加载数据
    // $.get("/permission/permission-tree", function(res){
    //     if(res.code === '0000'){
    //         console.log(res.data);
    //         permissionTree = res.data;
    //         $('#rolePermissionTree1').ace_tree({
    //             dataSource: permissionTree,
    //             multiSelect: true,
    //             cacheItems: true,
    //             'open-icon' : 'ace-icon tree-minus',
    //             'close-icon' : 'ace-icon tree-plus',
    //             'itemSelect' : true,
    //             'folderSelect': false,
    //             'selected-icon' : 'ace-icon fa fa-check',
    //             'unselected-icon' : 'ace-icon fa fa-times',
    //             loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
    //         });
    //     }
    // });

});

