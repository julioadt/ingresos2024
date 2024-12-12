function listadopelotonesajax(compa) {
    $.ajax({
        data: {listar: 'menu', compa: compa},
        url: 'jsp/pelotones.jsp',
        type: 'post',
        success: function (response) {
            $("#peloton").html(response);
        }
    });
}
function listadopostulantesajax(periodo) {
    $.ajax({
        data: {listar: 'menu', periodo: periodo},
        url: 'jsp/ingresante.jsp',
        type: 'post',
        success: function (response) {
            $("#postulantes").html(response);
            puntajes();
        }
    });
}

function puntajes() {
    $("#postulante").val($("#postulantes").val().split(",")[0]);
    $("#total").val($("#postulantes").val().split(",")[1]);
    $("#total_").val($("#postulantes").val().split(",")[1]);
    $("#promedio").val($("#postulantes").val().split(",")[2]);
    $("#promedio_").val($("#postulantes").val().split(",")[2]);
}

function listadoseccionesajax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/secciones.jsp',
        type: 'post',
        success: function (response) {
            $("#seccion").html(response);
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
            listadopelotonesajax($("#compañia").val());
        }
    });
}

function listadoperiodosjax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/periodos.jsp',
        type: 'post',
        success: function (response) {
            $("#periodo").html(response);
            listadopostulantesajax($("#periodo").val());
        }
    });
}

$(document).ready(function () {



    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/ingresante.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoingresantsajax();
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadoingresantsajax();
    listadocompañiajax();
    listadoperiodosjax();
    listadoseccionesajax();

});
function listadoingresantsajax() {
    $.ajax({
        data: {listar: 'listar'},
        url: 'jsp/ingresante.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}


function rellenado(id, pos, comp, pel, secc) {
    /*alert(id);
     alert(nom);
     apert(comp);*/
    $("#listar").val("modificar");
    $("#postulante").val(pos);
    $("#compañia").val(comp);
    $("#pelotones").val(pel);
    $("#secciones").val(secc);
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
        url: 'jsp/ingresante.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadoingresantsajax();
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