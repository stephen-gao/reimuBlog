$(function () {
    let testEditormd = editormd("markdown-edit", {
        width: "100%",
        height: 740,
        path: '../lib/',
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
        imageUploadURL: "./php/upload.php",
        onload: function () {
            console.log('onload', this);

        }
    });
});
