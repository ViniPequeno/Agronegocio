<?php
    class db{
        //properties
        private $dbhost = 'localhost';
        private $dbuser = 'root';
        private $dbpass = 'root';
        private $dbname = 'chickentracker';

        public function connect(){
            $url = "mysql:host=$this->dbhost;dbname=$this->dbname;";
            $dbConnection = new PDO($url, $this->dbuser, $this->dbpass);
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConnection;
        }


    }