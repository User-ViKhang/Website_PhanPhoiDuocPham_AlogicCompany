<?php include("inc/top.php"); ?>
    
<div class="row">
    <div class="col-sm-9">      
        <h3 class="text-info"><?php echo $mhct["tenmathang"]; ?></h3>
        <div><img width="500px" src="../<?php echo str_replace('\\', '/', $mhct["hinhanh"]); ?>.jpg"></div>
        
        <div>
            <h4 class="text-primary">Giá bán: 
                <span class="text-danger"><?php echo number_format($mhct["giagoc"]); ?> đ</span>
            </h4>
                <form method="post" class="form-inline">
                    <input type="hidden" name="action" value="chovaogio">
                    <input type="hidden" name="id" value="<?php echo $mhct["id"]; ?>">
                <div class="row">
                <div class="col">
                    <input type="number" class="form-control" name="soluong" value="1">
                </div>
                <div class="col">
                    <input type="submit" class="btn btn-primary" value="Chọn mua">
                </div>
                </div>		
                </form>  	  
        </div>
	  
    <div>
        <h4 class="text-primary">Mô tả sản phẩm: </h4>
        <p><?php echo $mhct["mota"]; ?></p>
      </div>
      <br>
    </div>
    
    
    <div class="col-sm-3"> 
        <h3 class="text-warning">Cùng danh mục:</h3>
        <?php
        foreach($danhmuc as $d){  
            $i=0;
        ?>
            <?php
                foreach($mathang as $m) {
                    if(($m["id"] != $mhct["id"]) && ($m["danhmuc_id"] == $d["id"] && $i < 3)){
                        $i++;
            ?>  
                    <div>
                        <div class="col mb-5">
                                <div class="card h-100 shadow">
                                    <!-- Sale badge-->
                                    <?php if ($m["giaban"] != $m["giagoc"]){ ?>
                                    <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Giảm giá</div>
                                    <?php } // end if ?>
                                    <!-- Product image-->
                                    <a href="?action=detail&id=<?php echo $m["id"]; ?>">
                                        <img class="card-img-top" src="../<?php echo str_replace('\\', '/', $m["hinhanh"]); ?>.jpg" alt="<?php echo $m["tenmathang"]; ?>" />
                                    </a>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <a class="text-decoration-none" href="?action=detail&id=<?php echo $m["id"]; ?>"><h5 class="fw-bolder text-info"><?php echo $m["tenmathang"]; ?></h5></a>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <?php if ($m["giaban"] != $m["giagoc"]){ ?>
                                            <span class="text-muted text-decoration-line-through"><?php echo number_format($m["giaban"]); ?>đ</span><?php } // end if ?>
                                            <span class="text-danger fw-bolder"><?php echo number_format($m["giagoc"]); ?>đ</span>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-info mt-auto" href="#">Chọn mua</a></div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    
                    <?php 
                    }
                }
                    ?>
                    
            
        <?php
        }
    
        ?>
        <div class="text-end mb-2"><a class="text-warning text-decoration-none fw-bolder" href="index.php?action=group&id=<?php echo $d["id"]; ?>">Xem thêm <?php echo $d["tendanhmuc"]; ?>
            </a></div>  
    </div>
    
</div>

<?php include("inc/bottom.php"); ?>