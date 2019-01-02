$(document).ready(function () {

    $("#submitt").click(function () {

        $.ajax({
            url: ".",
            type: "POST",
            async: false,
            data: $("#loginform").serialize(),
            dataType: "JSON",
            success: function (arg) {
                if (arg.status == "success") {
                    window.location.href = arg.url;
                }
                else if (arg.status == "failed") {
                    swal({
                        title: "Wrong user name or password",
                        text: "If you forget your password, pls contact peilun.fu117@163.com",
                        icon: "error",
                    });

                }
                else if (arg.status == "invalid") {
                    swal({
                        title: "Invalid information",
                        text: "Please check the information you input",
                        icon: "warning",
                    });                }
            }
        }) //Form submit
    });
});



