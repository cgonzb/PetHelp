<?php

class tabla {

    /**
     *
     * @var array arreglo con los encabezados de la tabla
     */
    public static $DB = 'netbau_perros';

    public static function create() {
        /**
         * @return boolean Inserta en la base de datos
         */
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
    }

    public function delete() {
        /**
         * @return boolean borra de la base de datos
         */
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
    }

    public static function getAll() {
        /**
         * 
         * @return array|false devuelve todas las ubicaciones o falso si no hay
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "SELECT table_name as tableName FROM information_schema.tables WHERE table_schema='netbau_perros';";
        /**
         * @var mysql resultado mysql
         */
        $res = mysql_query($query) or die(mysql_error() . ' -- ' . $query);

        if (mysql_num_rows($res) >= 1) {
            while ($row = mysql_fetch_assoc($res)) {
                $result [] = $row;
            }
            return $result;
        } else {
            return false;
        }
    }

}

?>
