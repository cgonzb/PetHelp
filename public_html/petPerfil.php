<?php
require_once dirname(__FILE__) . '/header.php';
if (isset($_GET['id'])) {
    require_once dirname(__FILE__) . '/crud/class_perro.php';
    $perro = new perro($_GET['id']);
    $dogData = $perro->getData();
    //print_r($dogData);
}
?>
<!-- div de titulo -->
<div style="width: 100%; height: 182px; position: relative;">
    <div style='width: 100%; height: 100%; position: absolute; top: 0; left: 0; '>
        <img src="img/fondo2.png" height="182" width="100%" />
    </div>
    <div class="white-text center-align" id="navi" style='width: 100%; height: 100%; position: absolute; top: 0; left: 0; z-index: 10;'>
        <h2 class="header">Perfil Mascota</h2>
    </div>
</div>
<!-- div de titulo -->
<div class="section z-depth-1 light-green accent-2 green-text">
    <div class="row container">
        <!-- Foto perro-->
        <div class="col s12 m4 light-green card-panel hoverable" style="padding: 1%;">
            <?php
            if ($dogData['id_Foto_Principal'] == 0) {
                echo '<img class="materialboxed responsive-img" src="img/perro1.jpg">';
            } else {
                echo '<img class="materialboxed responsive-img" src="pets/' . $dogData['id_Foto_Principal'] . '.png">';
            }
            ?>
            <button style="width: 100%;" class="btn btn-large green waves-effect">Apadrinar</button>
        </div>
        <!-- Foto perro -->
        <!-- Informacion Perro -->
        <div class="col s12 m8 light-green white-text card-panel hoverable">
            <h4 class="header center-align">Información</h4>
            <div class="col s12 m6">
                <table class="">
                    <tr>
                        <td>Nombre: </td>
                        <td><span class="chip"> <?php echo $dogData['Nombre']; ?> </span></td>
                    </tr>
                    <tr>
                        <td>Edad: </td>
                        <td><span class="chip"><?php echo $dogData['Edad']; ?> años</span></td>
                    </tr>
                    <tr>
                        <td>Tamaño: </td>
                        <td><span class="chip"><?php echo $dogData['Tamanio']; ?></span></td>
                    </tr>
                </table>
            </div>
            <div class="col s12 m6">
                <p style="text-align: justify;">
                    <?php echo $dogData['Descripcion']; ?>
                </p>
            </div>
        </div>
        <!-- informacion Perro -->
        <!-- informacion extra -->
        <div class="col s12 light-green card-panel hoverable">
            <ul class="tabs light-green">
                <li class="tab col s3"><a class="active white-text" href="#galery">Galeria</a></li>
                <li class="tab col s3"><a class=" white-text" href="#test2 ">Historial Médico</a></li>
                <li class="tab col s3"><a class=" white-text" href="#test3">Otro</a></li>
            </ul>
            <!-- tab 1 -->
            <div class="col s12" id="galery">
                <div class="carousel" style="height: 250px;">
                    <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/250/250/nature/1"></a>
                    <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/250/250/nature/2"></a>
                    <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/250/250/nature/3"></a>
                    <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/250/250/nature/4"></a>
                    <a class="carousel-item" href="#five!"><img src="http://lorempixel.com/250/250/nature/5"></a>
                </div>
            </div>
            <!-- tab1 -->
            <div class="col s12 green-text" id="test2" style="height: 250px;">
                <div class="collection">
                    <a class="collection-item">Vacuna anti-Igons - 23/06/2016</a>
                    <a class="collection-item">Esterilización - 23/06/2016</a>
                    <a class="collection-item">Antirabica - 23/06/2016</a>
                </div>
            </div>
            <div class="col s12 white-text" id="test3" style="height: 250px;">
                asdasd
            </div>
        </div>
        <!-- informacion extra -->
    </div>
</div>

<?php
require_once dirname(__FILE__) . '/footer.php';
?>