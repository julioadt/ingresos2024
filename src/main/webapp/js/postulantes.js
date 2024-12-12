$(document).ready(function () {
    

    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/postulantes.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadopostulantesajax();
                $("#listar").val("agregar");
                $("#listar").val("modificar");
                $("#nombre").val("");
                $("#apellido").val("");
                $("#ci").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });


    });
listadopostulantesajax();
listadociudadesajax();

});

function listadociudadesajax() {
        $.ajax({
            data: {listar: 'menu'},
            url: 'jsp/ciudades.jsp',
            type: 'post',
            success: function (response) {
                $("#ciudades").html(response);
            }
        });
    }
function listadopostulantesajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/postulantes.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }


function rellenado(id, nom, apell, ciu, ci) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#apellido").val(apell);
    $("#ci").val(ci);
    $("#ciudades").val(ciu);
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
        url: 'jsp/postulantes.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadopostulantesajax();
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

