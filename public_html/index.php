<?php require_once 'header.php'; ?>
<!-- div de titulo -->
<div style="width: 100%; height: 182px; position: relative;">
    <div style='width: 100%; height: 100%; position: absolute; top: 0; left: 0; '>
        <img src="img/fondo2.png" height="182" width="100%" />
    </div>
    <div class="white-text center-align" id="navi" style='width: 100%; height: 100%; position: absolute; top: 0; left: 0; z-index: 10;'>
        <h2 class="header">Apadrina o Adopta</h2>
    </div>
</div>
<!-- div de titulo -->
<!-- call to action -->
<div class="section z-depth-1 center-align light-green accent-2">
    <div class="row valign-wrapper">
        <div class="col s12">
            <a class="waves-effect waves-light btn-large center-align orange darken-1" style="width: 100%; text-transform: uppercase;">Cómo ayudar?<i class="material-icons right">info</i></a>
        </div>
    </div>
</div> 
<!-- call to action -->
<!-- fichas de los perros -->
<div class="section z-depth-1 light-green accent-2 white-text">
    <div class="container">
        <div class="row">
            <?php
            require_once dirname(__FILE__) . '/crud/class_perro.php';
            $obj = new perro();
            if (is_object($obj)) {
                $perros = $obj->getAll();
                if ($perros) {
                    foreach ($perros as $perro) {
                        echo '<!-- TARJETA DE PERRO-->
            <div class="col s12 m6 l3">
                <div class="card hoverable">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="pets/' . $perro['id_Foto_Principal'] . '.png">
                    </div>
                    <div class="card-content center-align">
                           <span class="card-title activator grey-text text-darken-4 center-align col s12">' . $perro['Nombre'] . '<i class="material-icons right">more_vert</i></span>
                           <a class="btn  waves-effect waves-cyan green s12" href="petPerfil.php?id=' . $perro['idPerro'] . '">Ver Perfil</a>
                    
                    </div>
                    <div class="card-reveal green white-text">
                        <span class="card-title">' . $perro['Nombre'] . '<i class="material-icons right">close</i></span>
                        <div class="divider"></div>
                        <table class="condensed centered highlight">
                            <tr>
                                <td>Edad</td>
                                <td><span class="chip light-green white-text">' . $perro['Edad'] . ' años</span></td>
                            </tr>
                            <tr>
                                <td>Tamaño</td>
                                <td><span class="chip light-green white-text">' . $perro['Tamanio'] . '</span></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Bueno con niños
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span class="chip white-text center-align">';
                        for ($i = 0; $i < $perro['Est_Ninios']; $i++) {
                            echo '<img src="img/tick_green.png">';
                        }
                        echo '</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Energia
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span class="chip light-green white-text">';
                        for ($i = 0; $i < $perro['Est_Ener']; $i++) {
                            echo '<img src="img/lightning.png">';
                        }
                        echo '</span>
                                </td>
                            </tr>
                        </table>
                        <div class="center-align">
                            <a class="btn waves-effect waves-blue white green-text" href="petPerfil.php?id=' . $perro['idPerro'] . '">Ver Perfil</a>
                        </div>
                    </div>
                </div>
            </div>';
                    }
                }//si hay perros
                //print_r($perros);
            }//si es obj
//            for ($i = 0; $i < 8; $i++) {
//                echo '<!-- TARJETA DE PERRO-->
//            <div class="col s12 m6 l3">
//                <div class="card hoverable">
//                    <div class="card-image waves-effect waves-block waves-light">
//                        <img class="activator" src="img/perro1.jpg">
//                    </div>
//                    <div class="card-content center-align">
//                        <span class="card-title activator grey-text text-darken-4 center-align">'.$perro['Nombre'].'<i class="material-icons right">more_vert</i></span>
//                        <a class="btn  waves-effect waves-cyan green" href="petPerfil.php">Ver Perfil</a>
//                    </div>
//                    <div class="card-reveal green white-text">
//                        <span class="card-title">'.$perro['Nombre'].'<i class="material-icons right">close</i></span>
//                        <div class="divider"></div>
//                        <table class="condensed centered highlight">
//                            <tr>
//                                <td>Edad</td>
//                                <td><span class="chip light-green white-text">12 años</span></td>
//                            </tr>
//                            <tr>
//                                <td>Género</td>
//                                <td><span class="chip light-green white-text">Masculino</span></td>
//                            </tr>
//                            <tr>
//                                <td colspan="2">
//                                    Carácteristica 1
//                                </td>
//                            </tr>
//                            <tr>
//                                <td colspan="2">
//                                    <span class="chip light-green white-text">5/5</span>
//                                </td>
//                            </tr>
//                            <tr>
//                                <td colspan="2">
//                                    Carácteristica 2
//                                </td>
//                            </tr>
//                            <tr>
//                                <td colspan="2">
//                                    <span class="chip light-green white-text">5/5</span>
//                                </td>
//                            </tr>
//                        </table>
//                        <div class="center-align">
//                            <a class="btn  waves-effect waves-blue white green-text">Ver Perfil</a>
//                        </div>
//                    </div>
//                </div>
//            </div>';
//            }
            ?>
        </div>

        <div class="row">
            <div class="col s12 center-align">
                <button class="btn white green-text waves-effect">Ver más...</button>
            </div>
        </div>
    </div>
</div>
<!-- ficha de los perros -->

<?php require_once 'footer.php'; ?>
