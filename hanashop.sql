create database mipham_hanashop
use mipham_hanashop
create table nhan_vien(
tai_khoan varchar(10) not null primary key,
mat_khau varchar(50),
quyen int,
ten_nv nvarchar(50),
gioi_tinh nvarchar(5),
ngay_sinh datetime,
dia_chi nvarchar(50),
sdt varchar(12)
)
insert into nhan_vien 
values('NV01','NV01',1,N'Lèng Xuân Sa',N'Nữ','2000-08-25',N'Hà Nội','0635224385'),
      ('NV02','NV02',2,N'Vũ Thị Thuỷ',N'Nữ','1999-2-10',N'Hà Nam','0835829926'),
   ('NV03','NV03',2,N'Nguyễn Thị Yến',N'Nữ','1994-3-8',N'Bắc Giang','039852617'),
   ('NV04','NV04',2,N'Nguyễn Việt Dũng',N'Nam','2001-11-8',N'Hải Dương','033641417'),
   ('NV05','NV05',2,N'Nguyễn Anh Tuấn',N'Nam','1995-9-1',N'Nghệ An','062345685'),
   ('NV06','NV06',2,N'Lý Thị Khơi',N'Nữ','1994-6-23',N'Vĩnh Phúc','032569845'),
   ('NV07','NV07',2,N'Phạm Văn Bình',N'Nam','2000-4-25',N'Sơn La','0621351265'),
   ('NV08','NV08',2,N'Nguyễn Thị Linh An',N'Nữ','1998-9-18',N'Bắc Giang','036285317')

select * from nhan_vien
create table nha_cung_cap(
ma_ncc int identity(1,1) primary key ,
ten_ncc nvarchar(50),
dia_chi nvarchar(500),
sdt varchar(12)
)

insert into nha_cung_cap(ten_ncc,dia_chi,sdt) 
values (N'Công ty sản xuất mỹ phẩm iFree',N'102 Đường số 3, Bình Hưng Hòa, Bình Tân, Thành phố Hồ Chí Minh','0942002020'),
       (N'Công ty TNHH sản xuất hoá mỹ phẩm Hani',N'Nguyễn Bá Tòng, Phường 11, Quận Tân Bình,Thành phố Hồ chí Minh','0964777017'),
    (N'Công ty sản xuất hoá mỹ phẩm Việt Hương',N'Cụm CN Triều Khúc, Tân Triều, Thanh Trì, Hà Nội.','0364588098'),
    (N'Công ty cổ phần sản xuất hoá mỹ phẩm Tân Ngọc Phát',N' quận Tân Phú, Tp. Hồ Chí Minh','02871067555'),
    (N'Công ty TNHH sản xuất hóa mỹ phẩm ViCO',N'Số 94 Đường 208,Tp Hải Phòng','0253835869'),
    (N'Công ty TNHH Quốc Tế Unilever Việt Nam',N'Tầng 9,4 Bạch Đằng,Tp Đà Nẵng','0233565600')
select * from nha_cung_cap
create table loai_hang(
ma_lh int identity(1,1) primary key,
ten_lh nvarchar(50)
)
insert into loai_hang (ten_lh) 
values(N'Nước hoa'),
      (N'Son'),
   (N'Phẩn má'),
   (N'Mascara'),
   (N'Kem nền'),
   (N'Nước hoa hồng'),
   (N'Phấn mắt'),
   (N'Sữa rửa mặt'),
   (N'Nước tẩy trang'),
   (N'Serum'),
   (N'Kem dưỡng')
select * from loai_hang
select * from nha_cung_cap
Create table khach_hang(
 ma_kh int NOT NULL identity(1,1) primary key,
 ten_kh nvarchar(50) not null,
    dia_chi nvarchar(50) not null,
 sdt nvarchar(50) not null,
 diem float NULL
)
insert into khach_hang (ten_kh,dia_chi,sdt,diem)
values  (N'Lèng Xuân Sa',N'Lào Cai','0379738717',0),
        (N'Hoàng Nhật Linh',N'Hà Nội','0635224385',0),
     (N'Trần Trung Nghĩa',N'Hà Nam','0835829926',0),
     (N'Nguyễn Đức Thịnh',N'Phú Thọ','035466944',0),
     (N'Nguyễn Thị Thu Lan',N'Bắc Giang','039852617',0),
     (N'Nguyễn Văn An',N'Hải Dương','033641417',0)
select * from khach_hang
Create table san_pham (
ma_sp int not null identity(1,1) primary key,
 ten_sp nvarchar(50) not null,
 so_luong int null,
 gia_nhap float null,
 ma_lh int not null,
 foreign key(ma_lh) references loai_hang(ma_lh)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 ma_ncc int not null
 foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
)

insert into san_pham(ten_sp,so_luong,gia_nhap,ma_lh,ma_ncc)
values(N'Nước hoa',100,150000,1,2),
      (N'Son',200,120000,2,6),
   (N'Sữa rửa mặt',500,100000,8,1),
   (N'Kem dưỡng',300,160000,11,5),
   (N'Kem nền',100,180000,5,5),
   (N'Phấn má',50,100000,3,3),
   (N'Mascara',250,150000,4,4),
   (N'Nước hoa hồng',100,220000,6,2),
   (N'Phấn mắt',110,120000,7,5),
   (N'Nước tẩy trang',100,120000,9,6),
   (N'Serum',300,200000,10,1)
select * from san_pham
create table hoa_don(
 so_hd int NOT NULL primary key identity (1,1),
 ma_kh int NULL foreign key references khach_hang(ma_kh),
 ngay_lap datetime ,
 hang_hoa nvarchar (max),
 tong_sp float ,
 khuyen_mai varchar (50) ,
 tong_tien float ,
 tai_khoan varchar (10) 
 foreign key(tai_khoan) references nhan_vien(tai_khoan)
 ON UPDATE CASCADE
 ON DELETE CASCADE
)
insert into hoa_don(ma_kh,ngay_lap,hang_hoa,tong_sp,khuyen_mai,tong_tien,tai_khoan)
values(1,'2021-4-24','',0,'1%',0,'NV01'),
      (2,'2021-12-24','',0,'3%',0,'NV02'),
   (3,'2021-12-25','',0,'4%',0,'NV03'),
   (4,'2021-12-25','',0,'1%',0,'NV04'),
   (5,'2021-12-26','',0,'1%',0,'NV05'),
   (6,'2021-12-27','',0,'2%',0,'NV06')
   
select * from hoa_don

CREATE TABLE chi_tiet_hd(
 stt int NOT NULL ,
 so_hd int 
 primary key(stt,so_hd),
 foreign key (so_hd) references hoa_don(so_hd)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 ma_sp int 
 foreign key (ma_sp) references san_pham(ma_sp)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 don_gia float,
 so_luong int NULL,
 tong_tien float  NULL
)


CREATE TABLE chi_tiet_sp(
 stt int NOT NULL,
 ma_sp int 
 primary key(stt,ma_sp),
 foreign key (ma_sp) references san_pham(ma_sp)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 ngay_nhap datetime ,
 han_sd datetime ,
 so_luong int ,
 gia_ban float 
)