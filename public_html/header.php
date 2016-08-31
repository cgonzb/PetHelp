<?php
session_start(); //inicio de sesion
if (!isset($_SESSION['user']['Nombre']) || !isset($_SESSION['user']['Nivel_Acceso'])) {
    
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Abandonados Peñalolén</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- JAVASCRIPT-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>

        <!-- favico-->
        <link rel="shortcut icon" href="paw.ico" type="image/x-icon">
        <link rel="icon" href="paw.ico" type="image/x-icon">

        <!-- CSS-->
        <link rel="stylesheet"  href="css/materialize.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css"/>
    </head>

    <body>
        <!-- Barra de Nav -->
        <div class="navbar-fixed">
            <nav>
                <div class="nav-wrapper black">
                    <a href="index.php" class="brand-logo">Abandonados Peñalolen</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="http://xn--abandonadospealolen-73b.cl/">Inicio</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=83">Participa</a></li>
                        <li><a href="index.php">Apadrinaje</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=32">Patrocinadores</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=30">Quienes somos?</a></li>
                        <li><a href="contacto.html">Contacto</a></li>
                        <!-- Dropdown Trigger -->
                        <?php
                        if (isset($_SESSION['user']['Nombre'])) {
                            echo '<li><a class="dropdown-button" href="#!" data-activates="dropdown1">Hola <strong>' . $_SESSION['user']['Nombre'] . '</strong><i class="material-icons right">arrow_drop_down</i></a></li>';
                        } else {
                            echo '<li><a class="dropdown-button modal-trigger" href="#modalLogin">Ingresar</a></li>';
                        }
                        ?>
                    </ul>
                    <!-- Menu en Celular-->
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="http://xn--abandonadospealolen-73b.cl/">Inicio</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=83">Participa</a></li>
                        <li><a href="index.php">Apadrinaje</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=32">Patrocinadores</a></li>
                        <li><a href="http://xn--abandonadospealolen-73b.cl/?page_id=30">Quienes somos?</a></li>
                        <li><a href="contacto.html">Contacto</a></li>
                        <li class="divider"></li>
                        <!-- Dropdown Trigger -->
                        <?php
                        if (isset($_SESSION['user']['Nombre'])) {
                            echo '<li><a href="#!">Mi Perfil</a></li>';
                            if ($_SESSION['user']['Nivel_Acceso'] == 2 || $_SESSION['user']['Nivel_Acceso'] == 3) {
                                echo '<li><a href="#!">Admin</a></li>';
                            }
                            if ($_SESSION['user']['Nivel_Acceso']) {
                                echo '<li><a href="crud_admin.php">CRUD</a></li>';
                            }
                            echo '<li><a href="ajax/logout.php" id="logout">Cerrar Sesión</a></li>';
                        } else {
                            echo '<li><a class="dropdown-button modal-trigger" href="#modalLogin">Ingresar</a></li>';
                        }
                        ?>
                        <!-- Dropdown Trigger -->
                    </ul>
                </div>
            </nav>
        </div>
        <ul id="dropdown1" class="dropdown-content small">
            <?php
            if (isset($_SESSION['user']['Nombre'])) {
                echo '<li><a href="#!">Mi Perfil</a></li>';
                if ($_SESSION['user']['Nivel_Acceso'] == 2 || $_SESSION['user']['Nivel_Acceso'] == 3) {
                    echo '<li><a href="#!">Admin</a></li>';
                }
                if ($_SESSION['user']['Nivel_Acceso']) {
                    echo '<li><a href="crud_admin.php">CRUD</a></li>';
                }
            }
            ?>
            <li class="divider"></li>
            <li><a href="ajax/logout.php" id="logout">Cerrar Sesión</a></li>
        </ul>
        <!-- Finaliza la NAVBAR-->
        <?php include_once 'usuario/modalLogin.html'; ?>