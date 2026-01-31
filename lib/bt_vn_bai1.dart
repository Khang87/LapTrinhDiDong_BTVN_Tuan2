// //Công ty ABC chuyên phân phối máy lạnh cho các khách hàng trong thành phố. Với mỗi
// lần bán hàng công ty sẽ lưu trữ các thông tin của 01 hóa đơn gồm: Mã khách hàng, tên
// khách hàng, số lượng, giá bán. Thành tiền của mỗi hóa đơn sẽ được xác định bằng Số
// lượng*Giá bán - Chiết khấu + Thuế VAT. Trong đó thuế VAT là 10% của số lượng*giá
// bán. Chiết khấu được tính tùy vào loại khách hàng của công ty:
// ➢ Khách hàng cá nhân: Có thêm thông tin về khoảng cách giao hàng. Về mặt giá cả nếu
// số lượng <3 thì chiết khấu bằng 0 ngược lại khách hàng sẽ được chiết khấu 5% đơn giá
// trên từng sản phẩm. Tuy nhiên nếu khoảng cách từ công ty đến khách hàng nhỏ hơn 10
// km thì công ty sẽ chiết khấu cho khách hàng thêm 50.000 trên mỗi sản phẩm.
// ➢ Đại lý cấp 1: Có thêm thông tin về thời gian hợp tác giữa đại lý và công ty. Do là đối
// tác quan trọng của công ty, được công ty đặc biệt quan tâm nên đại lý cấp 1 luôn được
// chiết khấu 30% giá bán. Hơn nữa nếu thời gian hợp tác của đại lý với công ty lớn hơn 5
// năm thì cứ mỗi năm hợp tác sẽ được chiết khấu thêm 1% nhưng tối đa chỉ được chiết
// khấu là 35%.
// ➢ Khách hàng là công ty: Mỗi công ty có thêm thông tin về số lượng nhân viên. Khách
// hàng công ty sẽ được công ty ABC ưu đãi nhằm mục đích quảng bá sản phẩm đến nhân
// viên. Nếu công ty có số lượng nhân viên lớn hơn 1000 thì sẽ được chiết khấu 5%. Nếu
// số lượng nhân viên lớn hơn 5000 thì chiết khấu là 7%.

// Gần đây cho chiến lược hỗ trợ giá đối với các mặt hàng điện dân dụng đối với người
// dân trong thành phố nên hãng sản xuất có thêm chính sách trợ giá cho khách hàng cá
// nhân và khách hàng công ty.
// Khách hàng cá nhân: Trợ giá đối với mỗi sản phẩm là 2% giá bán. Nếu số lượng lớn
// hơn 2 sản phẩm thì được hỗ trợ thêm 100.000
// Khách hàng công ty: Với mỗi sản phẩm khách hàng công ty được giảm giá 120.000
// Giả sử bạn được là kỹ sư phần mềm được giao nhiệm vụ thiết kế và xây dựng lớp quản
// lý thông tin của tất cả các hóa đơn của công ty bán máy lạnh giống như công ty ABC.
// Yêu cầu:
// 1. Xây dựng lớp cho bài toán đã được mô tả ở trên với các yêu cầu:
// − Mã khách hàng là 6 kí tự, 2 kí tự đầu là KH, 4 kí tự theo sau là kí số, ví dụ: KH0002;
// nếu sai định dạng thông báo lỗi.
// − Tên khách hàng không được để trống
// − Số lượng >0
// − Giá bán>0
// − Tối thiểu 2 phương thức khởi tạo: phương thức khởi tạo mặc định và phương thức
// khởi tạo có tên có đầy đủ tham số.
// − Phương thức nhập thông tin.
// − Phương thức xuất thông tin: Các thành phần thuộc tính, thành tiền, trợ giá (nếu có)
// 2. Xây dựng class quản lý hóa đơn và các phương thức để thực hiện các công việc sau:
// − Nhập danh sách các hoá đơn
// − Xuất danh sách các hoá đơn
// − Tính tổng thành tiền của tất cả các hóa đơn.
// − Tính tổng tiền trợ giá mà công ty đã hỗ trợ.
// − Cho biết thông tin khách hàng có số lượng mua nhiều nhất.
// − Tổng số tiền chiết khấu của công ty là bao nhiêu đối với khách hàng công ty.
// − Sắp xếp danh sách tăng dần theo số lượng, nếu số lượng bằng nhau thì sắp xếp giảm
// dần theo thành tiền.
// − Xuất ra màn hình tất cả các hoá đơn mà khách hàng có mã x đã mua. Nếu khách
// hàng có mã x chưa mua hàng thì in ra thông báo: “Khách hàng lạ”.
// 4. Viết hàm main cho phép thực hiện quản lý các hoá đơn

import 'dart:io';

abstract class HoaDon {
  late String maKhachHang;
  late String tenKhachHang;
  late int soLuong;
  late double giaBan;
  get MaKhachHang => maKhachHang;
  set MaKhachHang(String value) {
    if (value.length != 6 ||
        !value.startsWith('KH') ||
        int.tryParse(value.substring(2)) == null) {
      throw FormatException("Mã khách hàng không hợp lệ");
    }
    maKhachHang = value;
  }

  get TenKhachHang => tenKhachHang;
  set TenKhachHang(String value) {
    if (value.isEmpty) {
      throw FormatException("Tên khách hàng không được để trống");
    }
    tenKhachHang = value;
  }

  get SoLuong => soLuong;
  set SoLuong(int value) {
    if (value <= 0) {
      throw FormatException("Số lượng phải lớn hơn 0");
    }
    soLuong = value;
  }

  get GiaBan => giaBan;
  set GiaBan(double value) {
    if (value <= 0) {
      throw FormatException("Giá bán phải lớn hơn 0");
    }
    giaBan = value;
  }

  HoaDon() {
    maKhachHang = 'ABC123';
    tenKhachHang = 'Nam';
    soLuong = 2;
    giaBan = 10000.0;
  }
  HoaDon.withDetails(
    this.maKhachHang,
    this.tenKhachHang,
    this.soLuong,
    this.giaBan,
  );

  double TinhThueVAT() {
    return 0.1 * soLuong * giaBan;
  }

  double TinhChietKhau();
  double TinhTroGia();
  void NhapThongTin() {
    stdout.write('Nhập mã khách hàng: ');
    MaKhachHang = stdin.readLineSync()!;
    stdout.write('Nhập tên khách hàng: ');
    TenKhachHang = stdin.readLineSync()!;
    stdout.write('Nhập số lượng: ');
    SoLuong = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập giá bán: ');
    GiaBan = double.parse(stdin.readLineSync()!);
  }

  void XuatThongTin() {
    print(
      'Mã khách hàng: $maKhachHang, Tên khách hàng: $tenKhachHang, Số lượng: $soLuong, Giá bán: $giaBan, Thành tiền: ${soLuong * giaBan - TinhChietKhau() + TinhThueVAT()}',
    );
  }
}

class KhachHangCaNhan extends HoaDon {
  late double khoangCachGiaoHang;
  @override
  void NhapThongTin() {
    super.NhapThongTin();
    stdout.write('Nhập khoảng cách giao hàng (km): ');
    khoangCachGiaoHang = double.parse(stdin.readLineSync()!);
  }

  double TinhChietKhau() {
    double chietKhau = 0;
    if (soLuong >= 3) {
      chietKhau += 0.05 * giaBan * soLuong;
    }
    if (khoangCachGiaoHang < 10) {
      chietKhau += 50000 * soLuong;
    }
    return chietKhau;
  }

  double TinhTroGia() {
    double troGia = 0.02 * giaBan * soLuong;
    if (soLuong > 2) {
      troGia += 100000;
    }
    return troGia;
  }

  double TinhThanhTien() {
    return soLuong * giaBan - TinhChietKhau() + TinhThueVAT() - TinhTroGia();
  }
}

class DaiLyCap1 extends HoaDon {
  late int thoiGianHopTac;
  @override
  void NhapThongTin() {
    super.NhapThongTin();
    stdout.write('Nhập thời gian hợp tác (năm): ');
    thoiGianHopTac = int.parse(stdin.readLineSync()!);
  }

  double TinhTroGia() {
    return 0;
  }

  double TinhChietKhau() {
    double chietKhau = 0.3 * giaBan * soLuong;
    if (thoiGianHopTac > 5) {
      int namThem = thoiGianHopTac - 5;
      double phanTramThem = namThem * 0.01;
      if (phanTramThem > 0.05) {
        phanTramThem = 0.05;
      }
      chietKhau += phanTramThem * giaBan * soLuong;
    }
    return chietKhau;
  }

  double TinhThanhTien() {
    return soLuong * giaBan - TinhChietKhau() + TinhThueVAT();
  }
}

class KhachHangCongTy extends HoaDon {
  late int soLuongNhanVien;
  @override
  void NhapThongTin() {
    super.NhapThongTin();
    stdout.write('Nhập số lượng nhân viên: ');
    soLuongNhanVien = int.parse(stdin.readLineSync()!);
  }

  double TinhChietKhau() {
    double chietKhau = 0;
    if (soLuongNhanVien > 1000) {
      chietKhau += 0.05 * giaBan * soLuong;
    }
    if (soLuongNhanVien > 5000) {
      chietKhau += 0.07 * giaBan * soLuong;
    }
    return chietKhau;
  }

  double TinhTroGia() {
    return 120000 * soLuong.toDouble();
  }

  double TinhThanhTien() {
    return soLuong * giaBan - TinhChietKhau() + TinhThueVAT() - TinhTroGia();
  }
}

class QL_HoaDon {
  List<HoaDon> danhSachHoaDon = [];

  void NhapDanhSachHoaDon() {
    stdout.write('Nhập số lượng hóa đơn: ');
    int n = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < n; i++) {
      stdout.write(
        'Chọn loại khách hàng (1 - Cá nhân, 2 - Đại lý cấp 1, 3 - Công ty): ',
      );
      int choice = int.parse(stdin.readLineSync()!);
      HoaDon hoaDon;
      if (choice == 1) {
        hoaDon = KhachHangCaNhan();
      } else if (choice == 2) {
        hoaDon = DaiLyCap1();
      } else {
        hoaDon = KhachHangCongTy();
      }
      hoaDon.NhapThongTin();
      danhSachHoaDon.add(hoaDon);
    }
  }

  void XuatDanhSachHoaDon() {
    for (var hoaDon in danhSachHoaDon) {
      hoaDon.XuatThongTin();
    }
  }

  double TinhTongThanhTien() {
    double tongThanhTien = 0;
    for (var hoaDon in danhSachHoaDon) {
      if (hoaDon is KhachHangCaNhan) {
        tongThanhTien += hoaDon.TinhThanhTien();
      } else if (hoaDon is DaiLyCap1) {
        tongThanhTien += hoaDon.TinhThanhTien();
      } else if (hoaDon is KhachHangCongTy) {
        tongThanhTien += hoaDon.TinhThanhTien();
      }
    }
    return tongThanhTien;
  }

  double TinhTongTienTroGia() {
    double tongTroGia = 0;
    for (var hoaDon in danhSachHoaDon) {
      if (hoaDon is KhachHangCaNhan) {
        tongTroGia += hoaDon.TinhTroGia();
      } else if (hoaDon is KhachHangCongTy) {
        tongTroGia += hoaDon.TinhTroGia();
      }
    }
    return tongTroGia;
  }

  void ThongTinKhachHangMuaNhieuNhat() {
    if (danhSachHoaDon.isEmpty) {
      print('Danh sách hóa đơn trống.');
      return;
    }
    HoaDon khachHangMax = danhSachHoaDon[0];
    for (var hoaDon in danhSachHoaDon) {
      if (hoaDon.soLuong > khachHangMax.soLuong) {
        khachHangMax = hoaDon;
      }
    }
    print('Khách hàng mua nhiều nhất:');
    khachHangMax.XuatThongTin();
  }

  double tongChietKhauCongTy() {
    return danhSachHoaDon.whereType<KhachHangCongTy>().fold(
      0,
      (sum, item) => sum + item.TinhChietKhau(),
    );
  }

  void SapXepDanhSach() {
    danhSachHoaDon.sort((a, b) {
      if (a.soLuong != b.soLuong) {
        return a.soLuong.compareTo(b.soLuong);
      } else {
        double thanhTienA =
            a.soLuong * a.giaBan - a.TinhChietKhau() + a.TinhThueVAT();
        double thanhTienB =
            b.soLuong * b.giaBan - b.TinhChietKhau() + b.TinhThueVAT();
        return thanhTienB.compareTo(thanhTienA);
      }
    });
  }

  void XuatHoaDonTheoMa(String maX) {
    bool found = false;
    for (var hoaDon in danhSachHoaDon) {
      if (hoaDon.maKhachHang == maX) {
        hoaDon.XuatThongTin();
        found = true;
      }
    }
    if (!found) {
      print('Khách hàng lạ.');
    }
  }
}
