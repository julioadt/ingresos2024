$(document).ready(function () {


    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/conceptos.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                listadoconceptosajax();
                $("#listar").val("agregar");
                $("#nombre").val("");
                $("#precio").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
    listadoconceptosajax();


});




function listadoconceptosajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/conceptos.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }



function rellenado(id, nom, precio ) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
    $("#precio").val(precio);
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
        url: 'jsp/conceptos.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
             listadoconceptosajax();
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

