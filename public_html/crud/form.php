<?php
/**
 * ARCHIVO DE GENERACION DE FORMULARIO DE INGRESO PARA TABLAS
 */
if (isset($_GET['tableForm'])) {
    switch ($_GET['tableForm']) {
        case 'color':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_color.php';
            $obj2 = new color();
            break;
        case 'enfermedad':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_enfermedad.php';
            $obj2 = new enfermedad();
            break;
        case 'estado':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_estado.php';
            $obj2 = new estado();
            break;
        case 'largo_pelo':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_largo_pelo.php';
            $obj2 = new largo_pelo();
            break;
        case 'operaciones':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_operaciones.php';
            $obj2 = new operaciones();
            break;
        case 'persona':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_persona.php';
            $obj2 = new persona();
            break;
        case 'tipo_aporte':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tipo_aporte.php';
            $obj2 = new tipo_aporte();
            break;
        case 'tamanio':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tamanio.php';
            $obj2 = new tamanio();
            break;
        case 'ubicacion':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_ubicacion.php';
            $obj2 = new ubicacion();
            break;
        case 'vacunas':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_vacunas.php';
            $obj2 = new vacunas();
            break;
    }
    if (is_object($obj2)) {
//cantidad de columnas de la tabla
        $n = count($obj2->headers);
        for ($i = 1; $i < $n - 1; $i++) {
            //echo $obj2->headers[$i];
            // se genera el formulario para insertar un dato
            echo '<div class="input-field">
         <form>
         <input name="' . $obj2->headers[$i] . '" id="' . $obj2->headers[$i] . '" type="text" class="validate">
         <label for="' . $obj2->headers[$i] . '">' . $obj2->headers[$i] . '</label>
         </form>    
        </div>';
        }
    } else {
        echo '<div class="card orange darken-2 white-text">No se ha creado la clase!</div>';
    }
} else {
    echo '<div class="card orange darken-2 white-text">No se han enviado datos!</div>';
}
?>
<script>
    $(document).ready(function () {
        //cilck de insertar
        $('#insertar').click(function () {
            //nombre de la tabla
            tableName = $('.modal-content').attr('tableName');
            //datos
            data = $('form').serialize();
            errores = 0;
            $('form .validate').each(function () {
                if (!$(this).val()) {
                    errores++;
                }
            });
            if (errores == 0) {
                //inserción via ajax
                $.ajax({
                    url: 'crud/insert_crud.php',
                    type: "post",
                    async: true,
                    beforeSend: function () {
                        $('.progress').slideDown('slow');
                    },
                    data: {'tableName': tableName, 'data': data},
                    success: function (output) {
                        if (output == 1) {
                            $('.progress').slideUp('slow');
                            $('#modal1').closeModal();
                        } else {
                            $('.progress').slideUp('slow');
                            $('#modal1').closeModal();
                            alert('Hubo un error en la creación del elemento');
                        }
                    }
                });//ajax
            } else {
                $(this).addClass('red darken-3');
                $('.error').slideDown('slow');
            }
        });//click
    });

</script>