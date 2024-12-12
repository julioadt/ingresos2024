$(document).ready(function () {

   
    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/ingresantes.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoingresantesajax();
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadoajax();


});

 function listadoajax() {
        $.ajax({
            data: {listar: 'listado'},
            url: 'jsp/examenes.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
}

function rellenado(id, nom, pun) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#puntaje").val(pun);
    $("#pk").val(id);
}

function borrar() {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    datosformulario = $("#form").serialize();
    $.ajax({
        data: {pk: $("#pk").val(), listar: "eliminar"},
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadoajax();
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