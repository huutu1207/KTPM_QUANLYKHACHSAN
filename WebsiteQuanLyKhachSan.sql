USE [QL_KhachSan]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaPH] [varchar](50) NULL,
	[MaKH] [varchar](50) NULL,
	[NDBL] [nvarchar](max) NULL,
	[DanhGia] [int] NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_BINHLUAN] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATDICHVU]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATDICHVU](
	[MaDV] [varchar](50) NOT NULL,
	[MaDP] [varchar](50) NOT NULL,
	[NgayDat] [date] NULL,
	[NgayNhan] [date] NULL,
	[NgayTra] [date] NULL,
 CONSTRAINT [PK_DATDICHVU] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC,
	[MaDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATPHONG]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATPHONG](
	[MaDP] [varchar](50) NOT NULL,
	[MaKH] [varchar](50) NULL,
	[MaPH] [varchar](50) NULL,
	[NgayDat] [date] NULL,
	[NgayNhan] [date] NULL,
	[NgayTra] [date] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[DatCoc] [float] NULL,
 CONSTRAINT [PK_DATPHONG] PRIMARY KEY CLUSTERED 
(
	[MaDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DICHVU]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DICHVU](
	[MaDV] [varchar](50) NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[Mota] [nvarchar](max) NULL,
	[Gia] [float] NULL,
	[AnhDichVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DICHVU] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [varchar](50) NULL,
	[CCCD] [varchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[QuocTich] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[EmailVerificationCode] [varchar](10) NULL,
	[IsEmailVerified] [bit] NULL,
	[Avatar] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuThayDoi]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuThayDoi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](50) NULL,
	[TruongThayDoi] [nvarchar](100) NULL,
	[GiaTriCu] [nvarchar](max) NULL,
	[GiaTriMoi] [nvarchar](max) NULL,
	[NgayThayDoi] [datetime] NULL,
	[NguoiThayDoi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuTraPhong]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuTraPhong](
	[MaLS] [int] IDENTITY(1,1) NOT NULL,
	[MaPH] [varchar](50) NULL,
	[SoPH] [varchar](50) NULL,
	[MaKH] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
	[CCCD] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[NgayNhan] [date] NULL,
	[NgayTra] [date] NULL,
 CONSTRAINT [PK_LichSuTraPhong] PRIMARY KEY CLUSTERED 
(
	[MaLS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIPHONG]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIPHONG](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAIPHONG] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuLink] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[OrderNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONG](
	[MaPH] [varchar](50) NOT NULL,
	[SoPH] [varchar](50) NULL,
	[Anh] [nvarchar](max) NULL,
	[Mota] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[MaLoai] [varchar](50) NULL,
	[CheckIn] [date] NULL,
	[CheckOut] [date] NULL,
	[DienTich] [float] NULL,
	[NoiThat] [nvarchar](max) NULL,
 CONSTRAINT [PK_PHONG] PRIMARY KEY CLUSTERED 
(
	[MaPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANGTIN]    Script Date: 12/8/2024 2:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTIN](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](100) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayTao] [smalldatetime] NULL,
	[MetaTitle] [nvarchar](100) NULL,
 CONSTRAINT [PK__TRANGTIN__272500797CCEB610] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BINHLUAN] ON 

INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (1, N'P02', N'KH51C4472C', N'fgh', 5, CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (2, N'P09', N'KH51C4472C', N'Phòng Sạch đẹp', 5, CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (3, N'P09', N'KH51C4472C', N'Phòng có đủ tiện nghi, đúng như mô tả', 4, CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (4, N'P01', N'KH51C4472C', N'', 5, CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (5, N'MK1', N'KH51C4472C', N'1', 1, CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (6, N'MK1', N'KH51C4472C', N'Phong xau qua', 5, CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (7, N'MK1', N'KH51C4472C', N'1', 5, CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (8, N'KH01', N'KH51C4472C', N'Hào chó', 5, CAST(N'2024-12-05T07:54:18.333' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (9, N'P01', N'KH51C4472C', N'', 5, CAST(N'2024-12-05T08:02:27.883' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (10, N'P01', N'KH51C4472C', N'Phong dep', 1, CAST(N'2024-12-05T08:02:41.750' AS DateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaPH], [MaKH], [NDBL], [DanhGia], [ThoiGian]) VALUES (11, N'M01', N'KH51C4472C', N'1', 4, CAST(N'2024-12-06T22:14:24.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[BINHLUAN] OFF
GO
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [Mota], [Gia], [AnhDichVu]) VALUES (N'DV003', N'mát xa', N'âssaa', 60000, NULL)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [Mota], [Gia], [AnhDichVu]) VALUES (N'DV01', N'Thuê xe', NULL, 50000, NULL)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [Mota], [Gia], [AnhDichVu]) VALUES (N'DV02', N'Giặt ủi', NULL, 20000, NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH01', N'Nguyen Van A', N'Ha Noi', N'0912345678', N'Nam', NULL, CAST(N'1990-01-01T00:00:00' AS SmallDateTime), N'Viet Nam', N'nva@gmail.com', N'nguyenvana', N'123456', NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH02', N'Tran Thi B', N'Ho Chi Minh', N'0934567890', N'Nu', NULL, CAST(N'1992-02-02T00:00:00' AS SmallDateTime), N'Viet Nam', N'ttb@gmail.com', N'tranthib', N'abcdef', NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH03', N'chuongle', N'BD', N'12345', N'nam', N'1231', CAST(N'2024-10-10T00:00:00' AS SmallDateTime), N'Viet Nam', N'test123@gmai.com', N'chuong', N'123', NULL, 1, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH1168FC04', N'Ngô Minh Trí', N'Bình Dương', N'0123456789', N'Nam', N'1234567890', CAST(N'2024-11-28T00:00:00' AS SmallDateTime), N'Viet Nam', N'ngominhtri290820@gmail.com', N'minhtri123', N'SB9swFERQ8zdfi0bG5T68KcAqLSc0Tkipwta4orKqMU=', NULL, 1, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH4920942B', N'chuongle', N'Binh Duong', N'123456', N'Nam', N'123456', CAST(N'2024-12-04T00:00:00' AS SmallDateTime), N'Viet Nam', N'leh4624@gmail.com', N'chuongle', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL, 1, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH51C4472C', N'Lê Hữu Tú', N'Phu Yen', N'012334', N'Nam', N'22321321', CAST(N'2006-01-11T00:00:00' AS SmallDateTime), N'VietNam', N'2224802010236@student.tdmu.edu.vn', N'htu', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', NULL, 1, N'astronaut-gargantua-3840x2160-10068.jpg')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [CCCD], [NgaySinh], [QuocTich], [Email], [Username], [Password], [EmailVerificationCode], [IsEmailVerified], [Avatar]) VALUES (N'KH51C4472C11', N'Chương Lê Hoài', NULL, N'0000', NULL, NULL, CAST(N'2024-12-05T16:12:00' AS SmallDateTime), NULL, N'2224802010779@student.tdmu.edu.vn', N'2224802010779', N'94757fdf75', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[LichSuThayDoi] ON 

INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (1, N'KH03', N'DiaChi', NULL, N'BD', CAST(N'2024-12-01T20:23:38.953' AS DateTime), N'')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (2, N'KH03', N'DienThoai', NULL, N'12345', CAST(N'2024-12-01T20:23:38.963' AS DateTime), N'')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (3, N'KH03', N'CCCD', NULL, N'1231', CAST(N'2024-12-01T20:23:38.963' AS DateTime), N'')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (4, N'KH03', N'Username', NULL, N'chuong', CAST(N'2024-12-01T20:23:38.963' AS DateTime), N'')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (5, N'KH03', N'NgaySinh', NULL, N'10/10/2024 12:00:00 AM', CAST(N'2024-12-01T20:39:01.937' AS DateTime), N'chuong')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (6, N'KH03', N'QuocTich', NULL, N'Viet Nam', CAST(N'2024-12-01T20:39:02.103' AS DateTime), N'chuong')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (7, N'KH03', N'GioiTinh', NULL, N'nam', CAST(N'2024-12-01T21:00:07.833' AS DateTime), N'chuong')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (8, N'KH03', N'HoTen', N'chuong', N'chuongle', CAST(N'2024-12-02T07:20:34.283' AS DateTime), N'chuong')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (9, N'KH51C4472C1', N'QuocTich', NULL, N'Việt Nam', CAST(N'2024-12-04T23:29:37.160' AS DateTime), N'Nguyen Van C')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (10, N'KH03', N'Email', NULL, N'no@gmai.com', CAST(N'2024-12-05T08:34:06.337' AS DateTime), N'Nguyen Van C')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (11, N'KH03', N'Email', N'no@gmai.com', N'test@gmai.com', CAST(N'2024-12-05T08:34:46.810' AS DateTime), N'Nguyen Van C')
INSERT [dbo].[LichSuThayDoi] ([Id], [MaKH], [TruongThayDoi], [GiaTriCu], [GiaTriMoi], [NgayThayDoi], [NguoiThayDoi]) VALUES (12, N'KH03', N'Email', N'test@gmai.com', N'test123@gmai.com', CAST(N'2024-12-05T08:36:07.517' AS DateTime), N'Chuong')
SET IDENTITY_INSERT [dbo].[LichSuThayDoi] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSuTraPhong] ON 

INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (2, N'P02', N'102', N'KH02', N'Tran Thi B', N'0934567890', NULL, N'ttb@gmail.com', 700000, CAST(N'2024-11-04' AS Date), CAST(N'2024-11-30' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (3, N'PH09', N'109', N'KH51C4472C', N'Lê Hữu Tú', N'012334', N'22321321', N'2224802010236@student.tdmu.edu.vn', 210000, CAST(N'2024-12-02' AS Date), CAST(N'2024-12-02' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (4, N'KH01', N'909', N'KH51C4472C', N'Lê Hữu Tú', N'012334', N'22321321', N'2224802010236@student.tdmu.edu.vn', 4500000, NULL, CAST(N'2024-12-05' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (5, N'P01', N'101', N'KH1168FC04', N'Ngô Minh Trí', N'0123456789', N'1234567890', N'ngominhtri290820@gmail.com', 500000, CAST(N'2024-12-13' AS Date), CAST(N'2024-12-05' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (6, N'P01', N'101', N'KH1168FC04', N'Ngô Minh Trí', N'0123456789', N'1234567890', N'ngominhtri290820@gmail.com', 500000, CAST(N'2024-12-13' AS Date), CAST(N'2024-12-05' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (7, N'PH09', N'109', N'KH1168FC04', N'Ngô Minh Trí', N'0123456789', N'1234567890', N'ngominhtri290820@gmail.com', 310000, CAST(N'2024-12-07' AS Date), CAST(N'2024-12-07' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (8, N'KH01', N'909', N'KH51C4472C', N'Lê Hữu Tú', N'012334', N'22321321', N'2224802010236@student.tdmu.edu.vn', 4500000, CAST(N'2024-12-07' AS Date), CAST(N'2024-12-07' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (9, N'M01', N'108', N'KH1168FC04', N'Ngô Minh Trí', N'0123456789', N'1234567890', N'ngominhtri290820@gmail.com', 120000, CAST(N'2024-12-07' AS Date), CAST(N'2024-12-08' AS Date))
INSERT [dbo].[LichSuTraPhong] ([MaLS], [MaPH], [SoPH], [MaKH], [HoTen], [DienThoai], [CCCD], [Email], [Gia], [NgayNhan], [NgayTra]) VALUES (10, N'KH01', N'909', N'KH1168FC04', N'Ngô Minh Trí', N'0123456789', N'1234567890', N'ngominhtri290820@gmail.com', 4500000, CAST(N'2024-12-08' AS Date), CAST(N'2024-12-08' AS Date))
SET IDENTITY_INSERT [dbo].[LichSuTraPhong] OFF
GO
INSERT [dbo].[LOAIPHONG] ([MaLoai], [TenLoai]) VALUES (N'LP01', N'Phòng Ðơn')
INSERT [dbo].[LOAIPHONG] ([MaLoai], [TenLoai]) VALUES (N'LP02', N'Phòng Ðôi')
INSERT [dbo].[LOAIPHONG] ([MaLoai], [TenLoai]) VALUES (N'LP03', N'Phòng VIP')
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (1, N'Trang Chủ', N'', NULL, 1)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (2, N'Phòng', N'Danh-sach-phong', NULL, 2)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (3, N'Dịch Vụ', N'Dich-Vu', NULL, 3)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (4, N'Tin Tức', NULL, NULL, 4)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (5, N'Liên Hệ', N'Lien-He', NULL, 5)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (6, N'Trang Tin', N'{metatitle}', NULL, 6)
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [DiaChi], [Email], [NgaySinh], [GioiTinh], [Username], [Password], [ChucVu], [DienThoai]) VALUES (N'NV01', N'Nguyen Van C', N'Ha Noi', N'nvc@gmail.com', CAST(N'1985-05-05' AS Date), N'Nam', N'nhanvienquanly', N'123456', N'Quan ly', N'0123456789')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [DiaChi], [Email], [NgaySinh], [GioiTinh], [Username], [Password], [ChucVu], [DienThoai]) VALUES (N'NV02', N'Le Thi D', N'Da Nang', N'ltd@gmail.com', CAST(N'1990-06-06' AS Date), N'Nu', N'nhanvienletan', N'abcdef', N'Le tan', N'0987654321')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [DiaChi], [Email], [NgaySinh], [GioiTinh], [Username], [Password], [ChucVu], [DienThoai]) VALUES (N'NV03', N'Chuong', NULL, NULL, NULL, NULL, N'chuong', N'123', N'Le tan', NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [DiaChi], [Email], [NgaySinh], [GioiTinh], [Username], [Password], [ChucVu], [DienThoai]) VALUES (N'NV04', N'Trí', NULL, NULL, NULL, NULL, N'tri', N'12345', N'Lễ tân', NULL)
GO
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'KH01', N'909', N'1.jpg', N'<p>hay</p>
', N'Available', 4500000, NULL, CAST(N'2024-12-19' AS Date), CAST(N'2024-12-26' AS Date), 120, N'dgth')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'M01', N'108', N'1.jpg', N'<p>hay</p>
', N'Available', 120000, NULL, CAST(N'2024-12-18' AS Date), CAST(N'2024-12-20' AS Date), 13, N'TV, Máy lạnh, Máy giặt, ...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'MK1', N'105', N'4.jpg', NULL, N'Booked', NULL, NULL, NULL, NULL, 12, N'TV, Máy lạnh, Máy giặt, ...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'P01', N'101', N'4.jpg', N'<p>Ph&ograve;ng c&oacute; view đẹp</p>
', N'Available', 500000, NULL, CAST(N'2024-12-13' AS Date), CAST(N'2024-12-14' AS Date), 11, N'TV, Máy lạnh, Máy giặt, ...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'P02', N'102', N'3.jpg', N'<p>Ph&ograve;ng g?n h? boi</p>
', N'Booked', 700000, NULL, CAST(N'2024-12-03' AS Date), CAST(N'2024-12-07' AS Date), 10, N'TV, Máy lạnh, Máy giặt, ...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'P05', N'208', N'1.jpg', N'<p>Kh&aacute;ch sạn gần biển</p>
', NULL, 123000, NULL, CAST(N'2024-12-03' AS Date), CAST(N'2024-12-12' AS Date), 14, N'đầy đủ')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'P09', N'209', N'4.jpg', N'<p>good</p>
', N'Occupied', 12345, NULL, NULL, NULL, 10, N'TV, Máy lạnh, Máy giặt, ...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'PH05', N'Phòng 301', N'4.jpg', N'<p>Ph&ograve;ng view biển lu&ocirc;n mang lại một cảm gi&aacute;c thư gi&atilde;n, b&igrave;nh y&ecirc;n m&agrave; kh&oacute; c&oacute; nơi n&agrave;o s&aacute;nh được. Khi bước v&agrave;o ph&ograve;ng, &aacute;nh s&aacute;ng tự nhi&ecirc;n từ biển cả m&ecirc;nh m&ocirc;ng tr&agrave;n ngập kh&ocirc;ng gian, l&agrave;m cho mọi thứ trở n&ecirc;n tươi mới v&agrave; trong l&agrave;nh. Cửa sổ rộng mở, hướng thẳng ra đại dương, bạn c&oacute; thể dễ d&agrave;ng ngắm nh&igrave;n những con s&oacute;ng vỗ nhẹ v&agrave;o bờ, tạo n&ecirc;n &acirc;m thanh dịu &ecirc;m. Buổi s&aacute;ng, mặt trời l&oacute; dạng tr&ecirc;n ch&acirc;n trời, tạo n&ecirc;n một bức tranh huyền b&iacute; với sắc v&agrave;ng ấm &aacute;p, trong khi buổi chiều, &aacute;nh ho&agrave;ng h&ocirc;n phủ xuống, khiến kh&ocirc;ng gian th&ecirc;m phần l&atilde;ng mạn v&agrave; huyền ảo.</p>

<p>Cảm gi&aacute;c khi ngồi b&ecirc;n cửa sổ, thưởng thức một t&aacute;ch tr&agrave; n&oacute;ng, nh&igrave;n ra biển cả m&ecirc;nh m&ocirc;ng, l&agrave; khoảnh khắc kh&ocirc;ng thể qu&ecirc;n. Kh&ocirc;ng kh&iacute; trong l&agrave;nh, l&agrave;n gi&oacute; biển nhẹ nh&agrave;ng thổi qua, mang lại sự thư gi&atilde;n tuyệt đối. Đ&acirc;y ch&iacute;nh l&agrave; kh&ocirc;ng gian l&yacute; tưởng để tĩnh t&acirc;m, thư gi&atilde;n sau những ng&agrave;y l&agrave;m việc căng thẳng. Ph&ograve;ng view biển kh&ocirc;ng chỉ l&agrave; một nơi nghỉ ngơi, m&agrave; c&ograve;n l&agrave; nơi gi&uacute;p bạn t&igrave;m lại sự b&igrave;nh y&ecirc;n trong t&acirc;m hồn, kết nối với thi&ecirc;n nhi&ecirc;n v&agrave; cảm nhận sự bao la của đại dương.</p>
', N'Available', 400000, NULL, NULL, NULL, 12, N'Máy giặt, TV,...')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'PH06', N'Phòng 302', N'3.jpg', N'<p>Ph&ograve;ng view đẹp mở ra một kh&ocirc;ng gian rộng lớn v&agrave; y&ecirc;n b&igrave;nh, nơi mọi thứ h&ograve;a quyện một c&aacute;ch ho&agrave;n hảo với thi&ecirc;n nhi&ecirc;n xung quanh. Cửa sổ lớn hướng ra một khu vườn xanh m&aacute;t, nơi những c&acirc;y cối tươi tốt, hoa l&aacute; khoe sắc v&agrave; những l&agrave;n gi&oacute; nhẹ nh&agrave;ng thổi qua, mang đến sự thư gi&atilde;n tuyệt đối. &Aacute;nh s&aacute;ng tự nhi&ecirc;n len lỏi v&agrave;o từng ng&oacute;c ng&aacute;ch trong ph&ograve;ng, khiến mọi vật trở n&ecirc;n s&aacute;ng bừng, đầy sức sống.</p>
', NULL, 400000, N'LP02', NULL, NULL, 15, N'Máy lạnh')
INSERT [dbo].[PHONG] ([MaPH], [SoPH], [Anh], [Mota], [TrangThai], [Gia], [MaLoai], [CheckIn], [CheckOut], [DienTich], [NoiThat]) VALUES (N'PH09', N'109', N'1.jpg', N'<p>view dep lam</p>

<p><img alt="" src="/Uploads/images/Gym.jpg" style="height:120px; width:180px" /></p>
', N'Available', 310000, NULL, CAST(N'2024-12-03' AS Date), CAST(N'2024-12-05' AS Date), 20, N'TV, Máy lạnh, Máy giặt, ...')
GO
SET IDENTITY_INSERT [dbo].[TRANGTIN] ON 

INSERT [dbo].[TRANGTIN] ([MaTT], [TenTrang], [NoiDung], [NgayTao], [MetaTitle]) VALUES (1, N'Thông báo', N'<p>chung toi se cap nhat them dich vu sau. Xin ch&acirc;n th&agrave;nh cảm ơn.</p>

<p><img alt="" src="/Uploads/images/Gym.jpg" style="height:134px; width:200px" /></p>
', CAST(N'2024-12-02T09:48:00' AS SmallDateTime), N'thong-bao')
SET IDENTITY_INSERT [dbo].[TRANGTIN] OFF
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  DEFAULT ((0)) FOR [IsEmailVerified]
GO
ALTER TABLE [dbo].[LichSuThayDoi] ADD  DEFAULT (getdate()) FOR [NgayThayDoi]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_KHACHHANG]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_PHONG] FOREIGN KEY([MaPH])
REFERENCES [dbo].[PHONG] ([MaPH])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_PHONG]
GO
ALTER TABLE [dbo].[DATDICHVU]  WITH CHECK ADD  CONSTRAINT [FK_DATDICHVU_DATPHONG1] FOREIGN KEY([MaDP])
REFERENCES [dbo].[DATPHONG] ([MaDP])
GO
ALTER TABLE [dbo].[DATDICHVU] CHECK CONSTRAINT [FK_DATDICHVU_DATPHONG1]
GO
ALTER TABLE [dbo].[DATDICHVU]  WITH CHECK ADD  CONSTRAINT [FK_DATDICHVU_DICHVU] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DICHVU] ([MaDV])
GO
ALTER TABLE [dbo].[DATDICHVU] CHECK CONSTRAINT [FK_DATDICHVU_DICHVU]
GO
ALTER TABLE [dbo].[DATPHONG]  WITH CHECK ADD  CONSTRAINT [FK_DATPHONG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DATPHONG] CHECK CONSTRAINT [FK_DATPHONG_KHACHHANG]
GO
ALTER TABLE [dbo].[DATPHONG]  WITH CHECK ADD  CONSTRAINT [FK_DATPHONG_PHONG] FOREIGN KEY([MaPH])
REFERENCES [dbo].[PHONG] ([MaPH])
GO
ALTER TABLE [dbo].[DATPHONG] CHECK CONSTRAINT [FK_DATPHONG_PHONG]
GO
ALTER TABLE [dbo].[MENU]  WITH CHECK ADD  CONSTRAINT [FK_MENU_MENU] FOREIGN KEY([ParentId])
REFERENCES [dbo].[MENU] ([Id])
GO
ALTER TABLE [dbo].[MENU] CHECK CONSTRAINT [FK_MENU_MENU]
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD  CONSTRAINT [FK_PHONG_LOAIPHONG] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAIPHONG] ([MaLoai])
GO
ALTER TABLE [dbo].[PHONG] CHECK CONSTRAINT [FK_PHONG_LOAIPHONG]
GO
