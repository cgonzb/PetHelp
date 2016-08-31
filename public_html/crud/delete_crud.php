<?php

if (isset($_POST['tableName']) && isset($_POST['id'])) {
    //se transforman las variables enviadas a un arreglo asociativo
    switch ($_POST['tableName']) {
        case 'color':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_color.php';
            $obj2 = new color($_POST['id']);
            break;
        case 'enfermedad':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_enfermedad.php';
            $obj2 = new enfermedad($_POST['id']);
            break;
        case 'estado':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_estado.php';
            $obj2 = new estado($_POST['id']);
            break;
        case 'largo_pelo':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_largo_pelo.php';
            $obj2 = new largo_pelo($_POST['id']);
            break;
        case 'operaciones':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_operaciones.php';
            $obj2 = new operaciones($_POST['id']);
            break;
        case 'persona':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_persona.php';
            $obj2 = new persona($_POST['id']);
            break;
        case 'tipo_aporte':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tipo_aporte.php';
            $obj2 = new tipo_aporte($_POST['id']);
            break;
        case 'tamanio':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tamanio.php';
            $obj2 = new tamanio($_POST['id']);
            break;
        case 'ubicacion':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_ubicacion.php';
            $obj2 = new ubicacion($_POST['id']);
            break;
        case 'vacunas':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_vacunas.php';
            $obj2 = new vacunas($_POST['id']);
            break;
    }
    if ($obj2->delete()) {
        echo 1;
    } else {
        echo 0;
    }
} else {
    echo 'no se han enviado datos';
}
?>
