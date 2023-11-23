<?php
require("../model/database.php");
require("../model/danhmuc.php");
require("../model/mathang.php");

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
    default:
        break;
}
?>