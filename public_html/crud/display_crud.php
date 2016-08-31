<?php

/**
 * ARCHIVO DONDE SE CARGAN  LAS UBICACIONES
 */
if (isset($_GET['tableName'])) {
    switch ($_GET['tableName']) {
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
        default:
            $obj2 = 'no se encuentra en la BBDD';
    }
    if (is_object($obj2)) {

        echo "<table class='highlight bordered responsive-table' tableName='" . $obj2->tableName . "'><thead>";
        echo "<tr>";
        $headers = $obj2->headers;
        foreach ($headers as $header) {
            echo "<th>$header</th>";
        }
        echo "<th></th>";
        echo "</th></thead><tbody>";
        $all = $obj2->getAll();
        if ($all) {
            foreach ($all as $objet) {
                echo "<tr>";
                foreach ($objet as $key => $data) {
                    echo "<td name='" . $key . "'>" . $data . "</td>";
                }
                echo '<td>
       <i class="material-icons edit hoverable" style="cursor: pointer;">edit</i>
       <i class="material-icons save hoverable" style="cursor: pointer; display:none;">save</i>
       <i class="material-icons delete hoverable" style="cursor: pointer;">delete</i>
       <input class="select" type="checkbox" id="' . reset($objet) . '"/>
      <label for="' . reset($objet) . '"></label>   
</td>';
                echo "</tr>";
            }
        } else {
            echo "<tr class='orange darken-2 white-text center-align'><td colspan='" . (count($headers) + 1) . "'><strong>No hay elementos en la base de datos!</strong></td></tr>";
        }
        echo "</tbody></table>";
    } else {
        echo '<div class="card orange darken-2 white-text center-align">La clase correspondiente a la tabla no ha sido creada.</div>';
    }
}
?>
