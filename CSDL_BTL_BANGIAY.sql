CREATE DATABASE CSDL_BanGiay
GO
use CSDL_BanGiay
GO

-- tạo bảng hóa đơn bán
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[MaKH] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- tạo bảng hóa đơn nhập
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonNhap](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- tạo bảng khách hàng
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[GioiTinh] [bit] NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- tạo bảng nhà cung cấp
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- tạo bảng nhân viên
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TABLE [dbo].[tNhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[Luong] [nvarchar](20) Null,
	[Password] [nvarchar](20) not null,
	[IsManager] [bit] not null,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- tạo bảng thương hiệu
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tThuongHieu](
	[MaThuongHieu] [nvarchar](10) NOT NULL,
	[TenThuongHieu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- tạo bảng chất liệu
create table tChatLieu(
	MaChatLieu nvarchar(10) primary key not null,
	TenChatLieu nvarchar(10) null
)

-- tạo bảng giầy
CREATE TABLE [dbo].[tGiay](
	[MaGiay] [nvarchar](10) primary key NOT NULL,
	[TenGiay] [nvarchar](200) NULL,

	[MaTheLoai] [nvarchar](10) NULL,
	[MaThuongHieu] [nvarchar](10) NULL,
	[DonGiaNhap] [money] NULL,
	[DonGiaBan] [money] NULL,
	[SoLuong] [int] NULL,
	[KichThuoc] [int] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[MauSac] [nvarchar](10) NULL,
	[TrongLuong] [nvarchar](50) NULL,
	[Anh] [varchar](1000) NULL,
	MaChatLieu nvarchar(10) references tChatLieu(MaChatLieu) null 
)
Go
-- tạo bảng thể loại 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTheLoai](
	[MaTheLoai] [nvarchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- tạo bảng chi tiết hóa đơn bán
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaGiay] [nvarchar](10) NOT NULL,
	[SLBan] [int] NULL,
	[KhuyenMai] [float] NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- tạo bảng chi tiết hóa đơn nhập
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDN](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaGiay] [nvarchar](10) NOT NULL,
	[SLNhap] [int] NULL,
	[KhuyenMai] [float] NULL,
 CONSTRAINT [PK_tChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- thêm các ràng buộc khóa chính,khóa phụ
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([SoHDB])
REFERENCES [dbo].[tHoaDonBan] ([SoHDB])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tGiay] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[tGiay] ([MaGiay])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tGiay]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap] FOREIGN KEY([SoHDN])
REFERENCES [dbo].[tHoaDonNhap] ([SoHDN])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tGiay] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[tGiay] ([MaGiay])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tGiay]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tNhanVien]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhanVien]
GO
ALTER TABLE [dbo].[tGiay]  WITH CHECK ADD  CONSTRAINT [FK_tGiay_tThuongHieu] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[tThuongHieu] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[tGiay] CHECK CONSTRAINT [FK_tGiay_tThuongHieu]
GO
ALTER TABLE [dbo].[tGiay]  WITH CHECK ADD  CONSTRAINT [FK_tGiay_tTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tTheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[tGiay] CHECK CONSTRAINT [FK_tGiay_tTheLoai]
GO
-- procedure login
create proc SP_Login
@Username nvarchar(20),
@Password nvarchar(20)
as
begin
	if exists (select * from tNhanVien where MaNV = @Username and Password = @Password and IsManager = 1)
		select 1 as code
	else if exists (select * from tNhanVien where MaNV = @Username and Password = @Password and IsManager = 0)
		select 0 as code
	else if exists(select * from tNhanVien where MaNV = @Username and Password != @Password) 
		select 2 as code
	else select 3 as code
end
Go
-- insert nhân viên
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV01', N'Trần Huy', N'Nam', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'3600000',N'NV01',1)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV02', N'Nguyễn Minh', N'Nam', CAST(N'1989-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689', N'6300000',N'NV02',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV03', N'Phan Cao', N'Nam', CAST(N'1991-08-12T00:00:00.000' AS DateTime), N'Ninh Bình', N'0985143235', N'6500000',N'NV03',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV04', N'Trần Thảo', N'Nữ', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'2600000',N'NV04',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV05', N'Thanh Tâm', N'Nữ', CAST(N'1986-01-12T00:00:00.000' AS DateTime), N'Bắc Ninh', N'0979657676', N'6600000',N'NV05',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV06', N'Bùi Ngọc', N'Nữ', CAST(N'1987-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'0918167892', N'5000000',N'NV06',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV07',N'Đỗ Huy Long', N'Nam', CAST(N'1995-08-08T00:00:00.000' AS DateTime), N'Nam Định', N'0983646585', N'3500000',N'NV07',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV08', N'Đỗ Thảo', N'Nữ', CAST(N'1990-06-06T00:00:00.000' AS DateTime), N'Hà Nội', N'0962099666', N'12000000',N'NV08',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV09', N'Trần Huy', N'Nam', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'10000000',N'NV09',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV10', N'Nguyễn Thanh thư', N'Nữ', CAST(N'1989-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689', N'4000000',N'NV10',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV11', N'Phan Trung', N'Nam', CAST(N'2002-08-12T00:00:00.000' AS DateTime), N'Ninh Bình', N'0985143235', N'4500000',N'NV11',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV12', N'Trần Hiep', N'Nam', CAST(N'2003-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'2700000',N'NV12',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV13', N'Pham hai', N'Nam', CAST(N'2002-08-12T00:00:00.000' AS DateTime), N'Hoà Bình', N'0985143235', N'2500000',N'NV13',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV14', N'Trần thuỷ', N'Nữ', CAST(N'2001-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'2600000',N'NV14',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV15', N'Minh Tâm', N'Nữ', CAST(N'2000-01-12T00:00:00.000' AS DateTime), N'Bắc Ninh', N'0979657676', N'2600000',N'NV15',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV16', N'Bùi Ngân', N'Nữ', CAST(N'1999-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'0918167892', N'2500000',N'NV16',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV17',N'Đỗ Huy Lực', N'Nam', CAST(N'2002-08-08T00:00:00.000' AS DateTime), N'Nam Định', N'0983646585', N'3600000',N'NV17',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV18', N'Đỗ Thảo Trang', N'Nữ', CAST(N'2004-06-06T00:00:00.000' AS DateTime), N'Hà Nội', N'0962099666', N'1200000',N'NV18',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV19', N'Trần Huy Toàn', N'Nam', CAST(N'2002-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686', N'18000000',N'NV19',0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Luong],[Password],[IsManager]) VALUES (N'NV20', N'Nguyễn Quyên', N'Nữ', CAST(N'2003-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689', N'2400000',N'NV20',0)
Go

-- insert KhachHang
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH01', N'Nguyễn Đình Sơn', N'Bắc Ninh', N'0968686868', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH02', N'Đỗ Văn Bắc', N'Hải Dương', N'0905883993', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH03', N'Mạnh Thường Quân', N'Hải Phòng', N'0918688685', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH04', N'Mai Phương Lan', N'Hà Nội', N'0978656790', 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH05', N'Nguyễn Thị Phương', N'Hà Nội', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH06', N'Trần Đăng Hưng', N'Ninh Bình', NULL, 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH07', N'Hoàng Thị Hồng', N'Thái Nguyên', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH08', N'Cẩm Thị Hương', N'TP HCM', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH09', N'Mai Văn Hùng', N'Phú Thọ', NULL, 1)
Go

-- insert NhaCungCap

INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC01', N'Hoàn Kiếm')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC02', N'Ba Đình')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC03', N'Hai Bà Trưng')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC04', N'Đống Đa')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC05', N'Cầu Giấy')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC06', N'Thanh Xuân')
Go

-- insert Thể loại
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL01', N'Giày thể thao')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL02', N'Giày leo núi')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL03', N'Giày thời trang high-top')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL04', N'Giày thời trang mid-top')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL05', N'Giày thời trang low-top')
GO

-- insert Thương hiệu

INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH01', N' Supreme')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH02', N'ADIDAS')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH03', N'New Balance')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH04', N'Converse')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'Th05', N'Vans')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH06', N'Valentino')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH07', N'Charles & Keith')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH08', N'Jimmy Choo')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH09', N'brand Balenciaga')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH10', N'Jordan')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH11', N'Nike')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH12', N'MLB')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH13', N'Puma')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH14', N'FILA')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'Th15', N'Alexander McQueen')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH16', N'Common Projects')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH17', N'Asics')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH18', N'Gucci')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH19', N'Dolce & Gabbana')
INSERT [dbo].[tThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH20', N'Doma')
Go

-- insert chất liệu

INSERT [dbo].[tChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'CL01', N'Vải')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'CL02', N'Da cá sấu')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'CL03', N'Da dê')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'CL04', N'Cao su')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'CL05', N'Da bò')
Go

-- inssert tGiay
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'G01', N'Adidas 8681 ', N'CL01', N'TL01', N'TH03', 100000.0000, 108000.0000, 120, 365, N'638 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'G02', N'Nike Air Force 1 ', N'CL02', N'TL01', N'TH04', 60000.0000, 69000.0000, 70, 41, N'440 gram', NULL,N'Unisex',N'Đen')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'G03', N'Adidas Ultra Boost', N'CL04', N'TL06', N'TH05', 105000.0000, 115000.0000, 45, 40, N'450 gram', NULL,N'Unisex', N'Xanh')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'G04', N'Nike Jordan 1','CL05', N'TL01', N'TH01', 65000.0000, 89000.0000, 78, 39, N'374 gram', NULL,N'Unisex', N'Xanh')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'G05', N'Adidas Ultra Boost', N'CL03', N'TL05', N'TH07', 245000.0000, 272000.0000, 56, 36, N'902 gram', NULL,N'Nam', N'Đỏ-Đen')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S06', N'Giày MLB Mustard NY ', N'CL04', N'TL05', N'TH02', 64000.0000, 78000.0000, 89, 37, N'650 gram', NULL,N'Nam', N'Đỏ-Đen')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S07', N'Adidas Alphabounce Beyond REP', N'CL01', N'TL03', N'TH03', 135000.0000, 149000.0000, 68, 38, N'720 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S08', N'Nike Air Force 1 Travis Scott ', N'CL01', N'TL04', N'TH08', 80000.0000, 92000.0000, 45, 482, N'500 gram', NULL,N'Unisex', N'Xanh')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S09', N'Nike Jordan 2', N'Giả da', N'TL02', N'TH09', 41000.0000, 48000.0000, 79, 39, N'480 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S10', N'Adidas Alphabounce New 22 ', N'CL05', N'TL05', N'TH10', 115000.0000, 130000.0000, 43, 40, N'506 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S11', N'Vans Old Skool ', N'CL01', N'TL02', N'TH11', 110000.0000, 150000.0000, 80, 41, N'500 gram', NULL,N'Nam', N'Đỏ-Đen')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S12', N'Giày Converse', N'CL05', N'TL02', N'TH12', 100000.0000, 130000.0000, 80, 42, N'400 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S13', N'Vans Classic Caro F1', N'CL03', N'TL01', N'TH13', 100000.0000, 140000.0000, 80, 43, N'330 gram', NULL,N'Unisex', N'Xanh')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S14', N'Xsport Prophere 4', N'CL02', N'TL01', N'TH14', 200000.0000, 250000.0000, 60, 40, N'200 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S15', N'Adidas Superstar', N'CL04', N'TL01', N'TH15', 200000.0000, 300000.0000, 40, 41, N'500 gram', NULL,N'Nam', N'Đỏ-Đen')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S16', N'Vans Vault Old Skool', N'CL02', N'TL01', N'TH16', 200000.0000, 300000.0000, 50, 42, N'300 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S17', N'Adidas EQT Bask Adv ', N'Giả da', N'TL01', N'TH17', 250000.0000, 300000.0000, 30, 43, N'400 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S18', N'Converse 1970s', N'CL01', N'TL01', N'TH18', 300000.0000, 400000.0000, 60, 40, N'500 gram', NULL,N'Nữ',N'Trắng')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S19', N'Adidas Prophere Xanh Dương Rep', N'CL03', N'TL01', N'TH04', 300000.0000, 450000.0000, 60, 39, N'400 gram', NULL,N'Unisex', N'Xanh')
INSERT [dbo].[tGiay] ([MaGiay], [TenGiay], [MaChatLieu], [MaTheLoai], [MaThuongHieu], [DonGiaNhap], [DonGiaBan], [SoLuong], [KichThuoc], [TrongLuong], [Anh],[GioiTinh],[MauSac]) VALUES (N'S20', N'Adidas Tubular Shadow ', N'CL02', N'TL01', N'TH05', 300000.0000, 400000.0000, 80, 38, N'300 gram', NULL,N'Nam', N'Đỏ-Đen')
GO
select * from tgiay

-- inssert tHoaDonBan

INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB01', N'NV01', CAST(N'2022-08-11T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB02', N'NV02', CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB03', N'NV01', CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB04', N'NV02', CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB05', N'NV03', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'KH05')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB06', N'NV04', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'KH06')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB07', N'NV04', CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'KH07')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB08', N'NV05', CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'KH08')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB09', N'NV06', CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'KH09')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB010', N'NV01', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB11', N'NV01', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB12', N'NV02', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB13', N'NV03', CAST(N'2022-03-11T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB14', N'NV03', CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB15', N'NV05', CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'KH05')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB16', N'NV02', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'KH08')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB17', N'NV02', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'KH07')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB18', N'NV05', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'KH06')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB19', N'NV05', CAST(N'2022-12-31T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB20', N'NV01', CAST(N'2022-12-31T00:00:00.000' AS DateTime), N'KH09')
GO


-- inssert tHoaDonNhap

INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN01', N'NV02', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN02', N'NV01', CAST(N'2022-06-28T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN03', N'NV04', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'NCC05')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN04', N'NV05', CAST(N'2021-03-05T00:00:00.000' AS DateTime), N'NCC04')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN05', N'NV03', CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'NCC02')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN06', N'NV02', CAST(N'2020-04-13T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN07', N'NV01', CAST(N'2020-06-28T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN08', N'NV04', CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'NCC05')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN09', N'NV05', CAST(N'2020-03-05T00:00:00.000' AS DateTime), N'NCC02')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN10', N'NV03', CAST(N'2020-04-10T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN11', N'NV02', CAST(N'2019-04-13T00:00:00.000' AS DateTime), N'NCC02')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN12', N'NV01', CAST(N'2018-06-28T00:00:00.000' AS DateTime), N'NCC04')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN13', N'NV04', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'NCC05')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN14', N'NV05', CAST(N'2018-03-05T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN15', N'NV03', CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'NCC02')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN16', N'NV02', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN17', N'NV01', CAST(N'2020-06-28T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN18', N'NV04', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'NCC05')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN19', N'NV05', CAST(N'2020-03-05T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN20', N'NV03', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'NCC02')
Go


-- inssert tChiTietHDB


INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'G01', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'G02', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'G04', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'G04', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'G05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'G02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'G06', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'G08', 11, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'G03', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'G04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'G10', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'G05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'G06', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'G08', 14, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'G02', 13, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'G05', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'G10', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'G11', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'G01', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'G06', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'G08', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'G01', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'G06', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'G07', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'G03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'G06', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'G09', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'G07', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'G11', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'G13', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'G04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'G08', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'G11', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'G05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'G09', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'G12', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'G02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'G03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'G04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'G10', 8, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'G10', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'G11', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'G10', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB14', N'G11', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB15', N'G11', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB15', N'G02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB15', N'G03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB15', N'G04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB16', N'G02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB16', N'G03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB16', N'G04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB16', N'G08', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB17', N'G14', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB17', N'G12', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB17', N'G15', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB18', N'G20', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB19', N'G10', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB19', N'G03', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB19', N'G06', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB20', N'G15', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB20', N'G15', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB20', N'G20', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaGiay], [SLBan], [KhuyenMai]) VALUES (N'HDB20', N'G10', 2, NULL)
GO

select * from thoadonban
select * from tChiTietHDB
select * from tgiay
-- inssert tChiTietHDN

INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN01', N'G01', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN02', N'G20', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN03', N'G03', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN04', N'G09', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN05', N'G15', 15, NULL)
GO
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN06', N'S01', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN07', N'S06', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN08', N'S03', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN09', N'S09', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN10', N'G10', 15, NULL)
GO
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN11', N'G09', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN12', N'G06', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN13', N'G07', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN14', N'G05', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN15', N'G06', 15, NULL)
GO
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN16', N'G05', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN17', N'G04', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN18', N'G03', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN19', N'G02', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaGiay], [SLNhap], [KhuyenMai]) VALUES (N'HDN20', N'G01', 15, NULL)
GO

/*	Trigger	*/

use CSDL_BanGiay
-- tạo trigger khi xóa 1 thương hiệu thì xóa toàn bộ giầy có thương hiệu đó
create trigger XoaThuongHieu on tThuonghieu
instead of delete as
begin
	declare @mathuonghieu varchar(10)
	select @mathuonghieu=  MaThuongHieu from deleted
	delete from tGiay where MaThuongHieu=@mathuonghieu
	delete from tThuongHieu where MaThuongHieu=@mathuonghieu
end
-- tạo trigger khi xóa 1 thể loại thì xóa toàn bộ giầy có thể loại đó
create trigger XoaTheLoai on ttheLoai
instead of delete as
begin
	declare @matheloai varchar(10)
	select @matheloai=  MaTheLoai from deleted
	delete from tGiay where MaTheLoai=@matheloai
	delete from tTheLoai where MaTheLoai=@matheloai
end
-- tạo trigger khi xóa 1 chất liệu thì xóa toàn bộ giầy 
create trigger XoaChatLieu on tChatLieu
instead of delete as
begin
	declare @machatlieu varchar(10)
	select @machatlieu= MaChatLieu from deleted
	delete from tGiay where MaChatLieu=@machatlieu
	delete from tChatLieu where MaChatLieu=@machatlieu
end
go
-- function tính doanh thu theo ngày
create function TinhDoanhThu (@tungay varchar(20),@denngay varchar(20)) returns table as return(
	select SUM(SLBan*DonGiaBan) as TongTien from tGiay g join tChiTietHDB cthdb on g.MaGiay=cthdb.MaGiay
	join tHoaDonBan hdb on hdb.SoHDB=cthdb.SoHDB
	where NgayBan between @tungay and @denngay)
go
select* from TinhDoanhThu('2021-11-1','2022-11-14')
go
--function đưa ra sản phẩm bán theo ngày
create function SanPhamBan (@tungay varchar(20),@denngay varchar(20)) returns table as return(
	select g.MaGiay,TenGiay,DonGiaBan,SLBan,NgayBan,SUM(SLBan*DonGiaBan) as TongTien from tGiay g join tChiTietHDB cthdb on g.MaGiay=cthdb.MaGiay
	join tHoaDonBan hdb on hdb.SoHDB=cthdb.SoHDB
	where NgayBan between @tungay and @denngay
	group by g.MaGiay,TenGiay,DonGiaBan,SLBan,NgayBan
)
go
select* from SanPhamBan('2021-11-1','2022-11-14')
go
-- function tính tiền nhập theo ngày
create function TinhTienNhap (@tungay varchar(20),@denngay varchar(20)) returns table as return(
	select SUM(SLNhap*DonGiaNhap) as TongTien from tGiay g join tChiTietHDN cthdn on g.MaGiay=cthdn.MaGiay
	join tHoaDonNhap hdn on hdn.SoHDN=cthdn.SoHDN
	where NgayNhap between @tungay and @denngay)
go
select * from TinhTienNhap('2022-11-1','2022-11-14')
go
-- function đưa ra sản phẩm nhập theo ngày
create function SanPhamNhap (@tungay varchar(20),@denngay varchar(20)) returns table as return(
	select g.MaGiay,TenGiay,DonGiaNhap,SLNhap,NgayNhap, SUM(SLNhap*DonGiaNhap) as TongTien from tGiay g join tChiTietHDN cthdn on g.MaGiay=cthdn.MaGiay
	join tHoaDonNhap hdn on hdn.SoHDN=cthdn.SoHDN
	where NgayNhap between @tungay and @denngay
	group by g.MaGiay,TenGiay,DonGiaNhap,SLNhap,NgayNhap
)
go


create function DoanhThuTheoNgay( @ngay datetime) returns table as return
(
	select  NgayBan,cthdb.SoHDB,TenGiay,SLBan,DonGiaBan,SLBan*DonGiaBan as dt 
	from tHoaDonBan hdb join tChiTietHDB cthdb on hdb.SoHDB=cthdb.SoHDB
	join tGiay g on g.MaGiay=cthdb.MaGiay
	where YEAR(NGayBan)=YEAR(@ngay) and MONTH(NgayBan)=MONTH(@ngay) and DAY(NgayBan)=DAY(@ngay)
)
Go

create function TinhDoanhThuTheoNgay(@ngay datetime) returns money as
begin
	declare @dt money
	select @dt= SUM(SLBan*DonGiaBan) from tHoaDonBan hdb join tChiTietHDB cthdb on hdb.SoHDB=cthdb.SoHDB
	join tGiay g on g.MaGiay=cthdb.MaGiay
	where YEAR(NGayBan)=YEAR(@ngay) and MONTH(NgayBan)=MONTH(@ngay) and DAY(NgayBan)=DAY(@ngay)
	return @dt
end