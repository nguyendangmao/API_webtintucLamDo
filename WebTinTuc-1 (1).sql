CREATE DATABASE tintuc
GO
USE tintuc
GO 
create table PhanQuyen
(
	IDPhanQuyen int IDENTITY(1,1) NOT NULL,
	TenQuyen NVARCHAR(255) ,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_PQ PRIMARY KEY(IDPhanQuyen)
)
GO 
create table NhomTin
(
	IDNhomTin int IDENTITY(1,1) NOT NULL,
	TenNhomTin NVARCHAR(255) ,
	ThuTuHienThi int,	
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_TL  PRIMARY KEY(IDNhomTin)
)
GO 
create table NhaQuangCao
(
	IDNQC int IDENTITY(1,1) NOT NULL,
	TenNQC NVARCHAR(255) ,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_NQC  PRIMARY KEY(IDNQC)
)
GO 
create table TheLoai
(
	IDTheLoai int IDENTITY(1,1) NOT NULL,
	TenTheLoai NVARCHAR(255) ,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_NT PRIMARY KEY(IDTheLoai )
)
go
create table NguoiDung
(
	ID int IDENTITY(1,1) NOT NULL,
	IDPhanQuyen int  NOT NULL,
	TenTK NVARCHAR(255),
	MatKhau NVARCHAR(255) ,
	HoTen NVARCHAR(255) ,
	GioiTinh NVARCHAR(10) ,
	SDT NVARCHAR(15) ,
	DiaChi NVARCHAR(255),
	TrangThai int,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_ND PRIMARY KEY(ID),
	CONSTRAINT FK_PQND FOREIGN KEY(IDPhanQuyen) REFERENCES PhanQuyen(IDPhanQuyen)
)
go
create table QuangCao
(
	IDQuangCao int IDENTITY(1,1) NOT NULL,
	IDNQC int NOT NULL,
	NoiDungQC NVARCHAR(1000) ,
	TienQC NVARCHAR(15)  ,
	TGBatDau Date  ,
	TGKetThuc Date  ,
	HinhAnh NVARCHAR(255) ,
	ThêLoaiQC NVARCHAR(255),
	ViTri int ,
	ChieuDai int ,
	ChieuRong int ,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_QC PRIMARY KEY(IDQuangCao),
	CONSTRAINT FK_QCNQC FOREIGN KEY(IDNQC) REFERENCES NhaQuangCao(IDNQC)
)
go
create table BaiViet
(
	IDBaiViet int IDENTITY(1,1) NOT NULL,
	IDNhomTin int  NOT NULL,
	IDTheLoai int  NOT NULL,
	IDQuangCao int  NOT NULL,
	TenBaiViet NVARCHAR(255) ,
	NoiDungBaiViet NVARCHAR(1000) ,
	HinhAnh NVARCHAR(255) ,
	SoSaoTB float ,
	LuotXem int ,
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_BV PRIMARY KEY(IDBaiViêt),
	CONSTRAINT FK_NTBV FOREIGN KEY(IDNhomTin) REFERENCES NhomTin(IDNhomTin),
	CONSTRAINT FK_TLBV FOREIGN KEY(IDTheLoai) REFERENCES TheLoai(IDTheLoai),
	CONSTRAINT FK_QCBV FOREIGN KEY(IDQuangCao) REFERENCES QuangCao(IDQuangCao)
)
GO 
create table BinhLuan
(
	IDBinhLuan int IDENTITY(1,1) NOT NULL,
	IDBaiViet int  NOT NULL,
	ID int  NOT NULL,
	NoiDung NVARCHAR(255) ,	
	NgayTao Date default CURRENT_TIMESTAMP,
	NguoiTao NVARCHAR(255) default 'ADMIN',
	NgaySua Date default CURRENT_TIMESTAMP,
	NguoiSua NVARCHAR(255) default 'ADMIN' 
	CONSTRAINT PK_BL PRIMARY KEY(IDBinhLuan),
	CONSTRAINT FK_IDBL FOREIGN KEY(ID) REFERENCES NguoiDung(ID),
	CONSTRAINT FK_BVBL FOREIGN KEY(IDBaiViêt) REFERENCES BaiViet(IDBaiViêt)
)

ALTER TABLE [PhanQuyen] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[PhanQuyen] ( [TenQuyen],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Khách Hàng',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[PhanQuyen] ( [TenQuyen],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Admin',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

ALTER TABLE [NhomTin] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[NhomTin] ( [TenNhomTin],[ThuTuHienThi],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Tin Nổi Bật',1,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhomTin] ( [TenNhomTin],[ThuTuHienThi],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Tin Nóng',2,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhomTin] ( [TenNhomTin],[ThuTuHienThi],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Tin Mới',3,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhomTin] ( [TenNhomTin],[ThuTuHienThi],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Tin Trong Nước',4,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

ALTER TABLE [NhaQuangCao] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Tiền Phong',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Thanh Niên',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Long Thành',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Đông Triều',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Mạo Khê',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Uông Bí',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Quảng Yên',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Hạ Long',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Bãi Cháy',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Quang Hanh',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Cẩm Phả',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NhaQuangCao] ( [TenNQC],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Móng Cái',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

ALTER TABLE [TheLoai] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Giải Trí ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Văn Hóa ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Thể Thao',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Sức Khỏe ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Chính Trị ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Du lịch',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[TheLoai] ( [TenTheLoai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (N'Đời Sống ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')



ALTER TABLE [NguoiDung] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,N'phamtruong13032001@gmail.com',N'abc123',N'Phạm văn Trưởng',N'Nam',N'0123456789',N'Quảng Ninh',1,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,N'trantam130@gmail.com',N'xxxabc123',N'Trần Văn Tám',N'Nam',N'024124214124',N'Nam Định',2,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,N'tranhieu34351@gmail.com',N'21312dwew',N'Trần hiếu',N'Nam',N'03434343242',N'Hà Nội',1,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,N'trangnghia4112312@gmail.com',N'abcsoso123',N'Phạm Thị Trang',N'Nữ',N'0352355624',N'Hồ Chí Minh',2,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,N'Thaocute@gmail.com',N'XYZ8347',N'Nguyễn Thị Phương Thảo',N'Nữ',N'034324',N'Đà Nẵng',1,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[NguoiDung] ( [IDPhanQuyen],[TenTK],[MatKhau],[HoTen],[GioiTinh],[SDT],[DiaChi],[TrangThai],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,N'phamtruong13032001@gmail.com',N'abc123',N'Phạm văn Trưởng',N'Nam',N'0123456789',N'Quảng Ninh',2,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

ALTER TABLE [QuangCao] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[QuangCao] ( [IDNQC],[NoiDungQC],[TienQC],[TGBatDau],[TGKetThuc],[HinhAnh],[ThêLoaiQC],[ViTri],[ChieuDai],[ChieuRong],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (1,N'Nội Dung Quảng cáo 1',N'1000000',N'2020-10-02',N'2021-10-02',N'https://taimienphi.vn/tmp/cf/aut/Uhun-IbFB-MnGE-DiPL-OCTB-hinh-dep-1.jpg',N'Thiên Nhiên',1,300,500,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[QuangCao] ( [IDNQC],[NoiDungQC],[TienQC],[TGBatDau],[TGKetThuc],[HinhAnh],[ThêLoaiQC],[ViTri],[ChieuDai],[ChieuRong],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua])  
VALUES (2,N'Nội Dung Quảng cáo 2',N'2000000',N'2010-09-02',N'2011-09-02',N'https://i.9mobi.vn/cf/Images/np/2022/9/5/hinh-dep-2.jpg',N'Thành Phố',2,250,600,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[QuangCao] ( [IDNQC],[NoiDungQC],[TienQC],[TGBatDau],[TGKetThuc],[HinhAnh],[ThêLoaiQC],[ViTri],[ChieuDai],[ChieuRong],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (3,N'Nội Dung Quảng cáo 3',N'3000000',N'2021-02-02',N'2022-02-02',N'https://i.9mobi.vn/cf/Images/np/2022/9/5/hinh-dep-3.jpg',N'Biển Đảo',3,200,500,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

ALTER TABLE [BaiViet] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (1,1,1,N'Thanh tra Chính phủ chỉ ra hàng loạt sai phạm về đất đai tại Kon Tum',N'Giao đất không thông qua đấu giáTheo đó, trong quá trình quản lý, tỉnh Kon Tum đã giao đất cho hàng trăm trường hợp không thông qua đấu giá, vi phạm luật Đất đai. Trong đó có 319 trường hợp tại H.Ngọc Hồi, 85 trường hợp tại H.Đăk Hà... TP.Kon Tum có 43 trường hợp tại Khu đô thị phía Nam cầu Đăk Bla được giao đất nhưng không thuộc đối tượng tái định cư.',N'https://namphudesign.com/wp-content/uploads/2020/06/91789838_860905171092521_3849217040057368576_o-600x800.jpg',15,400,N'2020-10-02',N'Phạm Văn Trưởng',N'2021-10-02',N'Nguyễn Anh Tuấn')
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (2,1,2,N'CẬP NHẬT kết quả bầu cử Mỹ: Bám đuổi kịch tính, đảng Cộng hòa đang dẫn trước',N'Tại bang Nam Carolina, thượng nghị sĩ Tim Scott của đảng Cộng hòa tái đắc cử. Thượng nghị sĩ Rand Paul của đảng này cũng tái đắc cử tại bang Kentucky, theo CNN.Tại Alabama, bà Katie Britt của đảng Cộng hòa giành chiến thắng trước đối thủ Will Boyd của đảng Dân chủ. Đây là lần đầu tiên một phụ nữ đại diện bang này tại Thượng viện.Tại Oklahoma, cả hai ứng viên của đảng Cộng hòa gồm Markwayne Mullin và James Lankford đều đắc cử. Trong đó, ông Lankford đang là đương kim thượng nghị sĩ trong khi ông Mullin trở thành người Mỹ bản địa đầu tiên đại diện cho bang tại Thượng viện sau gần một thế kỷ, theo CNN.',N'https://noithat.hocviencaphe.vn/wp-content/uploads/2019/06/55.000-.-%E1%BA%A2nh-S%E1%BA%AFt-15-x-30-1-2-600x800.jpg',103,1010,N'2020-10-02',N'Phạm Văn Trưởng',N'2021-10-02',N'Nguyễn Anh Tuấn')
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (2,1,1,N'Người Việt ngẩn ngơ trước vẻ đẹp của nguyệt thực toàn phần',N'Nhật Bản là một trong những quốc gia có điều kiện thuận lợi nhất để quan sát hiện tượng nhật thực toàn phần diễn ra chiều tối qua (8.11). Người Việt Nam đang sống và làm việc tại đây đã không bỏ lỡ hiện tượng kỳ thú này, và ghi lại nhiều khoảnh khắc tuyệt đẹp.Anh Huy Huynh (26 tuổi) hiện đang là thực tập sinh tại Nhật Bản, đang sống và làm việc tại TP.Tamano, tỉnh Okayama. Vốn là người có niềm đam mê với thiên văn, anh Huy Huynh hiếm khi bỏ qua các hiện tượng kỳ thú nào diễn ra trên bầu trời. Dưới đây là bộ ảnh nguyệt thực toàn phần được anh ghi lại vào tối qua, khiến nhiều người vô cùng thích thú.',N'https://cdn.tgdd.vn/Files/2022/03/07/1418933/night64_1440x1920-800-resize.jpg',2783,922,N'2020-10-02',N'Phạm Văn Trưởng',N'2021-10-02',N'Nguyễn Anh Tuấn')
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (1,2,1,N'Đàm Vĩnh Hưng kể tuổi thơ khốn khó: Thèm thuồng nhìn người ta ăn ngon, mặc đẹp',N'Có con khá muộn nên Đàm Vĩnh Hưng luôn mong muốn dành những điều tốt nhất cho Polo. Nam ca sĩ từng săn lùng đồ hiệu khắp nơi trên thế giới cho con trai mỗi khi lưu diễn. Tuy nhiên, giọng ca Xin lỗi tình yêu nhận ra thói quen này quá phung phí vì quần áo mau chật do con lớn nhanh.Được bạn bè khuyên nhủ, Mr. Đàm đã thay đổi quan điểm để tập cho con lối sống giản dị. Anh bộc bạch: “Tôi thấy mình đang tập hư cho con, tương lai nó sẽ khổ chứ không ai khổ hết. Có rất nhiều nhãn hiệu rẻ nhưng rất dễ thương. Hơn nữa, con tôi đẹp nên mặc gì cũng đẹp. Thế là tôi quyết định cho con sống giản dị”.',N'https://media.tinmoi.vn/upload/kimngan/2020/05/08/032821-dam-vinh-hung_4.jpg',857385,3883,N'2020-10-02',N'Bùi Minh Hiếu',N'2021-10-02',N'Nguyễn Văn Hoàng')
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (2,5,1,N'Loạt bài ‘Vì sao giáo viên nghỉ việc’ của Báo Thanh Niên đạt giải thưởng',N'Sáng 9.11, lễ trao giải Báo chí toàn quốc Vì sự nghiệp giáo dục Việt Nam 2022 đã diễn ra tại Hà Nội.Năm 2022 là năm thứ 5 Bộ GD-ĐT chủ trì, phối hợp với Ban Tuyên giáo Trung ương, Bộ Thông tin và Truyền thông, Hội Nhà báo Việt Nam tổ chức Giải báo chí toàn quốc Vì sự nghiệp Giáo dục Việt Nam. Báo Giáo dục và Thời đại là đơn vị thường trực, tổ chức thực hiện.Giải nhằm tôn vinh các tác giả có tác phẩm xuất sắc về sự nghiệp giáo dục-đào tạo của nước nhà và tôn vinh các tập thể, cá nhân tiêu biểu có nhiều cống hiến cho sự nghiệp trồng người. Qua đó, tuyên truyền, tôn vinh những đóng góp của ngành giáo dục với sự nghiệp xây dựng, bảo vệ Tổ quốc.',N'https://quantri.pgdthanhxuan.edu.vn//UploadImages/ththanhxuanbac/admin/Nam%20hoc%202019%20-%202020/Guong%20mat%20vang/Duong_Hien_1.jpg?w=800',74226,742,N'2020-10-02',N'Trần Hữu Tiến',N'2021-10-02',N'Phạm Văn Trưởng')
INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (3,4,1,N'Phú Quốc cưỡng chế, phá dỡ 2 căn biệt thự xây dựng trái phép',N'Cả 2 căn biệt thự đều đóng cổng khá chắc chắn bằng ổ khóa loại lớn. Lực lượng cưỡng chế phải dùng búa để đập ổ khóa cổng. Đồng thời, đưa 2 phụ nữ nói trên ra khỏi khu vực 2 căn biệt thự.Ngay sau khi ổ khóa cổng được phá, lực lượng cưỡng chế vào bên trong để kiểm kê và đưa các tài sản ra ngoài. Sau đó, 2 xe cuốc được điều động đến để phá dỡ 2 căn biệt thự trong khoảng hơn 2 tiếng đồng hồ.Ông Huỳnh Quang Hưng, Chủ tịch UBND TP.Phú Quốc, cho biết đây chỉ là 2/79 căn biệt thự xây dựng trên đất nhà nước quản lý.“Thời gian tới, chúng tôi sẽ tiếp tục củng cố hồ sơ, hoàn thiện các thủ tục theo quy định để cưỡng chế 77 căn còn lại”, ông Hưng nói.Ông Hưng cũng chia sẻ thêm, rất xót xa khi phải ra quyết định cưỡng chế phá dỡ nhà cửa của người dân. Tuy nhiên, vì mục tiêu quyết tâm lập lại kỷ cương phép nước, chính quyền TP.Phú Quốc không thể không thực hiện việc này.',N'http://xaysuanhadan.com/wp-content/uploads/2018/07/hoan-thien-biet-thu-tron-goi-1.jpg',3677,83,N'2020-10-02',N'Phạm văn Trưởng',N'2021-10-02',N'Nguyễn Anh Tuấn')


INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (2,1,2,N'Chọn đầu tư bất động sản nào trong bối cảnh thị trường nhiều biến động?',N'“Lịch sử luôn biết cách lặp lại chính mình”. Những nhà đầu tư của năm 2022 đến thời điểm này dường như đã thấm thía câu nói đó. 15 năm trước (2007), kinh tế Việt Nam thăng hoa với GDP tăng 8,4%, thu hút FDI đạt kỷ lục gần 18 tỷ USD và VN-Index bay cao trên ngưỡng 1.000 điểm. Nhưng chỉ sau đúng một năm, chỉ số này đã rơi một mạch từ ngưỡng 1.000 điểm xuống chỉ còn 288 điểm, xóa sạch thành quả tích lũy của bao người.Năm 2021, lịch sử của năm 2007 lặp lại. Sau những cơn hưng phấn tột độ, VN-Index đã xác lập cột mốc lịch sử, hơn 1.500 điểm. Nhưng cũng chỉ trong chưa đầy một năm sau, thị trường lại trở về 15 năm trước khi có lúc giảm xuống dưới 1.000 điểm.Tiền đã chảy đi nơi khác. Nhiều nhà quan sát cho rằng với đà tăng lãi suất của hệ thống ngân hàng, tiền đã đi vào kênh tiết kiệm. Tuy nhiên, với sự trượt giá của Việt Nam đồng, hiện đã vào khoảng 5%, biên độ tăng của lãi suất là không đủ để hấp dẫn người dân gửi tiền vào két ngân hàng. Nhìn rộng ra hơn, vàng vẫn đang nhảy múa hết sức khó lường, ngoại tệ đầy rẫy rủi ro, có thể thấy giới đầu tư đang cân nhắc việc “chọn mặt gửi tiền”.',N'https://319.com.vn/thu-vien-anh/image.raw?view=image&type=img&id=576',873284,103,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

INSERT [dbo].[BaiViet] ( [IDNhomTin],[IDTheLoai],[IDQuangCao],[TenBaiViet],[NoiDungBaiViet],[HinhAnh],[SoSaoTB],[LuotXem],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) 
VALUES (1,2,3,N'Doanh nghiệp đề xuất thêm khu đô thị sân bay ở Vân Phong',N'Tỉnh Khánh Hòa đang điều chỉnh, hoàn thiện bộ Đồ án điều chỉnh Quy hoạch chung xây dựng Khu kinh tế Vân Phong, trong đó có việc đề xuất thêm khu đô thị sân bay ở Vân Phong.Ngày 1.10, thông tin từ UBND tỉnh Khánh Hòa cho biết, UBND tỉnh vừa có báo cáo về việc điều chỉnh Đồ án điều chỉnh Quy hoạch chung xây dựng Khu Kinh tế Vân Phong đến năm 2040, tầm nhìn đến năm 2050.Theo đó, trong quá trình hoàn thiện đồ án điều chỉnh quy hoạch để trình thẩm định và phê duyệt, đơn vị tư vấn lập điều chỉnh quy hoạch đã phối hợp với tư vấn của Tập đoàn Sun Group nghiên cứu, đề xuất điều chỉnh lại tính chất và cơ cấu sử dụng đất tại 6 phân khu chức năng ở bán đảo Hòn Gốm và khu vực Cổ Mã - Tu Bông nhằm khai thác có hiệu quả tiềm năng và điều kiện tự nhiên của khu vực này.',N'https://phanthietvn.com/wp-content/uploads/2015/04/vinh-da-nhay-ke-ga-7-600x800.jpg',5,10,N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')


ALTER TABLE [BinhLuan] NOCHECK CONSTRAINT ALL
GO
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,1,N'Tin vịt',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,1,N'Bài Viết Khá Là Hay',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,2,N'Rất Tốt Cần Phát Huy',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,2,N'Được Của Nó',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,3,N'Hay Phết Nhỉ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,4,N'Không Tin Cho Lắm',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (3,2,N'Tin vịt',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (4,2,N'Bài Viết Khá Là Hay',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (2,2,N'Rất Tốt Cần Phát Huy',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,1,N'Được Của Nó',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (4,3,N'Hay Phết Nhỉ',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')
INSERT [dbo].[BinhLuan] ( [IDBaiViêt],[ID],[NoiDung],[NgayTao],[NguoiTao],[NgaySua],[NguoiSua]) VALUES (1,3,N'Không Tin Cho Lắm',N'2020-10-02',N'PhamVanTruong',N'2021-10-02',N'NguyenAnhTuan')

