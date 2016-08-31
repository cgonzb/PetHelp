/**
 * filtro de TMs para agregar al calendario al input hay que agregarle el id="search"
 * y cada una de las opciones a esconder debe tener la clase "fc-event"
 *
 **/
$('#search').keyup(function () {
    $('tbody tr').hide();
    var txt = $('#search').val();
    $('tbody tr').each(function () {
        if ($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1) {
            $(this).show();
        }
    });
});
