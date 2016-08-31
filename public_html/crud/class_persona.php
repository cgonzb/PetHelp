<?php

class persona {

    /**
     *
     * @var string nombre de la tabla
     */
    public $tableName = 'persona';
    public $headers = ["idPersona", "Nombre", "Apellido", "Telefono", "Mail", "Usuario", "Password", "Nivel_Acceso", "Ultima_Mod"];
    public $nivel_acceso = 1;
    public $ultima_mod = 'NOW()';

    public function __construct($idPersona = 'null', $nombre = 'null', $apellido = 'null', $telefono = 'null', $mail = 'null', $usuario = 'null', $password = 'null') {
        $this->id = $idPersona;
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->telefono = $telefono;
        $this->mail = $mail;
        $this->usuario = $usuario;
        $this->password = $password;
    }

    public function verify() {
        if (property_exists($this, 'password') && property_exists($this, 'usuario')) {
            require_once dirname(__FILE__) . '/../config/dbconfig.php';

            $query = 'SELECT idPersona, Nombre, Apellido, Telefono, Mail, Nivel_Acceso, Ultima_Mod '
                    . 'FROM ' . $this->tableName . ' '
                    . 'WHERE usuario="' . $this->usuario . '" AND password ="' . $this->password . '";';
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

    public function update() {
        /**
         * @return boolean actualiza la persona
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "UPDATE " . $this->tableName . " SET Nombre = '" . $this->nombre . "', Apellido = '" . $this->apellido . "', Telefono = " . $this->telefono . ", Mail = '" . $this->mail . "', Usuario = '" . $this->usuario . "', Password = '" . $this->password . "', Nivel_Acceso = " . $this->nivel_acceso . ", Ultima_Mod = NOW()"
                . " WHERE idPersona = " . $this->id . ";";
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
            $query.= ') VALUES ("null", "' . $this->nombre . '", "' . $this->apellido . '", "' . $this->telefono . '", "' . $this->mail . '", "' . $this->usuario . '", "' . $this->password . '", 1, NOW())';

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
         * @return array|false devuelve todas las personaes o falso si no hay
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
