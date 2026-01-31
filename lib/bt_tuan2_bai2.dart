// Hãy thiết kế các class để xây dựng chương trình tính điểm trung bình (DTB)
// và quy đổi điểm hệ 4 (điểm chữ). Biết rằng mỗi môn học đều có các thông tin sau: mã
// môn học, tên môn học và số tín chỉ. Các môn học được chia làm 3 loại:

// − Lý thuyết: có 2 cột điểm là điểm tiểu luận và điểm cuối kỳ.
// DTB = Điểm tiểu luận*0.3 + Điểm cuối kỳ*0.7
// − Thực hành: có 3 cột điểm kiểm tra. DTB tính bằng trung bình cộng các bài
// kiểm tra.
// − Đồ án: có điểm của giáo viên hướng dẫn (GVHD) và giáo viên phản biện
// (GVPB). DTB = (điểm GVHD + điểm GVPB)/ 2
// Viết chương trình:
// ▪ Nhập vào một danh sách các môn học từ bàn phím
// ▪ Xuất danh sách các môn học vừa nhập ra màn hình.
// ▪ Hãy cho biết danh sách môn học có được sắp xếp tăng dần theo tên môn học hay
// không?
// ▪ Sắp xếp danh sách môn học tăng dần theo số tín chỉ.
// ▪ Cho biết các môn học có số tín chỉ cao nhất.
// ▪ Nhập vào tên môn học bất kỳ, cho biết môn học đó có trong danh sách hay không?
// Nếu không có, hãy thêm giá trị đó vào cuối danh sách. Nếu có hãy cho biết các
// thông tin về môn học đó.
// ▪ Tạo file monhoc.txt chứa thông tin ít nhất là 5 môn học và đọc nội dung file vào
// danh sách môn học.
// ▪ Tính số tín chỉ trung bình của các môn học có trong danh sách.
import 'dart:io';
import 'dart:async';

abstract class DTB {
  late String maMonHoc;
  late String tenMonHoc;
  late int soTinChi;
  double TinhDiemTrungBinh();
  void NhapDanhSachMonHoc() {
    stdout.write('Nhập mã môn học: ');
    maMonHoc = stdin.readLineSync()!;
    stdout.write('Nhập tên môn học: ');
    tenMonHoc = stdin.readLineSync()!;
    stdout.write('Nhập số tín chỉ: ');
    soTinChi = int.parse(stdin.readLineSync()!);
  }

  void XuatDanhSachMonHoc() {
    print(
      'Mã môn học: $maMonHoc, Tên môn học: $tenMonHoc, Số tín chỉ: $soTinChi, Điểm trung bình: ${TinhDiemTrungBinh()}',
    );
  }
}

class LyThuyet extends DTB {
  late double diemTieuLuan;
  late double diemCuoiKy;
  @override
  double TinhDiemTrungBinh() {
    return diemTieuLuan * 0.3 + diemCuoiKy * 0.7;
  }

  void NhapDanhSachMonHoc() {
    super.NhapDanhSachMonHoc();
    stdout.write('Nhập điểm tiểu luận: ');
    diemTieuLuan = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập điểm cuối kỳ: ');
    diemCuoiKy = double.parse(stdin.readLineSync()!);
  }

  void XuatDanhSachMonHoc() {
    super.XuatDanhSachMonHoc();
  }
}

class ThucHanh extends DTB {
  late double diemKiemTra1;
  late double diemKiemTra2;
  late double diemKiemTra3;
  @override
  double TinhDiemTrungBinh() {
    return (diemKiemTra1 + diemKiemTra2 + diemKiemTra3) / 3;
  }

  void NhapDanhSachMonHoc() {
    super.NhapDanhSachMonHoc();
    stdout.write('Nhập điểm kiểm tra 1: ');
    diemKiemTra1 = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập điểm kiểm tra 2: ');
    diemKiemTra2 = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập điểm kiểm tra 3: ');
    diemKiemTra3 = double.parse(stdin.readLineSync()!);
  }

  void XuatDanhSachMonHoc() {
    super.XuatDanhSachMonHoc();
  }
}

class DoAn extends DTB {
  late double diemGVHD;
  late double diemGVPB;
  @override
  double TinhDiemTrungBinh() {
    return (diemGVHD + diemGVPB) / 2;
  }

  void NhapDanhSachMonHoc() {
    super.NhapDanhSachMonHoc();
    stdout.write('Nhập điểm GVHD: ');
    diemGVHD = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập điểm GVPB: ');
    diemGVPB = double.parse(stdin.readLineSync()!);
  }

  void XuatDanhSachMonHoc() {
    super.XuatDanhSachMonHoc();
  }
}

Future<List<DTB>> readFile(String filePath) async {
  List<DTB> danhSachMonHoc = [];
  final file = File(filePath);
  final lines = await file.readAsLines();
  for (var line in lines) {
    var parts = line.split('#');
    DTB monHoc;
    if (parts[0] == 'LyThuyet') {
      var monHoc_LT = LyThuyet();
      monHoc_LT.maMonHoc = parts[1];
      monHoc_LT.tenMonHoc = parts[2];
      monHoc_LT.soTinChi = int.parse(parts[3]);
      monHoc_LT.diemTieuLuan = double.parse(parts[4]);
      monHoc_LT.diemCuoiKy = double.parse(parts[5]);
      danhSachMonHoc.add(monHoc_LT);
    } else if (parts[0] == 'ThucHanh') {
      var monhoc_TH = ThucHanh();
      monhoc_TH.maMonHoc = parts[1];
      monhoc_TH.tenMonHoc = parts[2];
      monhoc_TH.soTinChi = int.parse(parts[3]);
      monhoc_TH.diemKiemTra1 = double.parse(parts[4]);
      monhoc_TH.diemKiemTra2 = double.parse(parts[5]);
      monhoc_TH.diemKiemTra3 = double.parse(parts[6]);
      danhSachMonHoc.add(monhoc_TH);
    } else {
      var monHoc_DA = DoAn();
      monHoc_DA.maMonHoc = parts[1];
      monHoc_DA.tenMonHoc = parts[2];
      monHoc_DA.soTinChi = int.parse(parts[3]);
      monHoc_DA.diemGVHD = double.parse(parts[4]);
      monHoc_DA.diemGVPB = double.parse(parts[5]);
      danhSachMonHoc.add(monHoc_DA);
    }
  }
  return danhSachMonHoc;
}
