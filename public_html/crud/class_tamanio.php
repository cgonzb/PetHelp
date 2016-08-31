<?php

class tamanio {

    /**
     *
     * @var string nombre de la tabla
     */
    public $tableName = 'tamanio';
    public $headers = ["idTamanio", "Nombre", "Descripcion", "Ultima_Mod"];
    public $ultima_mod = 'NOW()';

    public function __construct($idTamanio = 'null', $nombre = 'null', $descripcion = 'null') {
        $this->id = $idTamanio;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
    }

    public function update() {
        /**
         * @return boolean actualiza la tamanio
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "UPDATE " . $this->tableName . " SET Nombre = '" . $this->nombre . "', Descripcion = '" . $this->descripcion . "', Ultima_Mod = NOW()"
                . " WHERE idTamanio = " . $this->id . ";";
        /**
         * @var mysql resultado mysql
         */
        $res = mysql_query($query) or die(mysql_error() . ' -- ' . $query);

        if ($res) {
            return true;
        } else {
            return false;
        }
    }

    public function insert() {
        /**
         * @return boolean Inserta en la base de datos
         */
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        if ($this->nombre !== null) {
            $query = "INSERT INTO " . $this->tableName . " (";
            $i = 0;
            foreach ($this->headers as $columna) {
                if (++$i === count($this->headers)) {
                    $query.= $columna;
                } else {
                    $query.= $columna . ', ';
                }
            }
            $query.= ') VALUES ("null", "' . $this->nombre . '", "' . $this->descripcion . '", NOW())';

            $res = mysql_query($query) or die(mysql_error() . ' -- ' . $query);

            if ($res) {
                return true;
            } else {
                return $query; //la consulta no se ejecuto
            }
        } else {
            return $query; //no hay un dato asignado
        }
    }

    public function delete() {
        /**
         * @return boolean borra de la base de datos
         */
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        if ($this->id !== null) {
            $query = "DELETE FROM " . $this->tableName . " WHERE " . reset($this->headers) . "=" . $this->id;
            //result
            $res = mysql_query($query) or die(mysql_error() . ' -- ' . $query);

            if ($res) {
                return true;
            } else {
                return $query; //la consulta no se ejecuto
            }
        } else {
            return $query; //no hay un dato asignado
        }
    }

    public function getAll() {
        /**
         * 
         * @return array|false devuelve todas las tamanioes o falso si no hay
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "SELECT * FROM " . $this->tableName;
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
