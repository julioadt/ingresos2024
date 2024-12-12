$(document).ready(function () {
    

    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/usuarios.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadousuariosajax();
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });


    });
listadousuariosajax();
});


function listadousuariosajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/usuarios.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }


function rellenado(id, nom, clave, rol, estado) {
    /*alert(id);*/
    $("#listar").val("modificar");
    $("#usuario").val(nom);
    $("#clave").val(clave);
    $("#rol").val(rol);
    $("#estado").val(estado);
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
        url: 'jsp/usuarios.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadousuariosajax();
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

