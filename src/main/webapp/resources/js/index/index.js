function ajax_req(page_name) {
    console.log(page_name);
    $.ajax({
        type: "POST",
        url: page_name,
        data: { submitButton: page_name},
        success: function (resp) {
            console.log("my resp -> " + resp);

        }
    });
}