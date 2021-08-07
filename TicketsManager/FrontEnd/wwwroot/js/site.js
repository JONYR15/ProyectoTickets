// General function for all ajax calls
function ajaxCall(callParams, data, callback){
    $.ajax({
        type: callParams.Type,
        url: callParams.Url,
        processData: false,
        dataType: callParams.DataType,
        data: data,
        cache: true,
        success: function (response) {
            callback(response);
        },
        error: function (response) {
            callback(response);
        }
    });
}