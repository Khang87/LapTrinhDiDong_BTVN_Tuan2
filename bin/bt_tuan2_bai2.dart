import 'package:bt_tuan2/bt_tuan2_bai2.dart';
import 'dart:io';

void main() async {
  print('Nhap danh sach mon hoc : ');
  List<DTB> danhSachMonHoc = [];
  stdout.write('Nhap so luong mon hoc: ');
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    stdout.write(
      'Chon loai mon hoc (1 - Ly Thuyet, 2 - Thuc Hanh, 3 - Do An): ',
    );
    int choice = int.parse(stdin.readLineSync()!);
    DTB monHoc;
    if (choice == 1) {
      monHoc = LyThuyet();
    } else if (choice == 2) {
      monHoc = ThucHanh();
    } else {
      monHoc = DoAn();
    }
    monHoc.NhapDanhSachMonHoc();
    danhSachMonHoc.add(monHoc);
  }
  print('Danh sach mon hoc vua nhap:');
  for (var monHoc in danhSachMonHoc) {
    monHoc.XuatDanhSachMonHoc();
  }
  print('Sap xep danh sach mon hoc theo so tin chi tang dan:');
  danhSachMonHoc.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
  for (var monHoc in danhSachMonHoc) {
    monHoc.XuatDanhSachMonHoc();
  }
  print('Cac mon hoc co so tin chi cao nhat:');
  int maxSoTinChi = danhSachMonHoc
      .map((monHoc) => monHoc.soTinChi)
      .reduce((a, b) => a > b ? a : b);
  for (var monHoc in danhSachMonHoc) {
    if (monHoc.soTinChi == maxSoTinChi) {
      monHoc.XuatDanhSachMonHoc();
    }
  }
  print('Nhap ten mon hoc can tim: ');
  String tenCanTim = stdin.readLineSync()!;
  print('Ket qua tim kiem:');

  bool found = false; // Biến cờ xác định tìm thấy hay chưa

  for (var monHoc in danhSachMonHoc) {
    if (monHoc.tenMonHoc.toLowerCase().contains(tenCanTim.toLowerCase())) {
      monHoc.XuatDanhSachMonHoc();
      found = true;
    }
  }

  // Thực hiện thêm mới ngoài vòng lặp nếu không tìm thấy
  if (!found) {
    print('Khong tim thay mon hoc. Nhap thong tin mon hoc moi:');
    stdout.write(
      'Chon loai mon hoc moi (1 - Ly Thuyet, 2 - Thuc Hanh, 3 - Do An): ',
    );
    int choice = int.parse(stdin.readLineSync()!);
    DTB monHocMoi;
    if (choice == 1) {
      monHocMoi = LyThuyet();
    } else if (choice == 2) {
      monHocMoi = ThucHanh();
    } else {
      monHocMoi = DoAn();
    }
    monHocMoi.NhapDanhSachMonHoc();
    danhSachMonHoc.add(monHocMoi); // An toàn vì không nằm trong vòng lặp for-in
    print('Danh sach mon hoc sau khi them:');
    for (var monHoc in danhSachMonHoc) {
      monHoc.XuatDanhSachMonHoc();
    }
  }

  List<DTB> dsMonHocTuFile = await readFile('bin/monhoc.txt');
  print('Danh sach mon hoc doc tu file:');
  for (var monHoc in dsMonHocTuFile) {
    monHoc.XuatDanhSachMonHoc();
  }
  print('So tin chi trung binh cua cac mon hoc:');
  double tongTinChi = 0;
  for (var monHoc in danhSachMonHoc) {
    tongTinChi += monHoc.soTinChi;
  }
  double trungBinhTinChi = tongTinChi / danhSachMonHoc.length;
  print(trungBinhTinChi);
}
