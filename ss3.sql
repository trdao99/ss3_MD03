#-----------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
#BAI_2:
drop database QuanLyDiem;
Create Database QuanLyDiem;
use QuanLyDiem;


/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
    MaKhoa  char(2) primary key,
    TenKhoa nvarchar(30) not null
);

/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
    MaSV     char(3)      not null primary key,
    HoSV     nvarchar(15) not null,
    TenSV    nvarchar(7)  not null,
    Phai     nchar(7),
    NgaySinh datetime     not null,
    NoiSinh  nvarchar(20),
    MaKhoa   char(2),
    HocBong  float
);


/*=================MON HOC====================*/
create table DMMH
(
    MaMH   char(2)      not null,
    TenMH  nvarchar(25) not null,
    SoTiet tinyint,
    Constraint DMMH_MaMH_pk primary key (MaMH)
);


/*===================KET QUA=================*/
Create table KetQua
(
    MaSV   char(3) not null,
    MaMH   char(2) not null,
    LanThi tinyint,
    Diem   decimal(4, 2),
    Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV, MaMH, LanThi)
);


/*==============TAO KHOA NGOAI================*/
Alter table dmsv
    add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
        References DMKhoa (MaKhoa);
Alter table KetQua
    add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
    add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);


/*===========NHAP DU LIEU BANG DMMH===========*/
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('01', 'Cơ Sở Dữ Liệu', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('02', 'Trí Tuệ Nhân Tạo', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('03', 'Truyền Tin', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('04', 'Đồ Họa', 60);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('05', 'Văn Phạm', 60);


/*==========NHAP DU LIEU BANG DMKHOA=========*/
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('AV', 'Anh Văn');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TH', 'Tin Học');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TR', 'Triết');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('VL', 'Vật Lý');


/*===========NHAP DU LIEU BANG DMSV===========*/
Insert into DMSV
values ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 80000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);


/*===========NHAP DU LIEU BANG KET QUA===========*/
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 1, 3);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '02', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '03', 1, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 1, 4.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 2, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '03', 1, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '05', 1, 9);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 1, 2);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 2, 4);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A04', '05', 2, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '01', 1, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '02', 1, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '04', 1, 10);

#Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ
select *
from DMSV
order by (case when Phai = 'Nam' then 1 else 0 end) desc;
#Thông tin các sinh viên gồm : Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select DMSV.TenSV, DMSV.NgaySinh, DMSV.HocBong
from DMSV
order by NgaySinh, HocBong desc;
#Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select TenSV, NgaySinh, Phai
from dmsv
where TenSV like '%I';
#Liệt kê những sinh viên mà họ có chứa chữ Thị
select *
from DMSV
where HoSV like '%THI%';
#Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng.
select concat(HoSV, ' ', TenSV), (timestampdiff(year, NgaySinh, curdate())) tuoi, HocBong
from DMSV
where timestampdiff(year, NgaySinh, curdate()) > 20;
#Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(*) AS 'tong sinh vien', count(CASE WHEN Phai = 'Nữ' THEN 1 END) AS 'tong sv nu'
FROM DMSV;
#Cho biết tổng số sinh viên của từng khoa.
select DMKhoa.MaKhoa, TenKhoa, count(D.MaKhoa) 'so sv'
from dmkhoa
         join DMSV D on dmkhoa.MaKhoa = D.MaKhoa
group by MaKhoa;
#Cho biết số lượng sinh viên theo từng độ tuổi.
select count(*), (timestampdiff(year, NgaySinh, curdate())) tuoi
from DMSV
group by (timestampdiff(year, NgaySinh, curdate()));
#Cho biết học bổng cao nhất của mỗi khoa.
select DMKhoa.MaKhoa, DMKhoa.TenKhoa, max(HocBong)
from dmkhoa
         join DMSV D on dmkhoa.MaKhoa = D.MaKhoa
group by DMKhoa.MaKhoa;
drop database QuanLySinhVien2;

-- Bước 1: Tạo CSDL QuanLySinhVien
CREATE DATABASE QuanLySinhVien2;
-- Bước 2: Chọn Database QuanLySinhVien để thao tác với cơ sở dữ liệu này:
USE QuanLySinhVien2;
-- Bước 3: Tiếp theo sử dụng câu lệnh Create Table để tạo bảng Class với các trường ClassId, ClassName, StartDate, Status như sau:
CREATE TABLE Class
(
    ClassID   INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
-- Bước 4: Tạo bảng Student với các thuộc tính StudentId, StudentName, Address, Phone, Status, ClassId với rằng buộc như sau:
CREATE TABLE Student
(
    StudentId   INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
-- Bước 5: Tạo bảng Subject với các thuộc tính SubId, SubName, Credit, Status với các ràng buộc như sau :
CREATE TABLE Subject
(
    SubId   INT AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
-- Bước 6: Tạo bảng Mark với các thuộc tính MarkId, SubId, StudentId, Mark, ExamTimes với các ràng buộc như sau :
CREATE TABLE Mark
(
    MarkId    INT AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
-- Thêm dữ liệu vào bảng Class
INSERT INTO Class (ClassName, StartDate, Status)
VALUES ('Lớp A1', '2022-01-01', 1),
       ('Lớp B2', '2022-02-01', 1),
       ('Lớp C1', '2022-03-01', 0);


-- Thêm dữ liệu vào bảng Student
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Nguyễn Văn A', 'Địa chỉ A', '1234567890', 1, 1),
       ('Trần Thị B', 'Địa chỉ B', '0987654321', 1, 2),
       ('Lê Văn C', 'Địa chỉ C', '9876543210', 0, 3);

-- Thêm dữ liệu vào bảng Subject
INSERT INTO Subject (SubName, Credit, Status)
VALUES ('Toán', 3, 1),
       ('Văn', 2, 1),
       ('Anh', 4, 0);

-- Thêm dữ liệu vào bảng Mark
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8.5, 1),
       (2, 1, 7.2, 1),
       (3, 1, 6.8, 1),
       (1, 2, 9.0, 1),
       (2, 2, 7.5, 1),
       (3, 2, 8.2, 1),
       (1, 3, 6.5, 1),
       (2, 3, 8.0, 1),
       (3, 3, 7.7, 1);
#-----------------
select StudentName, ClassName
from quanlysinhvien.student
         join Class C on student.ClassId = C.ClassID
where C.ClassName like '%A1';
#-----------------
select Student.*, M.Mark diem
from student
         join Mark M on student.StudentId = M.StudentId
         join subject s on M.SubId = s.SubId
where SubName = 'Toán';
#-----------------
select StudentName, avg(Mark) diemTB
from Mark
         join student on Mark.StudentId = Student.StudentId
group by StudentName
having diemTB >= 5;
#------------------
SELECT SubName,  AVG(M.Mark)
FROM subject
         JOIN Mark M ON subject.SubId = M.SubId
group by SubName
HAVING AVG(M.Mark) >= 5;
#------------------
select StudentId, StudentName from student where StudentId not in ((select Student.StudentId from student join Mark M on student.StudentId = M.StudentId
));
#BAI_1:
drop database QuanLySinhVien;

-- Bước 1: Tạo CSDL QuanLySinhVien
CREATE DATABASE QuanLySinhVien;
-- Bước 2: Chọn Database QuanLySinhVien để thao tác với cơ sở dữ liệu này:
USE QuanLySinhVien;
-- Bước 3: Tiếp theo sử dụng câu lệnh Create Table để tạo bảng Class với các trường ClassId, ClassName, StartDate, Status như sau:
CREATE TABLE Class
(
    ClassID   INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
-- Bước 4: Tạo bảng Student với các thuộc tính StudentId, StudentName, Address, Phone, Status, ClassId với rằng buộc như sau:
CREATE TABLE Student
(
    StudentId   INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
-- Bước 5: Tạo bảng Subject với các thuộc tính SubId, SubName, Credit, Status với các ràng buộc như sau :
CREATE TABLE Subject
(
    SubId   INT AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
-- Bước 6: Tạo bảng Mark với các thuộc tính MarkId, SubId, StudentId, Mark, ExamTimes với các ràng buộc như sau :
CREATE TABLE Mark
(
    MarkId    INT AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
-- Thêm dữ liệu vào bảng Class
INSERT INTO Class (ClassName, StartDate, Status)
VALUES ('Lớp A', '2022-01-01', 1),
       ('Lớp B', '2022-02-01', 1),
       ('Lớp C', '2022-03-01', 0);

-- Thêm dữ liệu vào bảng Student
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Nguyễn Văn A', 'Địa chỉ A', '1234567890', 1, 1),
       ('Trần Thị B', 'Địa chỉ B', '0987654321', 1, 2),
       ('Lê Văn C', 'Địa chỉ C', '9876543210', 0, 3);

-- Thêm dữ liệu vào bảng Subject
INSERT INTO Subject (SubName, Credit, Status)
VALUES ('Toán', 3, 1),
       ('Văn', 2, 1),
       ('Anh', 4, 0);

-- Thêm dữ liệu vào bảng Mark
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8.5, 1),
       (2, 1, 7.2, 1),
       (3, 1, 6.8, 1),
       (1, 2, 9.0, 1),
       (2, 2, 7.5, 1),
       (3, 2, 8.2, 1),
       (1, 3, 6.5, 1),
       (2, 3, 8.0, 1),
       (3, 3, 7.7, 1);
#Hiển thị số lượng sinh viên theo từng địa chỉ nơi ở.
select Address, count(StudentName) soSV
from student
group by Address;
#Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from mark
where Mark = (select max(Mark) from Mark);
#Tính điểm trung bình các môn học của từng học sinh.

select StudentName, avg(Mark) diemTB
from Mark
         join student on Mark.StudentId = Student.StudentId
group by StudentName
#Hiển thị những bạn học viên có điểm trung bình các môn học nhỏ hơn bằng 70.
having diemTB >= 7;
#Hiển thị thông tin học viên có điểm trung bình các môn lớn nhất.
select StudentName, avg(Mark) diemTB
from Mark
         join student on Mark.StudentId = Student.StudentId
group by StudentName
having diemTB = (select max(diemTB)
                 from (select StudentName, avg(Mark) diemTB
                       from Mark
                                join student on Mark.StudentId = Student.StudentId
                       group by StudentName) as `table`);
#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select Student.*, avg(Mark) diemTB
from student
         join Mark M on student.StudentId = M.StudentId
         group by Student.StudentId
order by diemTB desc ;
