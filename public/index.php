<?php
require("../model/database.php");
require("../model/danhmuc.php");
require("../model/mathang.php");
require("../model/giohang.php");
if (isset($_REQUEST["action"])) {
    $action = $_REQUEST["action"];
} else {
    $action = "null";
}

$dm = new DANHMUC();
$danhmuc = $dm->laydanhmuc();
$mh = new MATHANG();
$mathangxemnhieu = $mh->laymathangxemnhieu();


switch ($action) {
    case "null":
        $mathang = $mh->laymathang();
        include("main.php");
        break;
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
    case "detail":
        if (isset($_GET["id"])) {
            $mahang = $_GET["id"];
            // tăng lượt xem lên 1
            $mh->tangluotxem($mahang);
            // lấy thông tin chi tiết mặt hàng
            $mhct = $mh->laymathangtheoid($mahang);
            // lấy các mặt hàng cùng danh mục
            $madm = $mhct["danhmuc_id"];
            $mathang = $mh->laymathangtheodanhmuclimit_2($madm);
            include("detail.php");
        }
        break;
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
    case "xoagiohang":
        xoagiohang();
        require("cart.php");
        break;
    case "capnhatgiohang":
        if (isset($_REQUEST["mh"])) {
            $mh = $_REQUEST["mh"];
            foreach ($mh as $id => $soluong) {
                if ($soluong > 0) {
                    capnhatsoluong($id, $soluong);
                } else {
                    xoamotmathang($id);
                }
            }
            $giohang = laygiohang();
            require("cart.php");
            break;
        }
        break;
    case "searchkey":
        if (isset($_POST["key"])) {
            $key = $_POST["key"];
            $mathang = $mh->laymathangtheokey($key);
            include("main.php");
        } else {
            echo "Err";
        }
        break;
    case "xoaitem":
        xoamotmathang($_GET["id"]);
        $giohang = laygiohang();
        require("cart.php");
        break;
    default:
        break;
}
?>