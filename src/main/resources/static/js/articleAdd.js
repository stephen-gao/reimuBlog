$(document).ready(function () {
    let articleSaveUrl = '/manage/article/save';
    let articlePublishUrl = '/manage/article/publish';
    let categoryAllUrl = '/manage/category/all';
    let specialAllUrl = '/manage/special/all';
    let articleReq={
        id:'',
        title:'',
        description:'',
        keyword:'',
        contentSrc:'',
        content:'',
        categoryId:'',
        specials:[]
    };
    let editorMarkdown = editormd("markdown-edit", {
        width: "100%",
        height: 740,
        path: '../lib/',
        theme : "dark",
        previewTheme : "dark",
        editorTheme: "pastel-on-dark",
        markdown: '',
        codeFold: true,
        //syncScrolling : false,
        saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
        searchReplace: true,
        htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
        emoji: true,
        taskList: true,
        tocm: true,         // Using [TOCM]
        flowChart: true,             // 开启流程图支持，默认关闭
        sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,

        imageUpload: true,
        imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL: "/file/upload/image",
        onload: function () {

        }
    });

    $("#articleSave").click(function () {
        saveOrPublish(articleSaveUrl);
    });

    $("#articlePublish").click(function () {
        saveOrPublish(articlePublishUrl);
    });

    function saveOrPublish(url) {
        // 专题
        let chkValue =[];
        $('input[name="SelectSpecial"]:checked').each(function(){
            chkValue.push($(this).val());
        });
        articleReq.specials = chkValue;
        articleReq.id = $("#articleId").val();
        articleReq.title = $("#articleTitle").val();
        articleReq.description = $("#articleDescription").val();
        articleReq.keyword = $("#articleKeyword").val();
        articleReq.categoryId = $("#articleCategory").val();
        articleReq.contentSrc = editorMarkdown.getMarkdown();
        articleReq.content = $(".editormd-preview").html();
        console.log(articleReq);
        REQUEST.post(url,articleReq,function (res) {
            $.message({
                message: res.message,
                type: 'success'
            });
            loadPage("/manage/article/page","文章管理");
        });
    }

    REQUEST.get(categoryAllUrl,function (res) {
        let categorys = res.data;
        for(let i = 0;i<categorys.length;i++){
            $("#articleCategory").append('<option value="'+ categorys[i].id +'">'+ categorys[i].name+'</option>')
        }
    })

    REQUEST.get(specialAllUrl,function (res) {
        let list = res.data;
        let inHtml = '<div class="row">';
        for(let i = 0;i<list.length;i++){
            if(i!== 0  && i%3 === 0){
                inHtml += '</div></div><div class="row">';
            }
            inHtml += '<div class="col-sm-4">';
            inHtml += '<input type="checkbox" name="SelectSpecial" value="'+list[i].id+'" class="ace ace-checkbox-2" />';
            inHtml += '<span class="lbl">'+list[i].name+'</span>';
            inHtml += '</div>';
        }
        inHtml += '</div>';
        $("#articleSpecialDiv").append(inHtml);
    })


});
