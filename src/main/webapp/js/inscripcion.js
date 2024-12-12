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
                if (response.trim().includes("guardado")) {
                    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                        keyboard: false
                    });
                    myModal.show();
                }
                else{
                    new AWN().info(response.trim(), {durations: {info: 1500}});
                }
                $("#listar").val("agregar");
                /*setTimeout(function(){
                 $("#mensaje").html("");
                 ),2000);*/
            }
        });




    });


    listadociudadesajax();
    listadoinscripcionajax();

});



function cargaringresantes(periodo) {
    if (!location.href.includes("index.jsp")) {
        location.href = "index.jsp";
    }
    $.ajax({
        data: {listar: 'listar', periodo: periodo},
        url: 'jsp/index.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}



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
function listadoinscripcionajax() {
    $.ajax({
        data: {listar: 'listar'},
        url: 'jsp/inscripcion.jsp',
        type: 'post',
        success: function (response) {
            $("#resultado tbody").html(response);
        }
    });
}



function rellenado(id, nombre, apellido, ciudad, fechanacimiento, cifrente, ciatras) {
    /*alert(id);
     alert(nom);
     apert(apell);*/
    $("#listar").val("modificar");
    $("#nombre").val(nombre);
    $("#apellido").val(apellido);
    $("#ciudades").val(ciudad);
    $("#fechanacimiento").val(fechanacimiento);
    $("#cifrente").val(cifrente);
    $("#ciatras").val(ciatras);
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
        url: 'jsp/inscripcion.jsp',
        type: 'post',
        success: function (response) {
            $("#mensaje").html(response);
            listadoinscripcionajax();
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


