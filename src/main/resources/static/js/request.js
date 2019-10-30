function Request(window) {
    function post(url, data, success) {
        $.ajax({
            type: 'POST',
            url: url,
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (res) {
                resultHandler(res, success)
            }
        });
    }

    function get(url, success) {
        $.get(url, function (res) {
            resultHandler(res, success)
        });
    }

    function resultHandler(res, success) {
        console.log(res);
        if (res.code === '0000') {
            success(res);
        } else if (res.code === '9001') {
            window.location = '/login';
        } else {
            $.message({
                message: res.message,
                type: 'error'
            });
        }
    }

    return {post: post, get: get}
}

const REQUEST = Request(window);