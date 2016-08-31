<?php

if (isset($_POST['usuario']) && isset($_POST['password'])) {
    session_start();
    require_once dirname(__FILE__) . '/../crud/class_persona.php';

    $obj = new persona(null, null, null, null, null, $_POST['usuario'], $_POST['password']);
    $userData = $obj->verify();
    if ($userData) {
        foreach ($userData[0] as $key => $data) {
            $_SESSION['user'][$key] = $data;
        }
        echo 1;
    } else {
        echo 0;
    }
} else {
    echo 'no se enviaron datos!';
}
?>
