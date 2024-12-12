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



$(document).ready(function () {

    cargaringresantes($(document.getElementsByClassName("periods")[0]).attr('indice'));

});