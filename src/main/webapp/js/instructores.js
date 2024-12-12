$(document).ready(function () {
    
   

    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/instructores.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoinstructoresajax();
                $("#listar").val("agregar");
                $("#nombre").val("");
                $("#apellido").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
listadoinstructoresajax();
listadopostulantesajax();

});

function listadopostulantesajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/postulantes.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }

 function listadoinstructoresajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/instructores.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }

function rellenado(id, nom, apell ) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#apellido").val(apell);
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
        url: 'jsp/instructores.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
           listadoinstructoresajax();
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