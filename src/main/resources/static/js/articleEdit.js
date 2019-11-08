$(document).ready(function () {
    let articleEditSaveUrl = 'article/update';
    let articleEditPublishUrl = 'article/updpublish';
    let articleReq={
        id:'',
        title:'',
        description:'',
        keyword:'',
        contentSrc:'',
        content:'',
        categoryId:''
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
        saveOrPublish(articleEditSaveUrl);
    });
    $("#articlePublish").click(function () {
        saveOrPublish(articleEditPublishUrl);
    });

    function saveOrPublish(url) {
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
            loadPage("/article/page","文章管理");
        });
    }


});
