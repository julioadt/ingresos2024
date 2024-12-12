$(document).ready(function () {


    $("#boton").on('click', function () {
        
        let datos = new FormData($("#form")[0]);
        $.ajax({
            data: datos,
            url: 'jsp/inscripcion.jsp',
            type: 'post',
            processData: false,
            contentType: false,
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });
        
        
  

    });
    
    
    listadoinscripciones();
    
});


function listadoinscripciones() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/inscripciones.jsp',
            type: 'post',
            success: function (response) {
                $("#resultado tbody").html(response);
            }
        });
    }



function postular(nom, ape, ci, ciu) {
        $.ajax({
            data: {listar: 'agregar',nombre: nom, apellido:ape, ciudad:ciu, ci:ci},
            url: 'jsp/postulantes.jsp',
            type: 'post',
            success: function (response) {
                new AWN().info(response.trim(), {durations: {info: 1500}});
            }
        });
    }
 
function eliminar(id){
    $("#pk").val(id);
}

function borrar() {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("eliminar");
    datosformulario = $("#form").serialize();
    $.ajax({
        data: {listar:"eliminar", pk:$("#pk").val()},
        url: 'jsp/inscripciones.jsp',
        type: 'post',
        success: function (response) {
            new AWN().info(response.trim(), {durations: {info: 1500}});
            listadoinscripciones();
            /*setTimeout(function(){
             $("#mensaje").html("");
             ),2000);*/
        }
    });
}