$(document).ready(function () {


    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/factura_detalle.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadofactura_detalleajax();
                $("#listar").val("agregar");
                $("#fecha").attr("disabled", true);
                $("#postulante").attr("disabled", true);
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });

    $("#finalizar").on('click', function () {
        $.ajax({
            data: {listar:"finalizar"},
            url: 'jsp/factura_detalle.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                location.href = "facturacion.jsp";
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    
    $("#cancelar").on('click', function () {
        $.ajax({
            data: {listar:"cancelar"},
            url: 'jsp/factura_detalle.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                location.reload();
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });


    listadofactura_detalleajax();
    listadopostulantesajax();
    listadoconceptosajax();
});

function listadoconceptosajax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/conceptos.jsp',
        type: 'post',
        success: function (response) {
            $("#concepto").html(response);
            dividir($("#concepto").val());
            listadocabeceraajax();
        }
    });
}


function listadopostulantesajax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/postulantes.jsp',
        type: 'post',
        success: function (response) {
            $("#postulante").html(response);
        }
    });
}


function dividir(value) {
    $("#concepto_").val(value.split(",")[0]);
    $("#precio_").val(value.split(",")[1]);
    $("#precio").val(value.split(",")[1]);
}

function  listadofactura_detalleajax() {
    $.ajax({
        data: {listar: 'listar'},
        url: 'jsp/factura_detalle.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}



function rellenado(id, nom, ) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#pk").val(id);
}


function listadocabeceraajax() {
    $.ajax({
        data: {listar: 'listarcabecera'},
        url: 'jsp/factura_detalle.jsp',
        type: 'post',
        success: function (response) {
            if (response.includes("pending")) {
                $("#fecha").val(response.trim().split("=")[2]);
                $("#postulante").val(response.trim().split("=")[1]);
                $("#fecha").attr("disabled", true);
                $("#postulante").attr("disabled", true);
            }
        }
    });
}


function borrar(id) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    datosformulario = $("#form").serialize();
    $.ajax({
        data: {listar: "eliminar", pk: id},
        url: 'jsp/factura_detalle.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadofactura_detalleajax();
            $("#listar").val("agregar");
            /*setTimeout(function(){
             $("#mensaje").html("");
             ),2000);*/
        }
    });
}

function eliminar(id) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    $("#pk").val(id);
}




