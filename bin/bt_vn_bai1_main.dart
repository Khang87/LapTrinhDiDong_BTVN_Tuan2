import 'package:bt_tuan2/bt_vn_bai1.dart';
import 'dart:io';

void main() {
  QL_HoaDon().NhapDanhSachHoaDon();
  QL_HoaDon().XuatDanhSachHoaDon();
  double tongThanhTien = QL_HoaDon().TinhTongThanhTien();
  double tongTienTroGia = QL_HoaDon().TinhTongTienTroGia();
  print('Tong thanh tien cua tat ca hoa don: $tongThanhTien');
  print('Tong tien tro gia cua tat ca hoa don: $tongTienTroGia');
  QL_HoaDon().ThongTinKhachHangMuaNhieuNhat();
  double tongChietKhauCongTy = QL_HoaDon().tongChietKhauCongTy();
  print('Tong chiet khau cho khach hang cong ty: $tongChietKhauCongTy');
  print('Sap xep danh sach hoa don theo ngay mua:');
  QL_HoaDon().SapXepDanhSach();
}
