$(document).ready(function () {



    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/materias.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadomateriasajax();
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadomateriasajax();
    listadoinstructoresajax();
    listadoseccionesajax();


});


function listadoinstructoresajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/instructores.jsp',
            type: 'post',
            success: function (response) {
                $("instructores").html(response);
            }
        });
    }
    
function listadoseccionesajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/secciones.jsp',
            type: 'post',
            success: function (response) {
                $("secciones").html(response);
            }
        });
    }
function listadomateriasajax() {
    $.ajax({
        data: {listar: 'listar'},
        url: 'jsp/materias.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}


function rellenado(id, nom, secc, instru, dias, hor) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("secciones").val(secc);
    $("instructores").val(instru);
    $("dias").val(dias);
    $("horario").val(hor);
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
        url: 'jsp/materias.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadomateriasajax();
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