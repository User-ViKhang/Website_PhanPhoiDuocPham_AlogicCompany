<?php
<<<<<<< HEAD
class DATABASE{
    private static $dns = "mysql:host=localhost;dbname=shop_btt;port=3306";
    private static $username = "root";
    private static $password = "vertrigo";
    private static $options = array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, 
                                    PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES utf8");    
=======
class DATABASE
{
    private static $dns = "mysql:host=localhost;dbname=shop_btt;port=3306";
    private static $username = "root";
    private static $password = "vertrigo";
    private static $options = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
    );
>>>>>>> 479fac642d8c04b9d7f97b0124264e443e454389
    private static $db;
    
    private function __construct(){} 
    
    public static function connect(){
        if(!isset(self::$db)){
            try{
                self::$db = new PDO(self::$dns, 
                                    self::$username, 
                                    self::$password, 
                                    self::$options);
            }
            catch(PDOException $e){
                $error_message = $e->getMessage();
                echo "<p>Lỗi kết nối: $error_message</p>";
                exit();
            }
        }
        return self::$db;
    }
    
    public static function close(){
        self::$db = null;
    }

    public static function execute_nonquery($sql, $option = array()) {
        self::getDB();
        if (self::$db != null) {
            try {
                $cmd = self::$db->prepare($sql);
                if (count($option) > 0) {
                    for ($i = 0; $i < count($option); $i++) {
                        $cmd->bindParam($i + 1, $option[$i]);
                    }
                }
                $cmd->execute();
                $ketqua = $cmd->fetchAll();
                return $ketqua;
            } catch (PDOException $ex) {
                ShowError($ex);
            }
        } else {
            ShowError("Lỗi kết nối cơ sở dữ liệu");
        }
        self::disconnect();
    }



}