<main class="container my-4">
	<section id="top-sale" class="mt-4">
        <h4 id="topsale_header" class="font-rubik font-size-20 d-flex justify-content-center mt-5">
          Tìm nhanh
        </h4>
		<div class="row">
          <div class="col-md-4 col-sm-12 d-flex justify-content-center mt-2">
            <div class="card">
              <img  style="width: 200px; height: 150px;"
                class="card-img-top"
                src="img/CanTho_BenNK.png"
                alt="Phòng trọ Cần Thơ"
                onclick=""/>
              <div class="card-body">
                <h5> Phòng trọ Cần Thơ </h5> 
                <form action="page/search.php" method="post">
                  <input type="hidden" name="tinh_thanh" value="1">
                  <input type="hidden" name="gia" value="0">
                  <input type="hidden" name="dien_tich" value="0">
                  <input type="hidden" name="loai_nt" value="0">
                  <button type="submit" class="btn btn-primary" style="margin: 0 auto;">Tìm kiếm</button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-12 d-flex justify-content-center mt-2">
            <div class="card">
              <img  style="width: 200px; height: 150px;"
                class="card-img-top"
                src="img/HCM_QT.png"
                alt="Phòng trọ Hồ Chí Minh"
                onclick=""/>
              <div class="card-body">
                <h5> Phòng trọ Hồ Chí Minh </h5>
                <form action="page/search.php" method="post">
                  <input type="hidden" name="tinh_thanh" value="2">
                  <input type="hidden" name="gia" value="0">
                  <input type="hidden" name="dien_tich" value="0">
                  <input type="hidden" name="loai_nt" value="0">
                  <button type="submit" class="btn btn-primary" style="margin: 0 auto;">Tìm kiếm</button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-12 d-flex justify-content-center mt-2">
            <div class="card">
              <img  style="width: 200px; height: 150px;"
                class="card-img-top"
                src="img/LamDong_HXH.jpg"
                alt="Phòng trọ Lâm Đồng"
                onclick=""/>
              <div class="card-body">
                <h5> Phòng trọ Lâm Đồng </h5>
                <form action="page/search.php" method="post">
                  <input type="hidden" name="tinh_thanh" value="3">
                  <input type="hidden" name="gia" value="0">
                  <input type="hidden" name="dien_tich" value="0">
                  <input type="hidden" name="loai_nt" value="0">
                  <button type="submit" class="btn btn-primary" style="margin: 0 auto;">Tìm kiếm</button>
                </form>
              </div>
            </div>
          </div>
		</div>
    </section>
	<hr/>
    </main>