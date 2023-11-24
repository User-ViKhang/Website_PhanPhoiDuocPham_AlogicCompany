<?php
require("../model/database.php");
require("../model/danhmuc.php");
require("../model/mathang.php");
<<<<<<< HEAD
require("../model/giohang.php");
=======
>>>>>>> 5c5381ad49a59b2099d97418c36022c78bcf56ed

if (isset($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
} else {
    $action = "null";
}

$dm = new DANHMUC();
$mh = new MATHANG();

$danhmuc = $dm->laydanhmuc();
$mathang = $mh->laymathang();

switch ($action) {
    case "null":
        include("main.php");
        break;
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 5c5381ad49a59b2099d97418c36022c78bcf56ed
    case "group":
        if (isset($_REQUEST["id"])) {
            $madm = $_REQUEST["id"];
            $dmuc = $dm->laydanhmuctheoid($madm);
            $tendm = $dmuc["tendanhmuc"];
            $mathang = $mh->laymathangtheodanhmuc($madm);
            include("group.php");
        } else {
            include("main.php");
        }
        break;
<<<<<<< HEAD
    case "hiengiohang":
        $giohang = laygiohang();
        require("cart.php");
        break;
    case "chovaogio":
        if (isset($_REQUEST["id"]))
            $id = $_REQUEST["id"];
        if (isset($_REQUEST["soluong"]))
            $soluong = $_REQUEST["soluong"];
        else
            $soluong = 1;
        if (isset($_SESSION["giohang"][$id])) {
            $soluong += $_SESSION["giohang"][$id];
            $_SESSION["giohang"][$id] = $soluong;
        } else {
            themhangvaogio($id, $soluong);
        }
        $giohang = laygiohang();
        require("cart.php");
        break;
=======
=======
>>>>>>> origin/havikhang_dth205809
>>>>>>> 5c5381ad49a59b2099d97418c36022c78bcf56ed
    default:
        break;
}
?>