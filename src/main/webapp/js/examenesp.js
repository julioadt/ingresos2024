$(document).ready(function () {


    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/examenesp.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoexamenespajax();
                $("#listar").val("agregar");
                $("#nombre").val("");
                $("#puntaje").val("");
                $("#promedio").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadoexamenespajax();
    listadoinstructoresajax();
    listadotipoexamenajax();

});




function listadoexamenespajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/examenesp.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }
    

function listadoinstructoresajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/instructores.jsp',
            type: 'post',
            success: function (response) {
                $("#instructores").html(response);
            }
        });
    }
    
    
    
 function listadotipoexamenajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/tipodeexamenes.jsp',
            type: 'post',
            success: function (response) {
                $("#tipodeexamenes").html(response);
            }
        });
    }



function rellenado(id, nom, puntaje, instructores, tipodeexamenes, prome) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#puntaje").val(puntaje);
    $("#instructores").val(instructores);
    $("#tipodeexamenes").val(tipodeexamenes);
    $("#promedio").val(prome);
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
        url: 'jsp/examenesp.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadoexamenespajax();
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

