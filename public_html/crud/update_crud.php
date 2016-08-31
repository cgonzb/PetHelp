<?php

if (isset($_POST['tableName']) && isset($_POST['data'])) {
    $datos = $_POST['data'];
    switch ($_POST['tableName']) {
        case 'color':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_color.php';
            $obj2 = new color($datos['idColor'], $datos['Nombre']);
            break;
        case 'enfermedad':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_enfermedad.php';
            $obj2 = new enfermedad($datos['idEnfermedad'], $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'estado':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_estado.php';
            $obj2 = new estado($datos['idEstado'], $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'largo_pelo':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_largo_pelo.php';
            $obj2 = new largo_pelo($datos['idLargo_Pelo'], $datos['Nombre']);
            break;
        case 'operaciones':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_operaciones.php';
            $obj2 = new operaciones($datos['idOperaciones'], $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'persona':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_persona.php';
            $obj2 = new persona($datos['idPersona'], $datos['Nombre'], $datos['Apellido'], $datos['Telefono'], $datos['Mail'], $datos['Usuario'], $datos['Password']);
            break;
        case 'tipo_aporte':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tipo_aporte.php';
            $obj2 = new tipo_aporte($datos['idTipo_Aporte'], $datos['Nombre'], $datos['Unidad']);
            break;
        case 'tamanio':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_tamanio.php';
            $obj2 = new tamanio($datos['idTamanio'], $datos['Nombre'], $datos['Descripcion']);
            break;
        case 'ubicacion':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_ubicacion.php';
            $obj2 = new ubicacion($datos['idUbicacion'], $datos['Nombre'], $datos['Descripcion'], $datos['Lat'], $datos['Longi']);
            break;
        case 'vacunas':
            //se incluye la clase 
            require_once dirname(__FILE__) . '/class_vacunas.php';
            $obj2 = new vacunas($datos['idVacunas'], $datos['Nombre'], $datos['Descripcion']);
            break;
    }
    print_r($obj2->update());
} else {
    'no se han enviado datos!';
}
?>
