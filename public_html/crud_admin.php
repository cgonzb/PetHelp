<?php
require_once dirname(__FILE__) . '/header.php';
require_once dirname(__FILE__) . '/crud/class_tablas.php';
if (!isset($_SESSION['user'])) {
    //en caso de no estar logueado redirije al index
    echo '<script> window.location.replace("index.php");</script>';
}
?>
<div class="row light-green">
    <!-- navegacion de secciones -->
    <div class="col s12 m3 card" style='height: 506px'>
        <ul class="collection with-header" style="max-height: 500px; overflow: auto;">
            <li class="collection-header"><h5>CRUD base de datos</h5></li>
            <?php
            $tablas = tabla::getAll();
            foreach ($tablas as $tabla) {
                echo '<!-- secciones a mostrar -->
            <li class="collection-item">
                <div>' . $tabla['tableName'] . '
                    <a href="#!" class="secondary-content view" tableName="' . $tabla['tableName'] . '"><i class="material-icons">send</i></a>
                    <a href="#modal1" class="secondary-content modal-trigger" tableName="' . $tabla['tableName'] . '"><i class="material-icons">add_box</i></a>
                </div>
            </li>
            <!-- secciones a mostrar -->';
            }
            ?>
        </ul>
    </div>
    <!-- navegacion de secciones -->

    <!-- main div de display -->
    <div class="col s12 m9 card" style='min-height: 506px; overflow: auto;'>
        <div class="row">
            <div class="col s12 m4 valign-wrapper" style="padding-top: 4px;">
                <a class="red btn delete_group">Borrar<i class="material-icons right ">delete</i></a>
                <span class="chip"><span id='seleccionados'>0</span> Seleccionados</span>
            </div>
            <input id="search" class="col s12 m8" type="text" placeholder="Filtrar" style="margin-bottom: 0px;">
        </div>
        <div class='divider'></div>
        <div class="progress" style="display:none;">
            <div class="indeterminate"></div>
        </div>
        <div id="crud"></div>
    </div>
    <!-- main div de display -->

</div>
<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content" tableName="">
        <h3>Agregar <span class="chip"></span></h3>
        <div class="error card red white-text center-align" style="display: none;"><h5>Error: Debe completar los campos<i class="material-icons">error</i></h5></div>
        <form></form>
        <div class="progress" style="display:none;">
            <div class="indeterminate"></div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close red waves-effect waves-light btn">Cancelar</a>
        <a id="insertar" href="#!" class="modal-action waves-effect waves-green btn">Agregar</a>
    </div>
</div>
<!-- modal -->
<?php
require_once dirname(__FILE__) . '/footer.php';
?>
<script>
    $(document).ready(function () {
        $('.view').on('click', function () {
            /**
             * Función para cargar los elementos en el div de display.
             */
            //se limpian los colores
            $('.view').parents('li').removeClass('teal lighten-5');
            //se agrega color a la seleccion
            $(this).parents('li').addClass('teal lighten-5');
            //loading bar
            $('.progress').show();
            //load del display de la tabla
            url = 'crud/display_crud.php?tableName=' + $(this).attr('tableName');
            $('#crud').slideDown('slow').load(url, function () {
                //se esconde el progress bar
                $('.progress').slideUp('slow');
                //reset contador de selccionados
                $('#seleccionados').text('0');

                //handler de los seleccionados
                $('.select').on('click', function () {
                    $(this).parents('tr').toggleClass('teal lighten-5');
                    n = $("input:checked").size();
                    $('#seleccionados').text(n);
                }); //.select on click

                //DELETE SINGLE
                $('.delete').on('click', function () {
                    row = $(this).parents('tr');
                    data = $(this).siblings('input').attr('id');
                    tableName = $(this).parents('table').attr('tableName');
                    //inserción via ajax
                    if (confirm('Está seguro que quiere eliminar este dato?')) {
                        $.ajax({
                            url: 'crud/delete_crud.php',
                            type: "post",
                            async: true,
                            beforeSend: function () {
                                $('.progress').slideDown('slow');
                            },
                            data: {'tableName': tableName, 'id': data},
                            success: function (output) {
                                if (output == 1) {
                                    $('.progress').slideUp('slow');
                                    row.remove();
                                } else {
                                    alert('Oops! : Nos hemos encontrado con un error. Revisar el envío Ajax');
                                }
                            }//success
                        });//ajax
                    }//confirm
                });//.delete on click

                //DELTE GROUP
                $('.delete_group').on('click', function () {
                    n = $("input:checked").size();
                    if (n > 0) {
                        if (confirm('Está seguro que quiere borrar ' + n + ' elementos?')) {
                            $('.progress').show();
                            $("input:checked").each(function () {
                                tableName = $(this).parents('table').attr('tableName');
                                data = $(this).attr('id');
                                row = $(this).parents('tr');
                                //alert(tableName+data);
                                $.ajax({
                                    url: 'crud/delete_crud.php',
                                    type: "post",
                                    async: false,
                                    data: {'tableName': tableName, 'id': data},
                                    success: function (output) {
                                        if (output == 1) {
                                            $('.progress').slideUp('slow');
                                            row.remove();
                                        } else {
                                            alert('Oops! : Nos hemos encontrado con un error. Revisar el envío Ajax');
                                        }
                                    }//success
                                });//ajax
                            });//$.each
                        }//if confirm
                    } else {
                        //alert('No hay elementos seleccionados!');
                    }
                });//.delete_group on click

                //EDIT SINGLE
                $('.edit').on('click', function () {
                    // se esconde el boton de editar
                    $(this).hide();
                    // se esconde el boton eliminar y seleccionar
                    $(this).parent().children('.delete').hide();
                    $(this).parent().children('.select, label').hide();


                    //se muestra el boton save
                    $(this).parent().children('.save').show();
                    $(this).parents('td').siblings('td').each(function () {
                        //se transforma cada campo en un input editable
                        text = $(this).text();
                        name = $(this).attr('name');
                        if (name !== 'Ultima_Mod') {
                            $(this).html('<input type="text" name="' + name + '" value="' + text + '">');
                        }//if
                    });//each td

                    //SINGLE SAVE
                    $(this).parent().children('.save').on('click', function () {
                        $('.progress').slideDown('slow');
                        $(this).hide();
                        row = $(this).parents('tr');
                        $(this).parent().children('.delete').show();
                        $(this).parent().children('.select, label').show();
                        $(this).parent().children('.edit').show();
                        //JSON para enviar datos
                        info = {};
                        $(this).parents('td').siblings('td').children('input').each(function () {
                            key = $(this).attr('name');
                            value = $(this).val();
                            info[key] = value;
                            $(this).parents('td').html(value);
                        });//each td
                        tableName = $(this).parents('table').attr('tableName');

                        //se envía para actualizar en la base de datos
                        $.ajax({
                            url: 'crud/update_crud.php',
                            data: {'tableName': tableName, 'data': info},
                            type: 'post',
                            async: false,
                            success: function (output) {
                                $('.progress').slideUp('slow');
                            }//success
                        });//ajax
                    });//SINGLE .SAVE
                });//.edit click
            });//load
        });//on click

        //indicador de tabla en modal
        $('.modal-trigger').on('click', function () {
            url = 'crud/form.php?tableForm=' + $(this).attr('tableName');
            $('.modal-content').attr('tableName', $(this).attr('tableName'));
            $('.modal-content span').text($(this).attr('tableName'));
            $('.modal-content form').load(url);
        });//on click

        //modales
        $('.modal-trigger').leanModal({
            complete: function () {
                $('.error').hide();
                $('#insertar').removeClass('red darken-3');
            }//complete
        }); //.leanModal()
    }); //ready
</script>
<script src="js/filtro.js"></script>