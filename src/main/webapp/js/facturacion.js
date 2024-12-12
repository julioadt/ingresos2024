$(document).ready(function () {


    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/facturacion.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadofacturacionajax();
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadofacturacionajax();


});

function  listadofacturacionajax() {
    $.ajax({
        data: {listar: 'listado'},
        url: 'jsp/facturacion.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}

function rellenado(id, pos, fec,tot) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#postulante").val(pos);
    $("#fecha").val(fec);
    $("#total").val(tot);
    $("#pk").val(id);
}

function borrar() {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    $.ajax({
        data: {pk: $("#pk").val(), listar: "eliminar"},
        url: 'jsp/facturacion.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadofacturacionajax();
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