<?php
require("./inc/top.php");
if (demhangtronggio() == 0) {
    echo '<h3 class="text-info">Giỏ hàng rỗng</h3>
          <p>Vui lòng chọn thêm sản phẩm</p>
          <button class="btn btn-secondary mt-2">
          <a href="index.php" class="text-light" style="text-decoration: none">Thoát</a>
      </button>';

} else {
    ?>
    <h3 class="text-info">Gio hang cua ban:</h3>
    <form action="index.php">
        <table class="table table-hover">
            <tr>
                <th>Hình ảnh</th>
                <th>Tên hàng</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
            <?php foreach ($giohang as $id => $mh) { ?>
                <tr>
                    <td><img width="50" src="../<?= str_replace("\\", "/", $mh["hinhanh"]) ?>.jpg" alt=""></td>
                    <td>
                        <?= $mh["tenmathang"] ?>
                    </td>
                    <td>
                        <?= number_format($mh["giaban"]) ?> đ
                    </td>
                    <td><input type="number" name="mh[<?= $id ?>]" value="<?= $mh["soluong"] ?>"></td>
                    <td>
                        <?= number_format($mh["thanhtien"]) ?> đ
                    </td>
                    <td class="text-center">
                        <button class="btn btn-secondary">
                            <a href="index.php?action=xoaitem&id=<?= $id ?>" class="text-light"
                                style="text-decoration: none">Xóa</a>
                        </button>
                    </td>
                </tr>
            <?php } ?>
            <tr>
                <td colspan="3"></td>
                <td class="fw-bold">Tổng tiền</td>
                <td class="text-danger fw-bold">
                    <?= number_format(tinhtiengiohang()) ?> đ
                </td>
            </tr>
        </table>
        <div class="row">
            <div class="col">
                <button class="btn btn-secondary">
                    <a href="index.php?action=xoagiohang" class="text-light" style="text-decoration: none">Xóa tất cả</a>
                </button>
                (Xóa một mặt hàng nhập số lượng = 0)
            </div>
            <div class="col text-end">
                <input type="hidden" name="action" value="capnhatgiohang">
                <input type="submit" value="Cập nhật" class="btn btn-warning">
                <a href="index.php?action=thanhtoan" class="btn btn-success">Thanh toán</a>
            </div>
        </div>
    </form>
    <button class="btn btn-secondary mt-2">
        <a href="index.php" class="text-light" style="text-decoration: none">Thoát</a>
    </button>
<?php }
require("./inc/bottom.php")
    ?>