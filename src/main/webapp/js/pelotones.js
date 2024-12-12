$(document).ready(function () {

   

    function listadoinstructoresajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/instructores.jsp',
            type: 'post',
            success: function (response) {
                $("#instructor").html(response);
            }
        });
    }

    function listadocompañiajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/compañia.jsp',
            type: 'post',
            success: function (response) {
                $("#compañia").html(response);
            }
        });
    }

    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/pelotones.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadopelotonesajax();
                $("#listar").val("agregar");
                $("#nombre").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadopelotonesajax();
    listadocompañiajax();
    listadoinstructoresajax();

});
 function listadopelotonesajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/pelotones.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }


function rellenado(id, nom, comp, instru) {
    /*alert(id);
     alert(nom);
     apert(comp);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#compañia").val(comp);
    $("#instructor").val(instru);
    $("#pk").val(id);
}
function borrar() {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    datosformulario = $("#form").serialize();
    $.ajax({
        data: datosformulario,
        url: 'jsp/pelotones.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadopelotonesajax();
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