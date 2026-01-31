import 'dart:math';

import 'package:bt_tuan2/bt_tuan2.dart';

void main() async {
  List<TienPhongHangThang> danhSachPhong = await readFile('bin/phongthue.txt');
  print("Danh sách các phòng loại A:");
  for (var phong in danhSachPhong) {
    if (phong is PhongLoaiA) {
      print(
        'Mã số phòng: ${phong.maSoPhong}, Số người ở: ${phong.soNguoiO}, Số người thân: ${phong.soNguoiThan}, Tiền phòng: ${phong.TinhTienPhong()}',
      );
    } else if (phong is PhongLoaiB) {
      print(
        'Mã số phòng: ${phong.maSoPhong}, Số người ở: ${phong.soNguoiO}, GiatUi: ${phong.giatUi}, Số máy: ${phong.soMay}, Tiền phòng: ${phong.TinhTienPhong()}',
      );
    }
  }
  print("\nDanh sách các phòng có số người thuê lớn hơn 2:");
  for (var phong in danhSachPhong) {
    if (phong.soNguoiO > 2) {
      print(
        'Mã số phòng: ${phong.maSoPhong}, Số người ở: ${phong.soNguoiO}, Tiền phòng: ${phong.TinhTienPhong()}',
      );
    }
  }
  int tongTienPhong = danhSachPhong.fold(
    0,
    (sum, phong) => sum + phong.TinhTienPhong(),
  );
  print("\nTổng tiền phòng thu được từ các phòng: $tongTienPhong");

  danhSachPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  print("\nDanh sách phòng thuê theo thứ tự giảm dần của số điện tiêu thụ:");
  for (var phong in danhSachPhong) {
    print(
      'Mã số phòng: ${phong.maSoPhong}, Số điện tiêu thụ: ${phong.soDien}, Tiền phòng: ${phong.TinhTienPhong()}',
    );
  }
  print('Danh sách đã được sắp xếp theo số điện tiêu thụ giảm dần');
  for (var phong in danhSachPhong) {
    print(
      'Mã số phòng: ${phong.maSoPhong}, Số điện tiêu thụ: ${phong.soDien}, Tiền phòng: ${phong.TinhTienPhong()}',
    );
  }
  print('Danh sach các phòng loại A:');
  for (var phong in danhSachPhong) {
    if (phong is PhongLoaiA) {
      print(
        'Mã số phòng: ${phong.maSoPhong}, Số người ở: ${phong.soNguoiO}, Số người thân: ${phong.soNguoiThan}, Tiền phòng: ${phong.TinhTienPhong()}',
      );
    }
  }
}
