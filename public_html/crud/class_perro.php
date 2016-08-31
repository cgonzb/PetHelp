<?php

class perro {

    /**
     *
     * @var string nombre de la tabla
     */
    public $tableName = 'perro';
    public $abbr = 'P';
    public $headers = ["idPerro", "Nombre", "Apellido", "Telefono", "Mail", "Usuario", "Password", "Nivel_Acceso", "Ultima_Mod"];
    public $ultima_mod = 'NOW()';

    public function __construct($idPerro = 'null', $nombre = 'null', $apellido = 'null', $telefono = 'null', $mail = 'null', $usuario = 'null', $password = 'null') {
        $this->id = $idPerro;
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

            $query = 'SELECT idPerro, Nombre, Apellido, Telefono, Mail, Nivel_Acceso, Ultima_Mod '
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

    public function getData() {
        if (property_exists($this, 'id')) {
            if ($this->id != null) {
                //incluye la conexion a la base de datos
                require_once dirname(__FILE__) . '/../config/dbconfig.php';
                /**
                 * @var string query de ejecución
                 */
                $query = "SELECT idPerro, P.Nombre as Nombre, (YEAR(NOW()) - YEAR(P.Fecha_Nacimiento))  as Edad, P.Peso as Peso, T.Nombre as Tamanio, T.Descripcion as Tamanio_Descripcion, P.Fecha_Ultima_Desparacitacion as FUD, C.Nombre as Color, Est_Ninios, Est_Perros, "
                        . "id_Foto_Principal, P.Descripcion "
                        . "FROM perro P, tamanio T, color C WHERE Tamanio_idTamanio = idTamanio AND Color_idColor = idColor AND idPerro = " . $this->id . ";";
                /**
                 * @var mysql resultado mysql
                 */
                $res = mysql_query($query) or die(mysql_error() . ' -- ' . $query);

                if (mysql_num_rows($res) >= 1) {
                    while ($row = mysql_fetch_assoc($res)) {
                        $result [] = $row;
                    }
                    return $result[0];
                } else {
                    return false; //mysql result
                }
            } else {
                return false; //id nulo
            }
        } else {
            return false; // no existe la propiedad
        }
    }

    public function update() {
        /**
         * @return boolean actualiza la perro
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "UPDATE " . $this->tableName . " SET Nombre = '" . $this->nombre . "', Apellido = '" . $this->apellido . "', Telefono = " . $this->telefono . ", Mail = '" . $this->mail . "', Usuario = '" . $this->usuario . "', Password = '" . $this->password . "', Nivel_Acceso = " . $this->nivel_acceso . ", Ultima_Mod = NOW()"
                . " WHERE idPerro = " . $this->id . ";";
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
         * @return array|false devuelve todas las perroes o falso si no hay
         */
        //incluye la conexion a la base de datos
        require_once dirname(__FILE__) . '/../config/dbconfig.php';
        /**
         * @var string query de ejecución
         */
        $query = "SELECT idPerro, P.Nombre as Nombre, (YEAR(NOW()) - YEAR(P.Fecha_Nacimiento))  as Edad, P.Peso as Peso, T.Nombre as Tamanio, T.Descripcion as Tamanio_Descripcion, P.Fecha_Ultima_Desparacitacion as FUD, C.Nombre as Color, Est_Ninios, Est_Ener, id_Foto_Principal"
                . " FROM perro P, tamanio T, color C WHERE Tamanio_idTamanio = idTamanio AND Color_idColor = idColor AND id_Foto_Principal > 0;";
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
