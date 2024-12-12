$(document).ready(function () {


    $("#boton").on('click', function () {
        if($("#puntaje").val().length < 1){
            new AWN().info("Ingrese un puntaje valido", {durations: {info: 1500}});
            return;
        }
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/examenes.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoexamenesajax();
                $("#listar").val("agregar");
                if (!response.includes("seleccionado")) {
                    $("#examen_").attr("disabled", true);
                    $("#periodo_").attr("disabled", true);
                    $("#instructor").attr("disabled", true);
                    $("#puntaje").val("");
                    $("#estado").val("");
                    $("#estado_").val("");
                }
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });



    $("#finalizar").on('click', function () {
        finalizar();
    });

    $("#cancelar").on('click', function () {
        cancelar();
    });


    $("#examen_").on("change", function () {
        let datos = $("#examen_").val().split(",");
        $("#examen").val(datos[0]);
        $("#total").val(datos[1]);
        $("#total_").val(datos[1]);
        $("#promedio").val(datos[2]);
        $("#promedio_").val(datos[2]);
        $("#estado_").val("");
        $("#estado").val("");
        $("#puntaje").val("");
    });
    listadoexamenesajax();
    listadoexamenespajax();
    listadopostulantesajax();
    listadoperiodosajax();
    listadoinstructoresajax();

});

function listadoperiodosajax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/periodos.jsp',
        type: 'post',
        success: function (response) {
            $("#periodo_").html(response);

        }
    });
}

function listadoexamenesajax() {
    $.ajax({
        data: {listar: 'listar'},
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}

function listadocabeceraajax() {
    $.ajax({
        data: {listar: 'listarcabecera'},
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            if (response.includes("pending")) {
                let exa = response.trim().split("=")[1];
                $("#examen_").val(exa);
                $("#examen").val(exa.split(",")[0]);
                $("#total_").val(exa.split(",")[1]);
                $("#total").val(exa.split(",")[1]);
                $("#promedio_").val(exa.split(",")[2]);
                $("#promedio").val(exa.split(",")[2]);
                $("#periodo_").val(response.trim().split("=")[2]);
                $("#instructor").val(response.trim().split("=")[3]);
                $("#examen_").attr("disabled", true);
                $("#periodo_").attr("disabled", true);
                $("#instructor").attr("disabled", true);
            }
        }
    });
}

function listadoexamenespajax() {
    $.ajax({
        data: {listar: 'menu'},
        url: 'jsp/examenesp.jsp',
        type: 'post',
        success: function (response) {
            $("#examen_").html(response);
            let datos = $("#examen_").val().split(",");
            $("#examen").val(datos[0]);
            $("#total").val(datos[1]);
            $("#total_").val(datos[1]);
            $("#promedio").val(datos[2]);
            $("#promedio_").val(datos[2]);
            $("#estado_").val("");
            $("#estado").val("");
            $("#puntaje").val("");
            listadocabeceraajax();
        }
    });
}



function finalizar() {
    $.ajax({
        data: {listar: 'finalizar'},
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            location.href = "resultados.jsp";
        }
    });
}


function cancelar() {
    $.ajax({
        data: {listar: 'cancelar'},
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            location.reload();
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

function rellenado(id, examen, postulante, puntaje, promedio, estado) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("examen").val(examen);
    $("postulante").val(postulante);
    $("puntaje").val(puntaje);
    $("promedio").val(promedio);
    $("estado").val(estado);
    $("#pk").val(id);
}





function borrar() {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar2");
    datosformulario = $("#form").serialize();
    $.ajax({
        data: datosformulario,
        url: 'jsp/examenes.jsp',
        type: 'post',
        success: function (response) {
            new AWN().info(response.trim(), {durations: {info: 1500}});
            listadoexamenesajax();
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


function calcular() {    
    let puntaje = parseInt($("#puntaje").val());
    let promedio = parseInt($("#promedio").val());
    if (puntaje >= promedio) {
        $("#estado").val("APROBADO");
        $("#estado_").val("APROBADO");
    } else {
        $("#estado").val("REPROBADO");
        $("#estado_").val("REPROBADO");
    }
}

