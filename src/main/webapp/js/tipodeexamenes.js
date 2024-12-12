$(document).ready(function () {
    
   

    $("#boton").on('click', function () {
        datosformulario = $("#form").serialize();
        $.ajax({
            data: datosformulario,
            url: 'jsp/tipodeexamenes.jsp',
            type: 'post',
            success: function (response) {
                listadotipodeexamenesajax();        
                new AWN().info(response.trim(), {durations: {info: 1500}});
                $("#listar").val("agregar");
                 $("#nombre").val("");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });

    });
listadotipodeexamenesajax();


});
 function listadotipodeexamenesajax() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/tipodeexamenes.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }


function rellenado(id, nom,) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nom);
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
        url: 'jsp/tipodeexamenes.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadotipodeexamenesajax();
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

