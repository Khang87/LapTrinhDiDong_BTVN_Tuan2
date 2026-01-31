// //Bài tập 1. Thiết kế và xây dựng lớp cho chương trình tính tiền phòng hàng tháng cho
// một cơ sở cho thuê phòng trọ. Biết rằng mỗi phòng đều có thông tin sau: Mã số
// phòng, số người ở, số điện và số nước sử dụng. Cơ sở chia phòng ra làm 2 loại khác
// nhau:
// ▪ Phòng loại A: Có thêm thông tin về số lần người thân thăm và ở lại qua đêm
// (SoNguoithan) và tiền phòng được tính như sau:
// Tiền phòng = 1400 + 2*Số điện + 8*Số nước + 50*SoNguoithan
// ▪ Phòng loại B: Có thêm thông tin khối lượng giặt ủi (giatui), và số máy sử dụng
// internet (somay).
// Tiền phòng = 2000 + 2*Số điện + 8*Số nước + Giatui*5 + Somay*100
// Tạo file phongthue.txt (hoặc file xml tương ứng) có nội dung như sau:
// A001#4#30#10#2
// A002#6#45#20#4
// B001#4#50#20#32#4
// B002#2#30#40#20#2
// ▪ Hãy đọc nội dung file phongthue.txt vào danh sách phòng thuê.
// ▪ In ra màn hình thông tin các phòng thuê có trong danh sách.
// ▪ In ra danh sách các phòng có số người thuê lớn hơn 2.
// ▪ Tính tổng tiền phòng thu được từ các phòng.
// ▪ Sắp xếp danh sách phòng thuê theo thứ tự giảm dần của số điện tiêu thụ.
// ▪ In ra màn hình danh sách các phòng loại A.
import 'dart:io';
import 'bt_tuan2.dart';
import 'dart:async';

abstract class TienPhongHangThang {
  late String maSoPhong;
  late int soNguoiO;
  late int soDien;
  late int soNuocSuDung;
  int TinhTienPhong();
}

class PhongLoaiA extends TienPhongHangThang {
  late int soNguoiThan;

  @override
  int TinhTienPhong() {
    return 1400 + 2 * soDien + 8 * soNuocSuDung + 50 * soNguoiThan;
  }
}

class PhongLoaiB extends TienPhongHangThang {
  late int giatUi;
  late int soMay;

  @override
  int TinhTienPhong() {
    return 2000 + 2 * soDien + 8 * soNuocSuDung + giatUi * 5 + soMay * 100;
  }
}

Future<List<TienPhongHangThang>> readFile(String filePath) async {
  List<TienPhongHangThang> danhSachPhong = [];
  final file = File(filePath);
  final lines = await file.readAsLines();
  for (var line in lines) {
    var parts = line.split('#');
    if (parts[0].startsWith('A')) {
      var phongA = PhongLoaiA();
      phongA.maSoPhong = parts[0];
      phongA.soNguoiO = int.parse(parts[1]);
      phongA.soDien = int.parse(parts[2]);
      phongA.soNuocSuDung = int.parse(parts[3]);
      phongA.soNguoiThan = int.parse(parts[4]);
      danhSachPhong.add(phongA);
    } else if (parts[0].startsWith('B')) {
      var phongB = PhongLoaiB();
      phongB.maSoPhong = parts[0];
      phongB.soNguoiO = int.parse(parts[1]);
      phongB.soDien = int.parse(parts[2]);
      phongB.soNuocSuDung = int.parse(parts[3]);
      phongB.giatUi = int.parse(parts[4]);
      phongB.soMay = int.parse(parts[5]);
      danhSachPhong.add(phongB);
    }
  }
  return danhSachPhong;
}
