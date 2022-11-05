const UrlBackend = "https://localhost:44369/";
var token_type = "";
var access_token = "";

$(document).ready(function () {

    var data = localStorage.getItem('appindra');

    data = JSON.parse(atob(data));
    token_type = data.datatoken.token_type;
    access_token = data.datatoken.access_token;

    Getcategorias();
});

const selectElement = document.querySelector('#category');

selectElement.addEventListener('change', (event) => {

    Getdataproductos($("#category").val())
});

function Getcategorias() {
    $.ajax({
        type: "GET",
        url: UrlBackend + "GetCategorias",
        headers: {
            'Authorization': token_type + ' ' + access_token
        },
        async: false,
        beforeSend: function () { },
        success: function (response) {

            $(".category").empty();
            console.log(response);
            for (let i = 0; i < response.length; i++) {
                $(".category").append("<option value=" + response[i].idCategoria + ">" + response[i].nombre + "</option>");
            }

            Getdataproductos(response[0].idCategoria);

        },
        error: function (err) {
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });
}

function Getdataproductos(id) {
    $.ajax({
        type: "GET",
        url: UrlBackend + "GetProductobyCategoria?categoria=" + id,
        headers: {
            'Authorization': token_type + ' ' + access_token
        },
        async: false,
        beforeSend: function () { },
        success: function (response) {
            $("#dataproducts").empty();

            for (let i = 0; i < response.length; i++) {
                var action = "Desactivar"
                if (response[i].estado == "I") {
                    action = "Activar"
                }
                var dataupdate = JSON.stringify(response[i]);
                $("#dataproducts").append("<tr><td>" + response[i].idProducto + "</td>\
                <td>"+ response[i].nombre + "</td>\
                <td>"+ response[i].estado + "</td>\
                <td><button type='button' class='btn btn-primary' onclick='infomodal("+ dataupdate + ")'>Editar</button>\
                <button type='button' class='btn btn-primary' onclick='changestate("+ dataupdate + ")'>" + action + "</button></td></tr>");
            }
        },
        error: function (err) {
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });
}

$('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal

})

$('#exampleModal2').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
})


function openmodal() {
    $('#exampleModal').modal("show");
}

function infomodal(product) {
    $('#exampleModal2').modal("show");

    var updateform = document.forms['updateform'];
    $(updateform.elements["id"]).val(product.idProducto);
    $(updateform.elements["nombre"]).val(product.nombre);
    $(updateform.elements["category"]).val(product.idCategoriaProducto);
    $(updateform.elements["estado"]).val(product.estado);
}

function Agregar() {
    var insertform = document.forms['insertform']; var Param = {
        nombre: insertform.elements["nombre"].value,
        idCategoriaProducto: $("#category").val(),
        estado: "A",
    };
    $.ajax({
        type: "PUT",
        contentType: "application/json",
        url: UrlBackend + "InsertProducto",
        headers: {
            'Authorization': token_type + ' ' + access_token
        },
        data: JSON.stringify(Param),
        async: false,
        beforeSend: function () { },
        success: function (response) {
            Getdataproductos($("#category").val());
        },
        error: function (err) {
            // alert("Upps!, Usuario y/o Contraseña Incorrectos")
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });

}


function Editar() {
    var updateform = document.forms['updateform'];
    var Param = {
        idProducto: updateform.elements["id"].value,
        nombre: updateform.elements["nombre"].value,
        idCategoriaProducto: updateform.elements["category"].value,
        estado: updateform.elements["estado"].value,
    };
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: UrlBackend + "UpdateProducto",
        headers: {
            'Authorization': token_type + ' ' + access_token
        },
        data: JSON.stringify(Param),
        async: false,
        beforeSend: function () { },
        success: function (response) {
            Getdataproductos($("#category").val());
        },
        error: function (err) {
            // alert("Upps!, Usuario y/o Contraseña Incorrectos")
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });

}

function changestate(product) {
    if (product.estado === "A") {
        product.estado = "I"
    }
    else {
        product.estado = "A"
    }

    var Param = {
        idProducto: product.idProducto,
        estado: product.estado,
    };
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: UrlBackend + "ChangestateProducto",
        headers: {
            'Authorization': token_type + ' ' + access_token
        },
        data: JSON.stringify(Param),
        async: false,
        beforeSend: function () { },
        success: function (response) {
            Getdataproductos($("#category").val());
        },
        error: function (err) {
            // alert("Upps!, Usuario y/o Contraseña Incorrectos")
            // swal("Upps!", "Usuario y/o Contraseña Incorrectos", "warning");
        },
        timeout: 300000,
    });
}