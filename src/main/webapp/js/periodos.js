$(document).ready(function () {


    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/periodos.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoperiodosajax();
                $("#listar").val("agregar");
                $("#nombre").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadoperiodosajax();


});




function listadoperiodosajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/periodos.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }



function rellenado(id, nom, estado) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
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
        url: 'jsp/periodos.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadoperiodosajax();
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

