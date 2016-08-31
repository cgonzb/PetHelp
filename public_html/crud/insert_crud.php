<?php

if (isset($_POST['tableName']) && ($_POST['data'])) {
    //se transforman las variables enviadas a un arreglo asociativo
    parse_str($_POST['data'], $datos);
    //dependiendo de la tabla
    switch ($_POST['tableName']) {
        case 'color':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_color.php';
            $obj2 = new color(null, $datos['Nombre']);
            break;
        case 'enfermedad':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_enfermedad.php';
            $obj2 = new enfermedad(null, $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'estado':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_estado.php';
            $obj2 = new estado(null, $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'largo_pelo':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_largo_pelo.php';
            $obj2 = new largo_pelo(null, $datos['Nombre']);
            break;
        case 'operaciones':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_operaciones.php';
            $obj2 = new operaciones(null, $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'persona':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_persona.php';
            $obj2 = new persona(null, $datos['Nombre'], $datos['Apellido'], $datos['Telefono'], $datos['Mail'], $datos['Usuario'], $datos['Password']);
            break;
        case 'tipo_aporte':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tipo_aporte.php';
            $obj2 = new tipo_aporte(null, $datos['Nombre'], $datos['Unidad']);
            break;
        case 'tamanio':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tamanio.php';
            $obj2 = new tamanio(null, $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'ubicacion':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_ubicacion.php';
            $obj2 = new ubicacion(null, $datos['Nombre'], $datos['Descripcion'], $datos['Lat'], $datos['Longi']);
            break;
        case 'vacunas':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_vacunas.php';
            $obj2 = new vacunas(null, $datos['Nombre'], $datos['Descripcion']);
            break;
    }
    if ($obj2->insert()) {
        echo 1;
    } else {
        echo 0;
    }
} else {
    echo 'no se han enviado datos';
}
?>
