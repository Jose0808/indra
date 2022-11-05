const UrlBackend = "https://localhost:44369/";

var form = document.forms['loginformname'];
form.onsubmit = function (e) {
    e.preventDefault();
    var Param = {
        Username: form.elements["usuario"].value,
        Password: form.elements["password"].value,
        grant_type: "password",
    };
    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: UrlBackend + "token",
        data: Param,
        async: false,
        beforeSend: function () { },
        success: function (response) {
            Getdatauser(response, Param)
        },
        error: function (err) {
            alert("Upps!, Usuario y/o Contraseña Incorrectos")
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });
}

function Getdatauser(datatoken, Param) {
    $.ajax({
        type: "GET",
        url: UrlBackend + "GetUserData?User=" + Param.Username + "&Pass=" + Param.Password,
        headers: {
            'Authorization': datatoken.token_type + ' ' + datatoken.access_token
        },
        async: false,
        beforeSend: function () { },
        success: function (response) {
            var data = {
                datauser: response[0],
                datatoken: datatoken
            }

            data = btoa(JSON.stringify(data));

            localStorage.setItem('appindra', data);

            window.location.href = "Productos.html";
        },
        error: function (err) {
            alert("Upps!, Usuario y/o Contraseña Incorrectos")
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });
}
