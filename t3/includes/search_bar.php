<form action="./page/search.php" method="post">
    <div class="search-bar" >
      <label for="tinh_thanh">Tỉnh/Thành phố:</label>
      <select id="tinh_thanh" name="tinh_thanh">
        <option value="0">Tất cả</option>
        <option value="1">Cần Thơ</option>
        <option value="2">TP. Hồ Chí Minh</option>
        <option value="3">Lâm Đồng</option>
        <option value="4">Cà Mau</option>
        <option value="5">Vĩnh Long</option>
        </select>

      <label for="gia">Giá:</label>
      <select id="gia" name="gia">
        <option value="0">Tất cả</option>
        <option value="1">Dưới 1 triệu</option>
        <option value="3">1 - 3 triệu</option>
        <option value="5">3 - 5 triệu</option>
        <option value="7">5 - 7 triệu</option>
        <option value="9">Trên 7 triệu</option>
        </select>

      <label for="dien_tich">Diện tích:</label>
      <select id="dien_tich" name="dien_tich">
        <option value="0">Tất cả</option>
        <option value="20">Dưới 20m²</option>
        <option value="50">20 - 50m²</option>
        <option value="80">50 - 80m²</option>
        <option value="90">Trên 80m²</option>
        </select>

      <label for="loai_nt">Loại nhà trọ</label>
      <select id="loai_nt" name="loai_nt">
        <option value="0">Tất cả</option>
        <option value="CHDV">Căn hộ dịch vụ</option>
        <option value="KTX">Ký túc xá</option>
        <option value="NTCC">Nhà trọ cao cấp</option>
        <option value="NTCN">Nhà trọ công nhân</option>
        <option value="NTDH">Nhà trọ dài hạn</option>
        <option value="NTGD">Nhà trọ gia đình</option>
        <option value="NTNH">Nhà trọ ngắn hạn</option>
        <option value="NTSV">Nhà trọ sinh viên</option>
        </select>
      <button type="submit" >Tìm kiếm</button>
    </div>
  </form>