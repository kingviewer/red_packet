let Business = {};
Business.ajax = function (url, params, method, success_func, failed_func, ignore_error) {
    if (failed_func === undefined)
        failed_func = function (rs) {
            swal("Error", rs.msg, "error");
        };
    $.ajax({
        type: method,
        url: url,
        data: params,
        dataType: 'json',
        success: function (data) {
            success_func(data.data);
        },
        error: function (data) {
            if (ignore_error)
                return;
            if (data.responseJSON) {
                if (data.responseJSON.code === 'login_to_operate')
                    location.href = '/user/user_sessions/new';
                else
                    failed_func({msg: data.responseJSON.msg});
            }

        }
    });
};

Business.submit_form = function (url, form_id, success_func, failed_func) {
    if (failed_func === undefined)
        failed_func = function (rs) {
            swal("Error", rs.msg, "error");
        };
    $.ajax({
        type: 'post',
        url: url,
        data: $('#' + form_id).serialize(),
        dataType: 'json',
        success: function (data) {
            success_func(data.data);
        },
        error: function (data) {
            let msg, code = '';
            if (data.responseJSON) {
                msg = data.responseJSON.msg;
                code = data.responseJSON.code;
                failed_func({code: code, msg: msg});
            }
            // failed_func({code: code, msg: msg});
        }
    });
};

Business.upload_files = function (url, form_id, success_func, failed_func) {
    if (failed_func === undefined)
        failed_func = function (rs) {
            swal("错误", rs.msg, "error");
        };
    let form_data = new FormData();
    $.each($('#' + form_id).serializeArray(), function (i, item) {
        form_data.append(item.name, item.value);
    });
    $.each($('#' + form_id + ' input[type="file"]'), function (i, ui) {
        let ele = $(ui);
        if ($(ui)[0].files.length > 0)
            form_data.append(ele.attr('name'), $(ui)[0].files[0]);
    });
    let xhr = new XMLHttpRequest();
    xhr.withCredentials = true;
    xhr.open("post", url);
    xhr.onreadystatechange = function () {
        let data = JSON.parse(xhr.responseText);
        if (xhr.readyState === 4 && xhr.status === 200) {
            success_func(data.data);
        } else {
            failed_func(data);
        }
    }
    xhr.send(form_data);
}

Business.get = function (url, params, success_func, failed_func, ignore_error) {
    Business.ajax(url, params, 'get', success_func, failed_func, ignore_error);
};

Business.post = function (url, params, success_func, failed_func) {
    Business.ajax(url, params, 'post', success_func, failed_func);
};

Business.put = function (url, params, success_func, failed_func) {
    params['_method'] = 'put';
    Business.ajax(url, params, 'post', success_func, failed_func);
};

Business.delete = function (url, params, success_func, failed_func) {
    params['_method'] = 'delete';
    Business.ajax(url, params, 'post', success_func, failed_func);
};