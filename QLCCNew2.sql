USE [master]
GO
/****** Object:  Database [QLCCNew2]    Script Date: 8/7/2026 7:27:32 PM ******/
CREATE DATABASE [QLCCNew2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLCCNew2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLCCNew2.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLCCNew2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLCCNew2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLCCNew2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCCNew2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCCNew2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCCNew2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCCNew2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCCNew2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCCNew2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCCNew2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLCCNew2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCCNew2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCCNew2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCCNew2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCCNew2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCCNew2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCCNew2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCCNew2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCCNew2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCCNew2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCCNew2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCCNew2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCCNew2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCCNew2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCCNew2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCCNew2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCCNew2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLCCNew2] SET  MULTI_USER 
GO
ALTER DATABASE [QLCCNew2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCCNew2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCCNew2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCCNew2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLCCNew2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLCCNew2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLCCNew2] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLCCNew2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLCCNew2]
GO
/****** Object:  Table [dbo].[binhChon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[binhChon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maThongBao] [int] NOT NULL,
	[cauHoi] [nvarchar](500) NULL,
	[ngayBatDau] [datetime] NOT NULL,
	[hanChot] [datetime] NOT NULL,
	[trangThai] [nvarchar](20) NOT NULL,
	[tyLeTucSo] [decimal](5, 2) NOT NULL,
	[ketQua] [nvarchar](500) NULL,
	[tongCanHoLucMo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phuongAnBinhChon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phuongAnBinhChon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maBinhChon] [int] NOT NULL,
	[noiDung] [nvarchar](255) NULL,
	[thuTu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieuBau]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieuBau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maBinhChon] [int] NOT NULL,
	[maPhuongAn] [int] NOT NULL,
	[maCuDan] [int] NOT NULL,
	[thoiGianBau] [datetime] NOT NULL,
	[maCanHo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[canHo]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[canHo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soTang] [int] NOT NULL,
	[soPhong] [varchar](255) NULL,
	[trangThai] [nvarchar](255) NULL,
	[dienTich] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_KetQuaBinhChon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_KetQuaBinhChon] AS SELECT b.id            AS maBinhChon,        b.cauHoi,        b.trangThai,        b.tyLeTucSo,        b.ketQua,        pa.noiDung      AS phuongAn,        COUNT(pb.id)    AS soPhieu,        (SELECT COUNT(DISTINCT maCanHo) FROM dbo.phieuBau WHERE maBinhChon = b.id) AS soCanDaBau,        ISNULL(b.tongCanHoLucMo, (SELECT COUNT(*) FROM dbo.canHo WHERE trangThai = N'DangO')) AS tongSoCan FROM dbo.binhChon b JOIN dbo.phuongAnBinhChon pa ON pa.maBinhChon = b.id LEFT JOIN dbo.phieuBau pb    ON pb.maPhuongAn = pa.id GROUP BY b.id, b.cauHoi, b.trangThai, b.tyLeTucSo, b.ketQua, b.tongCanHoLucMo, pa.noiDung;
GO
/****** Object:  Table [dbo].[bieuGiaDichVu]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bieuGiaDichVu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loaiDichVu] [nvarchar](20) NULL,
	[bacTu] [decimal](10, 2) NOT NULL,
	[bacDen] [decimal](10, 2) NULL,
	[donGia] [decimal](15, 2) NOT NULL,
	[hieuLucTu] [date] NOT NULL,
	[nguonGia] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chamCong]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chamCong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NOT NULL,
	[ngayLam] [date] NOT NULL,
	[gioVao] [datetime] NULL,
	[gioRa] [datetime] NULL,
	[caLam] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chiSoTieuThu]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chiSoTieuThu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[loaiDichVu] [nvarchar](255) NULL,
	[thang] [int] NOT NULL,
	[nam] [int] NOT NULL,
	[chiSo] [float] NULL,
	[ngayGhi] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chiTietHoaDon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chiTietHoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maHoaDon] [int] NOT NULL,
	[loaiDichVu] [nvarchar](255) NULL,
	[chiSoCu] [float] NULL,
	[chiSoMoi] [float] NULL,
	[thanhTien] [decimal](15, 2) NOT NULL,
	[soLuong] [decimal](10, 2) NULL,
	[donViTinh] [varchar](10) NULL,
	[donGia] [decimal](15, 2) NULL,
	[dienGiai] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuDan]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuDan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[maTaiKhoan] [int] NULL,
	[hoTen] [nvarchar](255) NULL,
	[soDienThoai] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[loaiCuDan] [nvarchar](255) NULL,
	[trangThai] [nvarchar](255) NULL,
	[ngayChuyenDen] [datetime2](7) NULL,
	[ngayChuyenDi] [datetime2](7) NULL,
	[cccd] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhMucBoPhan]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhMucBoPhan](
	[maBoPhan] [varchar](10) NOT NULL,
	[tenBoPhan] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maBoPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhMucTienIch]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhMucTienIch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenTienIch] [nvarchar](100) NOT NULL,
	[moTa] [nvarchar](255) NULL,
	[sucChua] [int] NULL,
	[gioMoCua] [time](7) NULL,
	[gioDongCua] [time](7) NULL,
	[giaThueMacDinh] [decimal](15, 2) NOT NULL,
	[trangThaiHoatDong] [varchar](20) NOT NULL,
	[hinhAnh] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhMucVaiTro]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhMucVaiTro](
	[maVaiTro] [varchar](10) NOT NULL,
	[tenVaiTro] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datLichTienIch]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datLichTienIch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[maCuDan] [int] NULL,
	[maTienIch] [int] NOT NULL,
	[ngayDat] [date] NOT NULL,
	[khungGio] [nvarchar](20) NULL,
	[giaTien] [decimal](15, 2) NOT NULL,
	[trangThai] [nvarchar](20) NULL,
	[ngayTao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giaoDichThanhToan]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giaoDichThanhToan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maHoaDon] [int] NOT NULL,
	[maCuDan] [int] NULL,
	[soTien] [decimal](15, 2) NOT NULL,
	[phuongThuc] [nvarchar](20) NULL,
	[maGiaoDichNganHang] [varchar](50) NULL,
	[trangThai] [nvarchar](20) NULL,
	[thoiGianTao] [datetime] NOT NULL,
	[thoiGianXacNhan] [datetime] NULL,
	[soThamChieuSaoKe] [varchar](100) NULL,
	[ghiChuDoiSoat] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoaDon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[thang] [int] NOT NULL,
	[nam] [int] NOT NULL,
	[tongTien] [decimal](15, 2) NOT NULL,
	[trangThaiThanhToan] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lichSuXuLySuCo]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichSuXuLySuCo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maPhanAnh] [int] NOT NULL,
	[trangThai] [nvarchar](20) NULL,
	[ghiChu] [nvarchar](300) NULL,
	[maNhanVien] [int] NULL,
	[thoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanVien]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maTaiKhoan] [int] NULL,
	[hoTen] [nvarchar](100) NOT NULL,
	[soDienThoai] [varchar](15) NULL,
	[email] [varchar](100) NULL,
	[boPhan] [varchar](10) NULL,
	[ngayVaoLam] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhatKyCaTruc]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhatKyCaTruc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maBaoVe] [int] NOT NULL,
	[caTruc] [nvarchar](20) NULL,
	[ngayTruc] [date] NOT NULL,
	[noiDung] [nvarchar](max) NULL,
	[luuYBanGiao] [nvarchar](500) NULL,
	[maNguoiNhanCa] [int] NULL,
	[thoiGianBanGiao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhatKyTuanTra]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhatKyTuanTra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maBaoVe] [int] NOT NULL,
	[soTang] [int] NOT NULL,
	[thoiGianQuet] [datetime] NOT NULL,
	[anhMinhChung] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanAnhSuCo]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanAnhSuCo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NULL,
	[maCuDan] [int] NULL,
	[maNhanVien] [int] NULL,
	[tieuDe] [nvarchar](255) NULL,
	[moTa] [nvarchar](max) NULL,
	[anhTruocXuLy] [varchar](255) NULL,
	[anhSauXuLy] [varchar](255) NULL,
	[trangThai] [nvarchar](255) NULL,
	[nguonGui] [nvarchar](255) NULL,
	[ngayGui] [datetime] NOT NULL,
	[ngayHoanThanh] [datetime] NULL,
	[mucDoUuTien] [nvarchar](255) NULL,
	[loaiSuCo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quanLyXe]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quanLyXe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[maThe] [int] NULL,
	[bienSoXe] [varchar](20) NOT NULL,
	[loaiXe] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taiKhoan]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taiKhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maTaiKhoan] [varchar](255) NULL,
	[tenDangNhap] [varchar](255) NULL,
	[matKhau] [varchar](255) NOT NULL,
	[vaiTro] [varchar](10) NOT NULL,
	[boPhanCode] [varchar](10) NULL,
	[trangThaiHoatDong] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theTu]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theTu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maCanHo] [int] NOT NULL,
	[maCuDan] [int] NULL,
	[soThe] [varchar](50) NOT NULL,
	[ngayCap] [date] NOT NULL,
	[ngayHetHan] [date] NULL,
	[trangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theTu_ChucNang]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theTu_ChucNang](
	[maThe] [int] NOT NULL,
	[chucNang] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_theTu_ChucNang] PRIMARY KEY CLUSTERED 
(
	[maThe] ASC,
	[chucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thongBao]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thongBao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NOT NULL,
	[tieuDe] [nvarchar](255) NULL,
	[noiDung] [nvarchar](max) NULL,
	[loaiThongBao] [nvarchar](255) NULL,
	[ngayTao] [datetime] NOT NULL,
	[doiTuong] [nvarchar](255) NULL,
	[maCanHo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thongBao_DaDoc]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thongBao_DaDoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maThongBao] [int] NOT NULL,
	[maCuDan] [int] NULL,
	[thoiGianDoc] [datetime] NOT NULL,
	[maNhanVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bieuGiaDichVu] ON 

INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (1, N'Dien', CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(1984.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Biểu giá điện sinh hoạt EVN')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (2, N'Dien', CAST(50.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(2050.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Biểu giá điện sinh hoạt EVN')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (3, N'Dien', CAST(100.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(2380.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Biểu giá điện sinh hoạt EVN')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (4, N'Dien', CAST(200.00 AS Decimal(10, 2)), NULL, CAST(2998.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Biểu giá điện sinh hoạt EVN')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (5, N'Nuoc', CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(6700.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Giá nước sinh hoạt bậc 1')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (6, N'Nuoc', CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(7900.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Giá nước sinh hoạt bậc 2')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (7, N'Nuoc', CAST(20.00 AS Decimal(10, 2)), NULL, CAST(8600.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'Giá nước sinh hoạt bậc 3')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (8, N'PhiQuanLy', CAST(0.00 AS Decimal(10, 2)), NULL, CAST(8000.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'BQL quy định — đơn giá trên mỗi m² sàn/tháng')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (9, N'GuiXeOTo', CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1200000.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'BQL quy định')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (10, N'GuiXeMay', CAST(0.00 AS Decimal(10, 2)), NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(N'2026-01-01' AS Date), N'BQL quy định')
INSERT [dbo].[bieuGiaDichVu] ([id], [loaiDichVu], [bacTu], [bacDen], [donGia], [hieuLucTu], [nguonGia]) VALUES (12, N'PhiQuanLy', CAST(0.00 AS Decimal(10, 2)), NULL, CAST(9000.00 AS Decimal(15, 2)), CAST(N'2026-12-01' AS Date), N'BQL quy định — điều chỉnh phí quản lý từ 01/12/2026')
SET IDENTITY_INSERT [dbo].[bieuGiaDichVu] OFF
GO
SET IDENTITY_INSERT [dbo].[binhChon] ON 

INSERT [dbo].[binhChon] ([id], [maThongBao], [cauHoi], [ngayBatDau], [hanChot], [trangThai], [tyLeTucSo], [ketQua], [tongCanHoLucMo]) VALUES (21, 2, N'Bạn có đồng ý mở rộng sân Pickleball tầng thượng không?', CAST(N'2026-07-27T22:19:34.253' AS DateTime), CAST(N'2026-08-10T22:19:34.253' AS DateTime), N'DaDong', CAST(50.00 AS Decimal(5, 2)), N'Thông qua: "Đồng ý" (3 phiếu, tỷ lệ tham gia 50.00%)', 6)
INSERT [dbo].[binhChon] ([id], [maThongBao], [cauHoi], [ngayBatDau], [hanChot], [trangThai], [tyLeTucSo], [ketQua], [tongCanHoLucMo]) VALUES (22, 2, N'Bạn có đồng ý tăng phí quản lý lên 8.000đ/m² từ tháng 9 không?', CAST(N'2026-07-27T22:19:34.290' AS DateTime), CAST(N'2026-08-10T22:19:34.290' AS DateTime), N'KhongDuTucSo', CAST(50.00 AS Decimal(5, 2)), N'KHÔNG ĐỦ TÚC SỐ (16.67% < 50.00%). Kết quả chỉ mang tính tham khảo: "Đồng ý"', 6)
INSERT [dbo].[binhChon] ([id], [maThongBao], [cauHoi], [ngayBatDau], [hanChot], [trangThai], [tyLeTucSo], [ketQua], [tongCanHoLucMo]) VALUES (23, 34, N'đồng ý tăng tiền hồ bơi', CAST(N'2026-07-31T13:38:14.857' AS DateTime), CAST(N'2026-07-31T13:39:00.000' AS DateTime), N'DangMo', CAST(50.00 AS Decimal(5, 2)), NULL, 8)
SET IDENTITY_INSERT [dbo].[binhChon] OFF
GO
SET IDENTITY_INSERT [dbo].[canHo] ON 

INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (1, 1, N'0101', N'DangO', CAST(96.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (2, 1, N'0102', N'DangO', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (3, 1, N'0103', N'DangO', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (4, 1, N'0104', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (5, 1, N'0105', N'DangO', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (6, 1, N'0106', N'DangO', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (7, 1, N'0107', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (8, 1, N'0108', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (9, 2, N'0201', N'DangO', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (10, 2, N'0202', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (11, 2, N'0203', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (12, 2, N'0204', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (13, 2, N'0205', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (14, 2, N'0206', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (15, 2, N'0207', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (16, 2, N'0208', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (17, 3, N'0301', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (18, 3, N'0302', N'DangO', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (19, 3, N'0303', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (20, 3, N'0304', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (21, 3, N'0305', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (22, 3, N'0306', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (23, 3, N'0307', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (24, 3, N'0308', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (25, 4, N'0401', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (26, 4, N'0402', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (27, 4, N'0403', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (28, 4, N'0404', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (29, 4, N'0405', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (30, 4, N'0406', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (31, 4, N'0407', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (32, 4, N'0408', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (33, 5, N'0501', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (34, 5, N'0502', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (35, 5, N'0503', N'DangO', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (36, 5, N'0504', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (37, 5, N'0505', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (38, 5, N'0506', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (39, 5, N'0507', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (40, 5, N'0508', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (41, 6, N'0601', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (42, 6, N'0602', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (43, 6, N'0603', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (44, 6, N'0604', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (45, 6, N'0605', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (46, 6, N'0606', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (47, 6, N'0607', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (48, 6, N'0608', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (49, 7, N'0701', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (50, 7, N'0702', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (51, 7, N'0703', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (52, 7, N'0704', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (53, 7, N'0705', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (54, 7, N'0706', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (55, 7, N'0707', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (56, 7, N'0708', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (57, 8, N'0801', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (58, 8, N'0802', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (59, 8, N'0803', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (60, 8, N'0804', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (61, 8, N'0805', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (62, 8, N'0806', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (63, 8, N'0807', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (64, 8, N'0808', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (65, 9, N'0901', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (66, 9, N'0902', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (67, 9, N'0903', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (68, 9, N'0904', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (69, 9, N'0905', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (70, 9, N'0906', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (71, 9, N'0907', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (72, 9, N'0908', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (73, 10, N'1001', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (74, 10, N'1002', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (75, 10, N'1003', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (76, 10, N'1004', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (77, 10, N'1005', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (78, 10, N'1006', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (79, 10, N'1007', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (80, 10, N'1008', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (81, 11, N'1101', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (82, 11, N'1102', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (83, 11, N'1103', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (84, 11, N'1104', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (85, 11, N'1105', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (86, 11, N'1106', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (87, 11, N'1107', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (88, 11, N'1108', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (89, 12, N'1201', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (90, 12, N'1202', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (91, 12, N'1203', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (92, 12, N'1204', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (93, 12, N'1205', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (94, 12, N'1206', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (95, 12, N'1207', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (96, 12, N'1208', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (97, 13, N'1301', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (98, 13, N'1302', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (99, 13, N'1303', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (100, 13, N'1304', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (101, 13, N'1305', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (102, 13, N'1306', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (103, 13, N'1307', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (104, 13, N'1308', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (105, 14, N'1401', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (106, 14, N'1402', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (107, 14, N'1403', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (108, 14, N'1404', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (109, 14, N'1405', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (110, 14, N'1406', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (111, 14, N'1407', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (112, 14, N'1408', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (113, 15, N'1501', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (114, 15, N'1502', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (115, 15, N'1503', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (116, 15, N'1504', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (117, 15, N'1505', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (118, 15, N'1506', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (119, 15, N'1507', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (120, 15, N'1508', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (121, 16, N'1601', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (122, 16, N'1602', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (123, 16, N'1603', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (124, 16, N'1604', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (125, 16, N'1605', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (126, 16, N'1606', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (127, 16, N'1607', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (128, 16, N'1608', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (129, 17, N'1701', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (130, 17, N'1702', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (131, 17, N'1703', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (132, 17, N'1704', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (133, 17, N'1705', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (134, 17, N'1706', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (135, 17, N'1707', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (136, 17, N'1708', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (137, 18, N'1801', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (138, 18, N'1802', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (139, 18, N'1803', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (140, 18, N'1804', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (141, 18, N'1805', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (142, 18, N'1806', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (143, 18, N'1807', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (144, 18, N'1808', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (145, 19, N'1901', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (146, 19, N'1902', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (147, 19, N'1903', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (148, 19, N'1904', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (149, 19, N'1905', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (150, 19, N'1906', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (151, 19, N'1907', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (152, 19, N'1908', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (153, 20, N'2001', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (154, 20, N'2002', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (155, 20, N'2003', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (156, 20, N'2004', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (157, 20, N'2005', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (158, 20, N'2006', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (159, 20, N'2007', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (160, 20, N'2008', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (161, 21, N'2101', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (162, 21, N'2102', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (163, 21, N'2103', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (164, 21, N'2104', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (165, 21, N'2105', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (166, 21, N'2106', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (167, 21, N'2107', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (168, 21, N'2108', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (169, 22, N'2201', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (170, 22, N'2202', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (171, 22, N'2203', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (172, 22, N'2204', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (173, 22, N'2205', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (174, 22, N'2206', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (175, 22, N'2207', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (176, 22, N'2208', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (177, 23, N'2301', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (178, 23, N'2302', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (179, 23, N'2303', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (180, 23, N'2304', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (181, 23, N'2305', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (182, 23, N'2306', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (183, 23, N'2307', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (184, 23, N'2308', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (185, 24, N'2401', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (186, 24, N'2402', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (187, 24, N'2403', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (188, 24, N'2404', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (189, 24, N'2405', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (190, 24, N'2406', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (191, 24, N'2407', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (192, 24, N'2408', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (193, 25, N'2501', N'BaoTri', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (194, 25, N'2502', N'TrongChoThue', CAST(95.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (195, 25, N'2503', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (196, 25, N'2504', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (197, 25, N'2505', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (198, 25, N'2506', N'TrongChoThue', CAST(75.00 AS Decimal(6, 2)))
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (199, 25, N'2507', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[canHo] ([id], [soTang], [soPhong], [trangThai], [dienTich]) VALUES (200, 25, N'2508', N'TrongChoThue', CAST(60.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[canHo] OFF
GO
SET IDENTITY_INSERT [dbo].[chamCong] ON 

INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (1, 7, CAST(N'2026-07-22' AS Date), CAST(N'2026-07-22T06:00:00.000' AS DateTime), CAST(N'2026-07-22T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (2, 7, CAST(N'2026-07-23' AS Date), CAST(N'2026-07-23T14:00:00.000' AS DateTime), CAST(N'2026-07-23T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (3, 7, CAST(N'2026-07-24' AS Date), CAST(N'2026-07-24T22:00:00.000' AS DateTime), CAST(N'2026-07-25T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (4, 7, CAST(N'2026-07-25' AS Date), CAST(N'2026-07-25T06:00:00.000' AS DateTime), CAST(N'2026-07-25T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (5, 7, CAST(N'2026-07-26' AS Date), CAST(N'2026-07-26T14:00:00.000' AS DateTime), CAST(N'2026-07-26T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (6, 7, CAST(N'2026-07-27' AS Date), CAST(N'2026-07-27T22:00:00.000' AS DateTime), CAST(N'2026-07-28T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (7, 7, CAST(N'2026-07-28' AS Date), CAST(N'2026-07-28T06:00:00.000' AS DateTime), CAST(N'2026-07-28T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (8, 8, CAST(N'2026-07-22' AS Date), CAST(N'2026-07-22T14:00:00.000' AS DateTime), CAST(N'2026-07-22T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (9, 8, CAST(N'2026-07-23' AS Date), CAST(N'2026-07-23T22:00:00.000' AS DateTime), CAST(N'2026-07-24T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (10, 8, CAST(N'2026-07-24' AS Date), CAST(N'2026-07-24T06:00:00.000' AS DateTime), CAST(N'2026-07-24T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (11, 8, CAST(N'2026-07-25' AS Date), CAST(N'2026-07-25T14:00:00.000' AS DateTime), CAST(N'2026-07-25T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (12, 8, CAST(N'2026-07-26' AS Date), CAST(N'2026-07-26T22:00:00.000' AS DateTime), CAST(N'2026-07-27T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (13, 8, CAST(N'2026-07-27' AS Date), CAST(N'2026-07-27T06:00:00.000' AS DateTime), CAST(N'2026-07-27T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (14, 8, CAST(N'2026-07-28' AS Date), CAST(N'2026-07-28T14:00:00.000' AS DateTime), NULL, N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (15, 9, CAST(N'2026-07-22' AS Date), CAST(N'2026-07-22T22:00:00.000' AS DateTime), CAST(N'2026-07-23T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (16, 9, CAST(N'2026-07-23' AS Date), CAST(N'2026-07-23T06:00:00.000' AS DateTime), CAST(N'2026-07-23T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (17, 9, CAST(N'2026-07-24' AS Date), CAST(N'2026-07-24T14:00:00.000' AS DateTime), CAST(N'2026-07-24T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (18, 9, CAST(N'2026-07-25' AS Date), CAST(N'2026-07-25T22:00:00.000' AS DateTime), CAST(N'2026-07-26T06:00:00.000' AS DateTime), N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (19, 9, CAST(N'2026-07-26' AS Date), CAST(N'2026-07-26T06:00:00.000' AS DateTime), CAST(N'2026-07-26T14:00:00.000' AS DateTime), N'Sang')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (20, 9, CAST(N'2026-07-27' AS Date), CAST(N'2026-07-27T14:00:00.000' AS DateTime), CAST(N'2026-07-27T22:00:00.000' AS DateTime), N'Chieu')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (21, 9, CAST(N'2026-07-28' AS Date), CAST(N'2026-07-28T22:00:00.000' AS DateTime), NULL, N'Dem')
INSERT [dbo].[chamCong] ([id], [maNhanVien], [ngayLam], [gioVao], [gioRa], [caLam]) VALUES (22, 2, CAST(N'2026-08-04' AS Date), CAST(N'2026-08-04T21:52:32.940' AS DateTime), CAST(N'2026-08-04T21:52:49.207' AS DateTime), N'Sang')
SET IDENTITY_INSERT [dbo].[chamCong] OFF
GO
SET IDENTITY_INSERT [dbo].[chiSoTieuThu] ON 

INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (82, 1, N'Dien', 5, 2026, 1000, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (83, 1, N'Nuoc', 5, 2026, 100, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (84, 2, N'Dien', 5, 2026, 1200, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (85, 2, N'Nuoc', 5, 2026, 150, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (86, 6, N'Dien', 5, 2026, 800, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (87, 6, N'Nuoc', 5, 2026, 80, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (88, 9, N'Dien', 5, 2026, 1500, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (89, 9, N'Nuoc', 5, 2026, 200, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (90, 18, N'Dien', 5, 2026, 950, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (91, 18, N'Nuoc', 5, 2026, 90, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (92, 35, N'Dien', 5, 2026, 1100, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (93, 35, N'Nuoc', 5, 2026, 110, CAST(N'2026-05-31T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (94, 1, N'Dien', 6, 2026, 1250, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (95, 1, N'Nuoc', 6, 2026, 118, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (96, 2, N'Dien', 6, 2026, 1380, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (97, 2, N'Nuoc', 6, 2026, 165, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (98, 6, N'Dien', 6, 2026, 920, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (99, 6, N'Nuoc', 6, 2026, 90, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (100, 9, N'Dien', 6, 2026, 1820, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (101, 9, N'Nuoc', 6, 2026, 224, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (102, 18, N'Dien', 6, 2026, 1100, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (103, 18, N'Nuoc', 6, 2026, 102, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (104, 35, N'Dien', 6, 2026, 1210, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (105, 35, N'Nuoc', 6, 2026, 119, CAST(N'2026-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (106, 1, N'Dien', 7, 2026, 1400, CAST(N'2026-07-28T16:59:52.073' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (107, 1, N'Nuoc', 7, 2026, 139, CAST(N'2026-07-28T16:59:52.077' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (108, 2, N'Dien', 7, 2026, 1590, CAST(N'2026-07-28T16:59:52.083' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (109, 2, N'Nuoc', 7, 2026, 182, CAST(N'2026-07-28T16:59:52.083' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (110, 6, N'Dien', 7, 2026, 1060, CAST(N'2026-07-28T16:59:52.083' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (111, 6, N'Nuoc', 7, 2026, 101, CAST(N'2026-07-28T16:59:52.090' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (112, 9, N'Dien', 7, 2026, 2170, CAST(N'2026-07-28T16:59:52.090' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (113, 9, N'Nuoc', 7, 2026, 249, CAST(N'2026-07-28T16:59:52.097' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (114, 18, N'Dien', 7, 2026, 1260, CAST(N'2026-07-28T16:59:52.103' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (115, 18, N'Nuoc', 7, 2026, 115, CAST(N'2026-07-28T16:59:52.107' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (116, 35, N'Dien', 7, 2026, 1340, CAST(N'2026-07-28T16:59:52.107' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (117, 35, N'Nuoc', 7, 2026, 129, CAST(N'2026-07-28T16:59:52.107' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (118, 1, N'Dien', 8, 2026, 1780, CAST(N'2026-07-28T17:00:10.143' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (119, 1, N'Nuoc', 8, 2026, 157, CAST(N'2026-07-28T17:00:10.147' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (120, 2, N'Dien', 8, 2026, 1800, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (121, 2, N'Nuoc', 8, 2026, 204, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (122, 6, N'Dien', 8, 2026, 1210, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (123, 6, N'Nuoc', 8, 2026, 113, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (124, 9, N'Dien', 8, 2026, 2490, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (125, 9, N'Nuoc', 8, 2026, 274, CAST(N'2026-07-28T17:00:10.150' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (126, 18, N'Dien', 8, 2026, 1355, CAST(N'2026-07-28T17:00:10.163' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (127, 18, N'Nuoc', 8, 2026, 123, CAST(N'2026-07-28T17:00:10.167' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (128, 35, N'Dien', 8, 2026, 1520, CAST(N'2026-07-28T17:00:10.167' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (129, 35, N'Nuoc', 8, 2026, 144, CAST(N'2026-07-28T17:00:10.170' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (130, 1, N'Dien', 9, 2026, 1950, CAST(N'2026-07-28T17:36:02.973' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (131, 1, N'Nuoc', 9, 2026, 172, CAST(N'2026-07-28T17:36:02.997' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (132, 2, N'Dien', 9, 2026, 1990, CAST(N'2026-07-28T17:36:03.007' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (133, 2, N'Nuoc', 9, 2026, 226, CAST(N'2026-07-28T17:36:03.007' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (134, 6, N'Dien', 9, 2026, 1350, CAST(N'2026-07-28T17:36:03.010' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (135, 6, N'Nuoc', 9, 2026, 126, CAST(N'2026-07-28T17:36:03.013' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (136, 9, N'Dien', 9, 2026, 2700, CAST(N'2026-07-28T17:36:03.020' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (137, 9, N'Nuoc', 9, 2026, 296, CAST(N'2026-07-28T17:36:03.027' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (138, 18, N'Dien', 9, 2026, 1470, CAST(N'2026-07-28T17:36:03.030' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (139, 18, N'Nuoc', 9, 2026, 136, CAST(N'2026-07-28T17:36:03.037' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (140, 35, N'Dien', 9, 2026, 1690, CAST(N'2026-07-28T17:36:03.040' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (141, 35, N'Nuoc', 9, 2026, 160, CAST(N'2026-07-28T17:36:03.043' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (142, 1, N'Dien', 10, 2026, 2140, CAST(N'2026-07-31T11:35:22.637' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (143, 1, N'Nuoc', 10, 2026, 190, CAST(N'2026-07-31T11:35:22.650' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (144, 3, N'Dien', 10, 2026, 100, CAST(N'2026-07-31T11:35:22.650' AS DateTime))
INSERT [dbo].[chiSoTieuThu] ([id], [maCanHo], [loaiDichVu], [thang], [nam], [chiSo], [ngayGhi]) VALUES (145, 3, N'Nuoc', 10, 2026, 10, CAST(N'2026-07-31T11:35:22.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[chiSoTieuThu] OFF
GO
SET IDENTITY_INSERT [dbo].[chiTietHoaDon] ON 

INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (37, 40, N'Dien', 1000, 1250, CAST(589600.00 AS Decimal(15, 2)), CAST(250.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 50 kWh × 2,998đ = 149,900đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (38, 40, N'Nuoc', 100, 118, CAST(130200.00 AS Decimal(15, 2)), CAST(18.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 8 m3 × 7,900đ = 63,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (39, 41, N'Dien', 1200, 1380, CAST(392100.00 AS Decimal(15, 2)), CAST(180.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 80 kWh × 2,380đ = 190,400đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (40, 41, N'Nuoc', 150, 165, CAST(106500.00 AS Decimal(15, 2)), CAST(15.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 5 m3 × 7,900đ = 39,500đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (41, 42, N'Dien', 800, 920, CAST(249300.00 AS Decimal(15, 2)), CAST(120.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 20 kWh × 2,380đ = 47,600đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (42, 42, N'Nuoc', 80, 90, CAST(67000.00 AS Decimal(15, 2)), CAST(10.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (43, 43, N'Dien', 1500, 1820, CAST(799460.00 AS Decimal(15, 2)), CAST(320.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 120 kWh × 2,998đ = 359,760đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (44, 43, N'Nuoc', 200, 224, CAST(180400.00 AS Decimal(15, 2)), CAST(24.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 4 m3 × 8,600đ = 34,400đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (45, 44, N'Dien', 950, 1100, CAST(320700.00 AS Decimal(15, 2)), CAST(150.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 50 kWh × 2,380đ = 119,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (46, 44, N'Nuoc', 90, 102, CAST(82800.00 AS Decimal(15, 2)), CAST(12.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 2 m3 × 7,900đ = 15,800đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (47, 45, N'Dien', 1100, 1210, CAST(225500.00 AS Decimal(15, 2)), CAST(110.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 10 kWh × 2,380đ = 23,800đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (48, 45, N'Nuoc', 110, 119, CAST(60300.00 AS Decimal(15, 2)), CAST(9.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 9 m3 × 6,700đ = 60,300đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (49, 40, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (50, 41, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (51, 42, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (52, 43, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (53, 44, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (54, 45, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (55, 46, N'Dien', 1250, 1520, CAST(649560.00 AS Decimal(15, 2)), CAST(270.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 70 kWh × 2,998đ = 209,860đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (56, 46, N'Nuoc', 118, 139, CAST(154600.00 AS Decimal(15, 2)), CAST(21.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 1 m3 × 8,600đ = 8,600đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (57, 47, N'Dien', 1380, 1590, CAST(469680.00 AS Decimal(15, 2)), CAST(210.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 10 kWh × 2,998đ = 29,980đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (58, 47, N'Nuoc', 165, 182, CAST(122300.00 AS Decimal(15, 2)), CAST(17.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 7 m3 × 7,900đ = 55,300đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (59, 48, N'Dien', 920, 1060, CAST(296900.00 AS Decimal(15, 2)), CAST(140.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 40 kWh × 2,380đ = 95,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (60, 48, N'Nuoc', 90, 101, CAST(74900.00 AS Decimal(15, 2)), CAST(11.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 1 m3 × 7,900đ = 7,900đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (61, 49, N'Dien', 1820, 2170, CAST(889400.00 AS Decimal(15, 2)), CAST(350.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 150 kWh × 2,998đ = 449,700đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (62, 49, N'Nuoc', 224, 249, CAST(189000.00 AS Decimal(15, 2)), CAST(25.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 5 m3 × 8,600đ = 43,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (63, 50, N'Dien', 1100, 1260, CAST(344500.00 AS Decimal(15, 2)), CAST(160.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 60 kWh × 2,380đ = 142,800đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (64, 50, N'Nuoc', 102, 115, CAST(90700.00 AS Decimal(15, 2)), CAST(13.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 3 m3 × 7,900đ = 23,700đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (65, 51, N'Dien', 1210, 1340, CAST(273100.00 AS Decimal(15, 2)), CAST(130.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 30 kWh × 2,380đ = 71,400đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (66, 51, N'Nuoc', 119, 129, CAST(67000.00 AS Decimal(15, 2)), CAST(10.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (67, 46, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (68, 47, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (69, 48, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (70, 49, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (71, 50, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (72, 51, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (73, 52, N'Dien', 1400, 1780, CAST(979340.00 AS Decimal(15, 2)), CAST(380.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 180 kWh × 2,998đ = 539,640đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (74, 52, N'Nuoc', 139, 157, CAST(130200.00 AS Decimal(15, 2)), CAST(18.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 8 m3 × 7,900đ = 63,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (75, 53, N'Dien', 1590, 1800, CAST(469680.00 AS Decimal(15, 2)), CAST(210.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 10 kWh × 2,998đ = 29,980đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (76, 53, N'Nuoc', 182, 204, CAST(163200.00 AS Decimal(15, 2)), CAST(22.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 2 m3 × 8,600đ = 17,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (77, 54, N'Dien', 1060, 1210, CAST(320700.00 AS Decimal(15, 2)), CAST(150.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 50 kWh × 2,380đ = 119,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (78, 54, N'Nuoc', 101, 113, CAST(82800.00 AS Decimal(15, 2)), CAST(12.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 2 m3 × 7,900đ = 15,800đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (79, 55, N'Dien', 2170, 2490, CAST(799460.00 AS Decimal(15, 2)), CAST(320.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 120 kWh × 2,998đ = 359,760đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (80, 55, N'Nuoc', 249, 274, CAST(189000.00 AS Decimal(15, 2)), CAST(25.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 5 m3 × 8,600đ = 43,000đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (81, 56, N'Dien', 1260, 1355, CAST(191450.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 45 kWh × 2,050đ = 92,250đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (82, 56, N'Nuoc', 115, 123, CAST(53600.00 AS Decimal(15, 2)), CAST(8.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 8 m3 × 6,700đ = 53,600đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (83, 57, N'Dien', 1340, 1520, CAST(392100.00 AS Decimal(15, 2)), CAST(180.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 80 kWh × 2,380đ = 190,400đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (84, 57, N'Nuoc', 129, 144, CAST(106500.00 AS Decimal(15, 2)), CAST(15.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 5 m3 × 7,900đ = 39,500đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (85, 52, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (86, 53, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (87, 54, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (88, 55, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (89, 56, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (90, 57, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (115, 70, N'Dien', 1780, 1950, CAST(368300.00 AS Decimal(15, 2)), CAST(170.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 70 kWh × 2,380đ = 166,600đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (116, 70, N'Nuoc', 157, 172, CAST(106500.00 AS Decimal(15, 2)), CAST(15.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 5 m3 × 7,900đ = 39,500đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (117, 71, N'Dien', 1800, 1990, CAST(415900.00 AS Decimal(15, 2)), CAST(190.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 90 kWh × 2,380đ = 214,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (118, 71, N'Nuoc', 204, 226, CAST(163200.00 AS Decimal(15, 2)), CAST(22.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 2 m3 × 8,600đ = 17,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (119, 72, N'Dien', 1210, 1350, CAST(296900.00 AS Decimal(15, 2)), CAST(140.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 40 kWh × 2,380đ = 95,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (120, 72, N'Nuoc', 113, 126, CAST(90700.00 AS Decimal(15, 2)), CAST(13.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 3 m3 × 7,900đ = 23,700đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (121, 73, N'Dien', 2490, 2700, CAST(469680.00 AS Decimal(15, 2)), CAST(210.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 100 kWh × 2,380đ = 238,000đ; Bậc 4: 10 kWh × 2,998đ = 29,980đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (122, 73, N'Nuoc', 274, 296, CAST(163200.00 AS Decimal(15, 2)), CAST(22.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 10 m3 × 7,900đ = 79,000đ; Bậc 3: 2 m3 × 8,600đ = 17,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (123, 74, N'Dien', 1355, 1470, CAST(237400.00 AS Decimal(15, 2)), CAST(115.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 15 kWh × 2,380đ = 35,700đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (124, 74, N'Nuoc', 123, 136, CAST(90700.00 AS Decimal(15, 2)), CAST(13.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 3 m3 × 7,900đ = 23,700đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (125, 75, N'Dien', 1520, 1690, CAST(368300.00 AS Decimal(15, 2)), CAST(170.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 70 kWh × 2,380đ = 166,600đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (126, 75, N'Nuoc', 144, 160, CAST(114400.00 AS Decimal(15, 2)), CAST(16.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 6 m3 × 7,900đ = 47,400đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (127, 70, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (128, 71, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (129, 72, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (130, 73, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (131, 74, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (132, 75, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (133, 76, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (134, 77, N'Dien', 1950, 2140, CAST(415900.00 AS Decimal(15, 2)), CAST(190.00 AS Decimal(10, 2)), N'kWh', NULL, N'Bậc 1: 50 kWh × 1,984đ = 99,200đ; Bậc 2: 50 kWh × 2,050đ = 102,500đ; Bậc 3: 90 kWh × 2,380đ = 214,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (135, 77, N'Nuoc', 172, 190, CAST(130200.00 AS Decimal(15, 2)), CAST(18.00 AS Decimal(10, 2)), N'm3', NULL, N'Bậc 1: 10 m3 × 6,700đ = 67,000đ; Bậc 2: 8 m3 × 7,900đ = 63,200đ')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (136, 79, N'Dien', 100, 100, CAST(0.00 AS Decimal(15, 2)), CAST(0.00 AS Decimal(10, 2)), N'kWh', NULL, N'Kỳ đầu tiên, chưa có chỉ số kỳ trước để đối chiếu')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (137, 79, N'Nuoc', 10, 10, CAST(0.00 AS Decimal(15, 2)), CAST(0.00 AS Decimal(10, 2)), N'm3', NULL, N'Kỳ đầu tiên, chưa có chỉ số kỳ trước để đối chiếu')
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (138, 77, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (139, 78, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (140, 79, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (141, 80, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (142, 81, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (143, 82, N'PhiQuanLy', NULL, NULL, CAST(760000.00 AS Decimal(15, 2)), CAST(95.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (144, 83, N'PhiQuanLy', NULL, NULL, CAST(600000.00 AS Decimal(15, 2)), CAST(75.00 AS Decimal(10, 2)), N'm2', CAST(8000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (145, 77, N'GuiXeOTo', NULL, NULL, CAST(3600000.00 AS Decimal(15, 2)), CAST(3.00 AS Decimal(10, 2)), N'xe', CAST(1200000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (146, 77, N'GuiXeMay', NULL, NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(100000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (147, 78, N'GuiXeOTo', NULL, NULL, CAST(1200000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(1200000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (148, 78, N'GuiXeMay', NULL, NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(100000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (149, 80, N'GuiXeOTo', NULL, NULL, CAST(1200000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(1200000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (150, 81, N'GuiXeMay', NULL, NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(100000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (151, 82, N'GuiXeOTo', NULL, NULL, CAST(1200000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(1200000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (152, 83, N'GuiXeMay', NULL, NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(100000.00 AS Decimal(15, 2)), NULL)
INSERT [dbo].[chiTietHoaDon] ([id], [maHoaDon], [loaiDichVu], [chiSoCu], [chiSoMoi], [thanhTien], [soLuong], [donViTinh], [donGia], [dienGiai]) VALUES (153, 83, N'GuiXeMay', NULL, NULL, CAST(100000.00 AS Decimal(15, 2)), CAST(1.00 AS Decimal(10, 2)), N'xe', CAST(100000.00 AS Decimal(15, 2)), NULL)
SET IDENTITY_INSERT [dbo].[chiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[cuDan] ON 

INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (2, 1, 11, N'Trần Văn An', N'0909123456', N'an.tran@cudan.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (3, 1, NULL, N'Trần Lê Nguyễn', N'099999999', N'nguyengay@gmail.com', N'KhachThue', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (8, 2, 15, N'Chủ hộ căn 0102', N'0901000102', N'p102@polybuilding.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (9, 9, 19, N'Chủ hộ căn 0201', N'0901000201', N'p201@polybuilding.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (10, 18, 20, N'Chủ hộ căn 0302', N'0901000302', N'p302@polybuilding.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (11, 35, 21, N'Chủ hộ căn 0503', N'0901000503', N'p503@polybuilding.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (12, 6, 22, N'Chủ hộ căn 0106', N'0901000106', N'p106@polybuilding.vn', N'ChuHo', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (20, 2, NULL, N'fgewsfsdefs', N'287278178277', NULL, N'KhachThue', N'DaChuyenDi', CAST(N'2026-07-29T00:00:00.0000000' AS DateTime2), NULL, N'741785727221')
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (21, 3, NULL, N'Nguyễn Văn Tèo', N'05856369558', NULL, N'ChuHo', N'DaChuyenDi', CAST(N'2026-07-29T00:00:00.0000000' AS DateTime2), NULL, N'717474755555')
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (23, 3, 28, N'Hà Trần Hải Đăng', N'', N'', N'KhachThue', N'DangO', NULL, NULL, NULL)
INSERT [dbo].[cuDan] ([id], [maCanHo], [maTaiKhoan], [hoTen], [soDienThoai], [email], [loaiCuDan], [trangThai], [ngayChuyenDen], [ngayChuyenDi], [cccd]) VALUES (24, 5, 30, N'Nguyễn Anh Việt', N'', N'', N'ChuHo', N'DangO', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[cuDan] OFF
GO
INSERT [dbo].[danhMucBoPhan] ([maBoPhan], [tenBoPhan]) VALUES (N'BanQuanLy', N'Ban quản lý')
INSERT [dbo].[danhMucBoPhan] ([maBoPhan], [tenBoPhan]) VALUES (N'BaoVe', N'Bảo vệ')
INSERT [dbo].[danhMucBoPhan] ([maBoPhan], [tenBoPhan]) VALUES (N'KeToan', N'Kế toán')
INSERT [dbo].[danhMucBoPhan] ([maBoPhan], [tenBoPhan]) VALUES (N'KyThuat', N'Kỹ thuật')
INSERT [dbo].[danhMucBoPhan] ([maBoPhan], [tenBoPhan]) VALUES (N'LeTan', N'Lễ tân')
GO
SET IDENTITY_INSERT [dbo].[danhMucTienIch] ON 

INSERT [dbo].[danhMucTienIch] ([id], [tenTienIch], [moTa], [sucChua], [gioMoCua], [gioDongCua], [giaThueMacDinh], [trangThaiHoatDong], [hinhAnh]) VALUES (1, N'Hồ bơi', N'Hồ bơi ngoài trời tầng 3', 40, CAST(N'06:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(50000.00 AS Decimal(15, 2)), N'HoatDong', NULL)
INSERT [dbo].[danhMucTienIch] ([id], [tenTienIch], [moTa], [sucChua], [gioMoCua], [gioDongCua], [giaThueMacDinh], [trangThaiHoatDong], [hinhAnh]) VALUES (2, N'Phòng Gym', N'Phòng tập thể hình tầng 3', 25, CAST(N'05:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(30000.00 AS Decimal(15, 2)), N'HoatDong', NULL)
INSERT [dbo].[danhMucTienIch] ([id], [tenTienIch], [moTa], [sucChua], [gioMoCua], [gioDongCua], [giaThueMacDinh], [trangThaiHoatDong], [hinhAnh]) VALUES (3, N'Phòng sinh hoạt cộng đồng', N'Phòng họp mặt, tổ chức sự kiện cho cư dân', 60, CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(100000.00 AS Decimal(15, 2)), N'HoatDong', NULL)
INSERT [dbo].[danhMucTienIch] ([id], [tenTienIch], [moTa], [sucChua], [gioMoCua], [gioDongCua], [giaThueMacDinh], [trangThaiHoatDong], [hinhAnh]) VALUES (4, N'Sân BBQ', N'Sân nướng ngoài trời tầng thượng', 30, CAST(N'16:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(150000.00 AS Decimal(15, 2)), N'HoatDong', NULL)
INSERT [dbo].[danhMucTienIch] ([id], [tenTienIch], [moTa], [sucChua], [gioMoCua], [gioDongCua], [giaThueMacDinh], [trangThaiHoatDong], [hinhAnh]) VALUES (5, N'Phòng họp', N'Phòng họp nhỏ dành cho cư dân', 15, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), CAST(80000.00 AS Decimal(15, 2)), N'HoatDong', NULL)
SET IDENTITY_INSERT [dbo].[danhMucTienIch] OFF
GO
INSERT [dbo].[danhMucVaiTro] ([maVaiTro], [tenVaiTro]) VALUES (N'BQL', N'Ban Quan Ly')
INSERT [dbo].[danhMucVaiTro] ([maVaiTro], [tenVaiTro]) VALUES (N'CD', N'Cu Dan')
INSERT [dbo].[danhMucVaiTro] ([maVaiTro], [tenVaiTro]) VALUES (N'NV', N'Nhan Vien')
GO
SET IDENTITY_INSERT [dbo].[datLichTienIch] ON 

INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (2, 1, 2, 1, CAST(N'2026-07-30' AS Date), N'08:00-09:00', CAST(50000.00 AS Decimal(15, 2)), N'DaHuy', CAST(N'2026-07-28T19:07:32.203' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (3, 2, 8, 2, CAST(N'2026-07-29' AS Date), N'10:00-11:00', CAST(30000.00 AS Decimal(15, 2)), N'ChoDuyet', CAST(N'2026-07-28T19:26:57.167' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (5, 1, 2, 1, CAST(N'2026-07-29' AS Date), N'16:00-17:00', CAST(50000.00 AS Decimal(15, 2)), N'ChoDuyet', CAST(N'2026-07-28T19:49:58.023' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (6, 2, 8, 5, CAST(N'2026-07-28' AS Date), N'18:00-19:00', CAST(80000.00 AS Decimal(15, 2)), N'ChoDuyet', CAST(N'2026-07-28T19:50:21.760' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (7, 2, 8, 4, CAST(N'2026-07-30' AS Date), N'18:00-19:00', CAST(150000.00 AS Decimal(15, 2)), N'DaDuyet', CAST(N'2026-07-28T19:50:33.407' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (8, 1, 2, 2, CAST(N'2026-07-29' AS Date), N'13:00-14:00', CAST(30000.00 AS Decimal(15, 2)), N'DaHuy', CAST(N'2026-07-28T19:54:24.617' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (9, 1, 2, 2, CAST(N'2026-07-30' AS Date), N'13:00-14:00', CAST(30000.00 AS Decimal(15, 2)), N'DaHuy', CAST(N'2026-07-28T23:24:11.253' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (12, 1, NULL, 1, CAST(N'2026-07-29' AS Date), N'14:00-15:00', CAST(50000.00 AS Decimal(15, 2)), N'HoanThanh', CAST(N'2026-07-29T11:33:40.573' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (13, 2, NULL, 1, CAST(N'2026-07-29' AS Date), N'15:00-16:00', CAST(50000.00 AS Decimal(15, 2)), N'DaHuy', CAST(N'2026-07-29T11:33:40.580' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (14, 1, 2, 1, CAST(N'2026-07-31' AS Date), N'16:00-17:00', CAST(50000.00 AS Decimal(15, 2)), N'ChoDuyet', CAST(N'2026-07-31T13:17:23.980' AS DateTime))
INSERT [dbo].[datLichTienIch] ([id], [maCanHo], [maCuDan], [maTienIch], [ngayDat], [khungGio], [giaTien], [trangThai], [ngayTao]) VALUES (15, 18, 10, 2, CAST(N'2026-08-10' AS Date), N'10:00-11:00', CAST(30000.00 AS Decimal(15, 2)), N'ChoDuyet', CAST(N'2026-08-05T13:38:56.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[datLichTienIch] OFF
GO
SET IDENTITY_INSERT [dbo].[giaoDichThanhToan] ON 

INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (1, 46, 2, CAST(1564160.00 AS Decimal(15, 2)), N'TienMat', N'TM-TEST-001', N'ThanhCong', CAST(N'2026-07-28T17:19:30.633' AS DateTime), CAST(N'2026-07-28T17:19:30.633' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (2, 47, 8, CAST(1351980.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'FT2607289999', N'ThanhCong', CAST(N'2026-07-28T17:19:30.703' AS DateTime), CAST(N'2026-07-28T17:19:30.723' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (3, 52, 2, CAST(1869540.00 AS Decimal(15, 2)), N'TienMat', N'', N'ThanhCong', CAST(N'2026-07-28T17:51:01.700' AS DateTime), CAST(N'2026-07-28T17:51:01.700' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (4, 53, 8, CAST(1392880.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-28T17:54:02.740' AS DateTime), CAST(N'2026-07-28T17:54:30.240' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (5, 54, 12, CAST(500000.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-28T17:58:34.633' AS DateTime), CAST(N'2026-07-28T17:59:00.397' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (6, 54, 12, CAST(503500.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-28T17:59:52.380' AS DateTime), CAST(N'2026-07-28T17:59:54.870' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (7, 55, 9, CAST(1748460.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-28T18:03:45.237' AS DateTime), CAST(N'2026-07-28T18:09:42.140' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (8, 56, 10, CAST(1005050.00 AS Decimal(15, 2)), N'QR', N'', N'ThatBai', CAST(N'2026-07-28T18:04:40.577' AS DateTime), CAST(N'2026-07-28T18:04:50.263' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (9, 56, 10, CAST(1005050.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-28T18:10:43.180' AS DateTime), CAST(N'2026-07-28T18:10:50.550' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (10, 40, 2, CAST(1479800.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (11, 41, 8, CAST(1258600.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (12, 42, 12, CAST(916300.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (13, 43, 9, CAST(1739860.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (14, 44, 10, CAST(1163500.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (15, 45, 11, CAST(885800.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (16, 51, 11, CAST(940100.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThatBai', CAST(N'2026-07-28T21:09:17.223' AS DateTime), CAST(N'2026-07-28T21:09:35.713' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (19, 48, 12, CAST(971800.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThatBai', CAST(N'2026-07-28T23:26:34.793' AS DateTime), CAST(N'2026-07-28T23:26:51.973' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (22, 71, 8, CAST(1339100.00 AS Decimal(15, 2)), N'QR', N'PB0102T92026-22', N'ThanhCong', CAST(N'2026-07-29T10:58:43.410' AS DateTime), CAST(N'2026-07-29T14:01:47.117' AS DateTime), N'FT26073312347', N'Đối soát tự động từ sao kê ngày 29/07/2026')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (23, 75, 11, CAST(1082700.00 AS Decimal(15, 2)), N'QR', N'PB0503T92026-23', N'ThanhCong', CAST(N'2026-07-29T11:01:05.810' AS DateTime), CAST(N'2026-07-29T11:06:01.257' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (24, 57, 11, CAST(1098600.00 AS Decimal(15, 2)), N'QR', N'PB0503T82026-24', N'ThanhCong', CAST(N'2026-07-29T11:01:16.007' AS DateTime), CAST(N'2026-07-29T14:01:47.117' AS DateTime), N'FT26073312346', N'Đối soát tự động từ sao kê ngày 29/07/2026')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (25, 51, 11, CAST(940100.00 AS Decimal(15, 2)), N'QR', N'PB0503T72026-25', N'ThanhCong', CAST(N'2026-07-29T13:45:09.200' AS DateTime), CAST(N'2026-07-29T14:01:47.117' AS DateTime), N'FT26073312345', N'Đối soát tự động từ sao kê ngày 29/07/2026')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (26, 73, 9, CAST(1392880.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThatBai', CAST(N'2026-07-29T14:06:43.600' AS DateTime), CAST(N'2026-07-29T14:16:48.347' AS DateTime), NULL, N'Hủy do trùng lặp — hóa đơn đã được thanh toán bởi giao dịch trước')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (27, 73, 9, CAST(1392880.00 AS Decimal(15, 2)), N'QR', N'PB0201T92026-27', N'ThanhCong', CAST(N'2026-07-29T14:07:26.987' AS DateTime), CAST(N'2026-07-29T14:11:50.287' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (28, 48, 12, CAST(971800.00 AS Decimal(15, 2)), N'QR', N'PB0106T72026-28', N'ThatBai', CAST(N'2026-07-29T14:19:52.997' AS DateTime), CAST(N'2026-07-29T14:19:53.090' AS DateTime), NULL, N'Hủy do trùng lặp — hóa đơn đã được thanh toán bởi giao dịch trước')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (29, 48, 12, CAST(971800.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-29T14:19:53.057' AS DateTime), CAST(N'2026-07-29T14:19:53.057' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (30, 49, 9, CAST(1838400.00 AS Decimal(15, 2)), N'QR', N'PB0201T72026-30', N'ThatBai', CAST(N'2026-07-29T14:20:09.377' AS DateTime), CAST(N'2026-07-29T14:20:09.510' AS DateTime), NULL, N'Hủy do trùng lặp — hóa đơn đã được thanh toán bởi giao dịch trước')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (31, 49, 9, CAST(1838400.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-29T14:20:09.467' AS DateTime), CAST(N'2026-07-29T14:20:09.467' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (32, 50, 10, CAST(1195200.00 AS Decimal(15, 2)), N'QR', N'PB0302T72026-32', N'ThatBai', CAST(N'2026-07-29T14:20:28.193' AS DateTime), CAST(N'2026-07-29T14:20:28.350' AS DateTime), NULL, N'Hủy do trùng lặp — hóa đơn đã được thanh toán bởi giao dịch trước')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (33, 50, 10, CAST(1195200.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-29T14:20:28.300' AS DateTime), CAST(N'2026-07-29T14:20:28.300' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (34, 72, 12, CAST(987600.00 AS Decimal(15, 2)), N'QR', N'PB0106T92026-34', N'ThatBai', CAST(N'2026-07-29T14:21:20.210' AS DateTime), NULL, NULL, N'T? d?ng h?y — hóa don dã thanh toán d?')
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (35, 72, 12, CAST(987600.00 AS Decimal(15, 2)), N'TienMat', NULL, N'ThanhCong', CAST(N'2026-07-29T14:21:20.330' AS DateTime), CAST(N'2026-07-29T14:21:20.330' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (36, 74, 10, CAST(1088100.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThatBai', CAST(N'2026-07-29T14:39:44.410' AS DateTime), CAST(N'2026-07-29T14:39:52.137' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (37, 74, 10, CAST(500000.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-29T14:40:06.867' AS DateTime), CAST(N'2026-07-29T14:40:13.737' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (38, 77, 2, CAST(5006100.00 AS Decimal(15, 2)), N'QR', N'PB0101T102026-38', N'ChoXacNhan', CAST(N'2026-07-31T13:16:29.693' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (39, 77, 2, CAST(3000000.00 AS Decimal(15, 2)), N'ChuyenKhoan', N'', N'ThanhCong', CAST(N'2026-07-31T14:05:09.640' AS DateTime), CAST(N'2026-07-31T14:05:19.177' AS DateTime), NULL, NULL)
INSERT [dbo].[giaoDichThanhToan] ([id], [maHoaDon], [maCuDan], [soTien], [phuongThuc], [maGiaoDichNganHang], [trangThai], [thoiGianTao], [thoiGianXacNhan], [soThamChieuSaoKe], [ghiChuDoiSoat]) VALUES (40, 82, 10, CAST(1960000.00 AS Decimal(15, 2)), N'QR', N'PB0302T102026-40', N'ChoXacNhan', CAST(N'2026-08-05T13:38:05.893' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[giaoDichThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[hoaDon] ON 

INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (40, 1, 6, 2026, CAST(1479800.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (41, 2, 6, 2026, CAST(1258600.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (42, 6, 6, 2026, CAST(916300.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (43, 9, 6, 2026, CAST(1739860.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (44, 18, 6, 2026, CAST(1163500.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (45, 35, 6, 2026, CAST(885800.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (46, 1, 7, 2026, CAST(1564160.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (47, 2, 7, 2026, CAST(1351980.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (48, 6, 7, 2026, CAST(971800.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (49, 9, 7, 2026, CAST(1838400.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (50, 18, 7, 2026, CAST(1195200.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (51, 35, 7, 2026, CAST(940100.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (52, 1, 8, 2026, CAST(1869540.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (53, 2, 8, 2026, CAST(1392880.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (54, 6, 8, 2026, CAST(1003500.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (55, 9, 8, 2026, CAST(1748460.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (56, 18, 8, 2026, CAST(1005050.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (57, 35, 8, 2026, CAST(1098600.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (70, 1, 9, 2026, CAST(1234800.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (71, 2, 9, 2026, CAST(1339100.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (72, 6, 9, 2026, CAST(987600.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (73, 9, 9, 2026, CAST(1392880.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (74, 18, 9, 2026, CAST(1088100.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (75, 35, 9, 2026, CAST(1082700.00 AS Decimal(15, 2)), N'DaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (76, 3, 7, 2026, CAST(600000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (77, 1, 10, 2026, CAST(5006100.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (78, 2, 10, 2026, CAST(2060000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (79, 3, 10, 2026, CAST(600000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (80, 6, 10, 2026, CAST(1800000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (81, 9, 10, 2026, CAST(860000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (82, 18, 10, 2026, CAST(1960000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
INSERT [dbo].[hoaDon] ([id], [maCanHo], [thang], [nam], [tongTien], [trangThaiThanhToan]) VALUES (83, 35, 10, 2026, CAST(800000.00 AS Decimal(15, 2)), N'ChuaThanhToan')
SET IDENTITY_INSERT [dbo].[hoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[lichSuXuLySuCo] ON 

INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (9, 4, N'MoiTiepNhan', N'Cư dân gửi yêu cầu sửa chữa.', NULL, CAST(N'2026-07-11T14:20:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (10, 4, N'DangXuLy', N'Kỹ thuật viên Hoàng Văn Nam tiếp nhận sửa chữa bồn nước.', 5, CAST(N'2026-07-11T15:30:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (11, 5, N'MoiTiepNhan', N'Cư dân phản ánh đèn hỏng.', NULL, CAST(N'2026-07-05T09:10:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (12, 5, N'DangXuLy', N'Kỹ thuật viên Vũ Văn Đức đến kiểm tra và thay bóng mới.', 6, CAST(N'2026-07-05T09:40:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (13, 5, N'HoanThanh', N'Đã hoàn thành thay bóng đèn LED mới. Cư dân xác nhận hoạt động bình thường.', 6, CAST(N'2026-07-05T10:30:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (14, 6, N'MoiTiepNhan', N'Cư dân báo cửa thoát hiểm kẹt bản lề.', NULL, CAST(N'2026-06-28T19:45:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (15, 6, N'DangXuLy', N'Kỹ thuật viên Hoàng Văn Nam tra dầu nhớt và vệ sinh rãnh bản lề.', 5, CAST(N'2026-06-29T08:00:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (16, 6, N'HoanThanh', N'Cửa đã đóng mở nhẹ nhàng, hoàn tất bảo dưỡng bản lề.', 5, CAST(N'2026-06-29T08:30:00.000' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (17, 12, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T09:57:32.963' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (22, 15, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T10:06:23.497' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (23, 16, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T10:07:37.223' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (24, 16, N'Huy', N'Cư dân hủy phản ánh', NULL, CAST(N'2026-07-28T10:08:08.300' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (25, 8, N'Huy', N'Cư dân hủy phản ánh', NULL, CAST(N'2026-07-28T10:23:06.837' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (26, 17, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T10:24:09.793' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (27, 17, N'Huy', N'Cư dân hủy phản ánh', NULL, CAST(N'2026-07-28T10:24:12.883' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (28, 9, N'DaTiepNhan', N'Lễ tân Lê Thị Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-28T10:32:02.307' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (29, 9, N'DaPhanCong', N'Giao viec cho nhan vien 5, uu tien Cao', 5, CAST(N'2026-07-28T10:32:02.417' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (31, 19, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T10:34:54.593' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (32, 19, N'DaTiepNhan', N'Lễ tân Le Thi Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-28T10:42:03.943' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (33, 12, N'DaTiepNhan', N'Lễ tân Le Thi Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-28T10:42:12.057' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (34, 15, N'DaTiepNhan', N'Lễ tân Le Thi Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-28T10:42:14.430' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (35, 4, N'DaPhanCong', N'Giao viec cho nhan vien 5, uu tien TrungBinh', 5, CAST(N'2026-07-28T10:43:13.237' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (36, 19, N'DaPhanCong', N'Giao viec cho nhan vien 6, uu tien Cao', 6, CAST(N'2026-07-28T10:43:28.503' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (37, 12, N'DaPhanCong', N'Giao viec cho nhan vien 5, uu tien TrungBinh', 5, CAST(N'2026-07-28T10:43:45.467' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (38, 15, N'DaPhanCong', N'Giao viec cho nhan vien 6, uu tien TrungBinh', 6, CAST(N'2026-07-28T10:43:52.217' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (39, 4, N'DangXuLy', N'Đã khảo sát, vòi nước bị vỡ ren vặn, đang chuẩn bị linh kiện thay thế.', 5, CAST(N'2026-07-28T11:06:21.977' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (40, 4, N'HoanThanh', N'Đã thay mới van xả bồn rửa, đã thử xả nước hoạt động bình thường.', 5, CAST(N'2026-07-28T11:06:22.093' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (41, 9, N'HoanThanh', N'xong', 5, CAST(N'2026-07-28T11:19:38.433' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (42, 20, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-28T16:43:20.513' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (43, 20, N'DaTiepNhan', N'Lễ tân Le Thi Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-28T16:44:08.387' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (44, 20, N'DaPhanCong', N'Giao viec cho nhan vien 5, uu tien Cao', 5, CAST(N'2026-07-28T16:44:26.467' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (45, 20, N'HoanThanh', N'Đã xử lý xong, kèm ảnh nghiệm thu', 5, CAST(N'2026-07-29T14:25:11.693' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (46, 21, N'MoiTiepNhan', N'Cư dân gửi phản ánh', NULL, CAST(N'2026-07-31T13:15:12.960' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (47, 21, N'DaTiepNhan', N'Lễ tân Lê Thị Hoa tiếp nhận phản ánh', 2, CAST(N'2026-07-31T13:45:28.763' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (48, 21, N'DaPhanCong', N'Giao viec cho nhan vien 5, uu tien Cao', 5, CAST(N'2026-07-31T13:45:50.383' AS DateTime))
INSERT [dbo].[lichSuXuLySuCo] ([id], [maPhanAnh], [trangThai], [ghiChu], [maNhanVien], [thoiGian]) VALUES (49, 21, N'HoanThanh', N'Đã xử lý xong, kèm ảnh nghiệm thu', 5, CAST(N'2026-07-31T13:56:03.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[lichSuXuLySuCo] OFF
GO
SET IDENTITY_INSERT [dbo].[nhanVien] ON 

INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (1, 1, N'Nguyễn Văn Quân', N'0901000001', N'bql01@chungcu.vn', N'BanQuanLy', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (2, 2, N'Lê Thị Hoa', N'0901000002', N'letan01@chungcu.vn', N'LeTan', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (3, 3, N'Trần Thị Mai', N'0901000003', N'letan02@chungcu.vn', N'LeTan', CAST(N'2023-02-15' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (4, 4, N'Phạm Thị Linh', N'0901000004', N'ketoan01@chungcu.vn', N'KeToan', CAST(N'2023-01-10' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (5, 5, N'Hoàng Văn Nam', N'0901000005', N'kythuat01@chungcu.vn', N'KyThuat', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (6, 6, N'Vũ Văn Đức', N'0901000006', N'kythuat02@chungcu.vn', N'KyThuat', CAST(N'2023-03-15' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (7, 7, N'Nguyễn Văn Hùng', N'0901000007', N'baove01@chungcu.vn', N'BaoVe', CAST(N'2023-01-20' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (8, 8, N'Lê Văn Tuấn', N'0901000008', N'baove02@chungcu.vn', N'BaoVe', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (9, 9, N'Đinh Văn Sơn', N'0901000009', N'baove03@chungcu.vn', N'BaoVe', CAST(N'2023-02-20' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (10, NULL, N'Nguyễn Admin', N'0901234567', N'admin@polybuilding.vn', N'BanQuanLy', NULL)
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (11, 13, N'Trần Thị Lan', N'0988776655', N'lan.tran@polybuilding.vn', N'KeToan', CAST(N'2023-01-15' AS Date))
INSERT [dbo].[nhanVien] ([id], [maTaiKhoan], [hoTen], [soDienThoai], [email], [boPhan], [ngayVaoLam]) VALUES (12, 12, N'Nguyễn Hoài Nam', N'0977665544', N'nam.nguyen@polybuilding.vn', N'KyThuat', CAST(N'2023-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[nhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[nhatKyCaTruc] ON 

INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (1, 7, N'Sang', CAST(N'2026-07-22' AS Date), N'Tuần tra định kỳ sảnh chính và tầng hầm, không phát hiện bất thường.', N'Bàn giao bộ đàm và chìa khóa phòng kỹ thuật', 8, CAST(N'2026-07-22T14:05:00.000' AS DateTime))
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (2, 8, N'Chieu', CAST(N'2026-07-23' AS Date), N'Tình hình an ninh ca chiều ổn định, hỗ trợ cư dân nhận bưu kiện.', N'Bàn giao sổ trực ca chiều', 9, CAST(N'2026-07-23T22:10:00.000' AS DateTime))
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (3, 9, N'Dem', CAST(N'2026-07-24' AS Date), N'Ca đêm êm sảnh, hệ thống camera hoạt động tốt.', N'Cửa sảnh chính đã khóa an toàn', 7, CAST(N'2026-07-25T06:00:00.000' AS DateTime))
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (4, 7, N'Sang', CAST(N'2026-07-26' AS Date), N'Kiểm tra công tác PCCC tầng 1-10, tình hình bình thường.', N'', 8, CAST(N'2026-07-31T14:07:00.320' AS DateTime))
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (5, 8, N'Chieu', CAST(N'2026-07-27' AS Date), N'Điều phối bãi xe ca chiều giờ cao điểm thông thoáng.', NULL, NULL, NULL)
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (6, 9, N'Dem', CAST(N'2026-07-28' AS Date), N'Trực ca đêm an ninh tòa nhà, tuần tra tầng trệt và bãi xe.', NULL, NULL, NULL)
INSERT [dbo].[nhatKyCaTruc] ([id], [maBaoVe], [caTruc], [ngayTruc], [noiDung], [luuYBanGiao], [maNguoiNhanCa], [thoiGianBanGiao]) VALUES (7, 7, N'Sang', CAST(N'2026-07-29' AS Date), N'an toàn', N'', 8, CAST(N'2026-07-29T08:44:21.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[nhatKyCaTruc] OFF
GO
SET IDENTITY_INSERT [dbo].[nhatKyTuanTra] ON 

INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (1, 7, 1, CAST(N'2026-07-22T08:30:00.000' AS DateTime), N'assets/tuan-tra/tang01.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (2, 7, 2, CAST(N'2026-07-22T08:45:00.000' AS DateTime), N'assets/tuan-tra/tang02.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (3, 7, 3, CAST(N'2026-07-22T09:00:00.000' AS DateTime), N'assets/tuan-tra/tang03.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (4, 7, 4, CAST(N'2026-07-22T09:15:00.000' AS DateTime), N'assets/tuan-tra/tang04.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (5, 7, 5, CAST(N'2026-07-22T09:30:00.000' AS DateTime), N'assets/tuan-tra/tang05.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (6, 8, 6, CAST(N'2026-07-23T15:00:00.000' AS DateTime), N'assets/tuan-tra/tang06.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (7, 8, 7, CAST(N'2026-07-23T15:20:00.000' AS DateTime), N'assets/tuan-tra/tang07.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (8, 8, 8, CAST(N'2026-07-23T15:40:00.000' AS DateTime), N'assets/tuan-tra/tang08.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (9, 8, 9, CAST(N'2026-07-23T16:00:00.000' AS DateTime), N'assets/tuan-tra/tang09.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (10, 8, 10, CAST(N'2026-07-23T16:20:00.000' AS DateTime), N'assets/tuan-tra/tang10.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (11, 9, 11, CAST(N'2026-07-24T23:00:00.000' AS DateTime), N'assets/tuan-tra/tang11.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (12, 9, 12, CAST(N'2026-07-24T23:20:00.000' AS DateTime), N'assets/tuan-tra/tang12.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (13, 9, 13, CAST(N'2026-07-24T23:40:00.000' AS DateTime), N'assets/tuan-tra/tang13.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (14, 9, 14, CAST(N'2026-07-25T00:00:00.000' AS DateTime), N'assets/tuan-tra/tang14.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (15, 9, 15, CAST(N'2026-07-25T00:20:00.000' AS DateTime), N'assets/tuan-tra/tang15.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (16, 7, 16, CAST(N'2026-07-26T10:00:00.000' AS DateTime), N'assets/tuan-tra/tang16.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (17, 7, 17, CAST(N'2026-07-26T10:20:00.000' AS DateTime), N'assets/tuan-tra/tang17.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (18, 7, 18, CAST(N'2026-07-26T10:40:00.000' AS DateTime), N'assets/tuan-tra/tang18.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (19, 7, 19, CAST(N'2026-07-26T11:00:00.000' AS DateTime), N'assets/tuan-tra/tang19.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (20, 7, 20, CAST(N'2026-07-26T11:20:00.000' AS DateTime), N'assets/tuan-tra/tang20.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (21, 8, 21, CAST(N'2026-07-27T17:00:00.000' AS DateTime), N'assets/tuan-tra/tang21.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (22, 8, 22, CAST(N'2026-07-27T17:20:00.000' AS DateTime), N'assets/tuan-tra/tang22.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (23, 8, 23, CAST(N'2026-07-27T17:40:00.000' AS DateTime), N'assets/tuan-tra/tang23.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (24, 8, 24, CAST(N'2026-07-27T18:00:00.000' AS DateTime), N'assets/tuan-tra/tang24.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (25, 8, 25, CAST(N'2026-07-27T18:20:00.000' AS DateTime), N'assets/tuan-tra/tang25.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (26, 7, 1, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang01_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (27, 7, 2, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang02_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (28, 7, 3, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang03_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (29, 7, 4, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang04_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (30, 7, 5, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang05_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (31, 8, 6, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang06_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (32, 8, 7, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang07_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (33, 8, 8, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang08_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (34, 8, 9, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang09_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (35, 8, 10, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang10_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (36, 9, 11, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang11_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (37, 9, 12, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang12_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (38, 9, 13, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang13_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (39, 9, 14, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang14_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (40, 9, 15, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang15_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (41, 7, 16, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang16_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (42, 7, 19, CAST(N'2026-07-29T08:30:48.540' AS DateTime), N'assets/tuan-tra/tang19_now.jpg')
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (43, 7, 20, CAST(N'2026-07-29T08:41:23.957' AS DateTime), NULL)
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (44, 7, 25, CAST(N'2026-07-29T19:25:47.297' AS DateTime), NULL)
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (45, 7, 1, CAST(N'2026-07-30T21:58:18.027' AS DateTime), NULL)
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (46, 7, 1, CAST(N'2026-07-30T22:13:40.220' AS DateTime), NULL)
INSERT [dbo].[nhatKyTuanTra] ([id], [maBaoVe], [soTang], [thoiGianQuet], [anhMinhChung]) VALUES (47, 7, 2, CAST(N'2026-07-30T22:14:16.437' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[nhatKyTuanTra] OFF
GO
SET IDENTITY_INSERT [dbo].[phanAnhSuCo] ON 

INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (4, 1, 2, 5, N'Rò rỉ nước bồn rửa bếp', N'B?n r?a chén ? b?p b? rò r? nu?c ? du?ng ?ng x? du?i g?m t?, nu?c tràn ra sàn g? gây ?m m?c.', N'assets/img/ro_ri_nuoc_truoc.jpg', N'assets/uploads/suco/test_nghiemthu_4.jpg', N'HoanThanh', N'CuDan', CAST(N'2026-07-11T14:20:00.000' AS DateTime), CAST(N'2026-07-28T11:06:22.093' AS DateTime), N'TrungBinh', N'Nuoc')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (5, 1, 2, 6, N'Đèn hành hành lang chập chờn', N'Bóng dèn hành lang tru?c c?a can h? b? ch?p ch?n, nh?p nháy liên t?c gây chói m?t.', N'assets/img/den_chap_chon_truoc.jpg', N'assets/img/den_chap_chon_sau.jpg', N'HoanThanh', N'CuDan', CAST(N'2026-07-05T09:10:00.000' AS DateTime), CAST(N'2026-07-05T10:30:00.000' AS DateTime), N'Thap', N'Dien')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (6, 1, 2, 5, N'Cửa thang thoát hiểm kẹt', N'C?a s?t thang thoát hi?m t?ng 1 b? k?t b?n l? r?t n?ng, không th? d?y nh? ra du?c.', N'assets/img/cua_ket_truoc.jpg', N'assets/img/cua_ket_sau.jpg', N'HoanThanh', N'CuDan', CAST(N'2026-06-28T19:45:00.000' AS DateTime), CAST(N'2026-06-29T08:30:00.000' AS DateTime), N'Cao', N'Khac')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (7, 1, NULL, NULL, N'Rò rỉ nước bồn rửa bếp', N'Nu?c ch?y ra sàn, c?n thay ?ng', NULL, NULL, N'DangXuLy', N'CuDan', CAST(N'2026-07-15T02:55:10.800' AS DateTime), NULL, N'Cao', N'Nuoc')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (8, 2, NULL, NULL, N'Camera hầm B2 mất tín hiệu', N'Camera B2-05 m?t tín hi?u t? 23:40', NULL, NULL, N'Huy', N'CuDan', CAST(N'2026-07-15T02:55:10.800' AS DateTime), NULL, N'Cao', N'AnNinh')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (9, 1, NULL, 5, N'Đèn hành lang tầng 1 chập chờn', N'Bóng dèn ch?p ch?n ?nh hu?ng an ninh', NULL, N'assets/uploads/suco/suco_nghiemthu_1785212378323_8cea75.png', N'HoanThanh', N'CuDan', CAST(N'2026-07-15T02:55:10.803' AS DateTime), CAST(N'2026-07-28T11:19:38.433' AS DateTime), N'Cao', N'Dien')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (10, 1, NULL, NULL, N'Cửa thang thoát hiểm tầng 3 kẹt', N'C?a không m? du?c, k?t b?n l?', NULL, NULL, N'HoanThanh', N'BaoVe', CAST(N'2026-07-15T02:55:10.803' AS DateTime), NULL, N'Cao', N'Khac')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (12, 1, 2, 5, N'Test tự động - Bóng đèn hành lang bị cháy', N'Bóng đèn trước cửa phòng 0101 bị nhấp nháy liên tục gây chói mắt', N'assets/uploads/suco/test_sample.jpg', NULL, N'DangXuLy', N'CuDan', CAST(N'2026-07-28T09:57:32.907' AS DateTime), NULL, N'TrungBinh', N'Dien')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (15, 1, 2, 6, N'vỡ ống nước', N'vo chau nuoc', N'assets/uploads/suco/suco_1785207983376_052044.png', NULL, N'DangXuLy', N'CuDan', CAST(N'2026-07-28T10:06:23.390' AS DateTime), NULL, N'TrungBinh', N'Nuoc')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (16, 1, 2, NULL, N'sdgsdf', N'vdsvsvd', NULL, NULL, N'Huy', N'CuDan', CAST(N'2026-07-28T10:07:37.217' AS DateTime), NULL, N'Thap', N'Khac')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (17, 2, 8, NULL, N'fy', N'gvh', NULL, NULL, N'Huy', N'CuDan', CAST(N'2026-07-28T10:24:09.680' AS DateTime), NULL, N'Thap', N'Khac')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (19, 1, 2, 6, N'rò rỉ ddiện', N'rò rỉ', N'assets/uploads/suco/suco_1785209694488_096ba7.png', NULL, N'DangXuLy', N'CuDan', CAST(N'2026-07-28T10:34:54.503' AS DateTime), NULL, N'Cao', N'Dien')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (20, 9, 9, 5, N'dgvdsvfsdf', N'ádsada', N'assets/uploads/suco/suco_1785231800422_4f67d2.png', N'assets/uploads/suco/suco_nghiemthu_1785309911625_4191e0.png', N'HoanThanh', N'CuDan', CAST(N'2026-07-28T16:43:20.423' AS DateTime), CAST(N'2026-07-29T14:25:11.690' AS DateTime), N'Cao', N'ThangMay')
INSERT [dbo].[phanAnhSuCo] ([id], [maCanHo], [maCuDan], [maNhanVien], [tieuDe], [moTa], [anhTruocXuLy], [anhSauXuLy], [trangThai], [nguonGui], [ngayGui], [ngayHoanThanh], [mucDoUuTien], [loaiSuCo]) VALUES (21, 1, 2, 5, N'điện chập chờn', N'cắm vào ổ điện bị chập chờn', N'assets/uploads/suco/suco_1785478512919_0ad40d.png', N'assets/uploads/suco/suco_nghiemthu_1785480963967_ad7ace.png', N'HoanThanh', N'CuDan', CAST(N'2026-07-31T13:15:12.930' AS DateTime), CAST(N'2026-07-31T13:56:03.987' AS DateTime), N'Cao', N'Dien')
SET IDENTITY_INSERT [dbo].[phanAnhSuCo] OFF
GO
SET IDENTITY_INSERT [dbo].[phieuBau] ON 

INSERT [dbo].[phieuBau] ([id], [maBinhChon], [maPhuongAn], [maCuDan], [thoiGianBau], [maCanHo]) VALUES (15, 22, 33, 2, CAST(N'2026-07-27T22:21:47.380' AS DateTime), 1)
INSERT [dbo].[phieuBau] ([id], [maBinhChon], [maPhuongAn], [maCuDan], [thoiGianBau], [maCanHo]) VALUES (16, 21, 31, 2, CAST(N'2026-07-27T22:21:50.677' AS DateTime), 1)
INSERT [dbo].[phieuBau] ([id], [maBinhChon], [maPhuongAn], [maCuDan], [thoiGianBau], [maCanHo]) VALUES (17, 21, 31, 8, CAST(N'2026-07-27T22:25:32.810' AS DateTime), 2)
INSERT [dbo].[phieuBau] ([id], [maBinhChon], [maPhuongAn], [maCuDan], [thoiGianBau], [maCanHo]) VALUES (18, 21, 31, 9, CAST(N'2026-07-27T22:25:46.490' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[phieuBau] OFF
GO
SET IDENTITY_INSERT [dbo].[phuongAnBinhChon] ON 

INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (31, 21, N'Đồng ý', 1)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (32, 21, N'Không đồng ý', 2)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (33, 22, N'Đồng ý', 1)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (34, 22, N'Không đồng ý', 2)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (35, 22, N'Cần họp thêm', 3)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (36, 23, N'Đồng ý', 1)
INSERT [dbo].[phuongAnBinhChon] ([id], [maBinhChon], [noiDung], [thuTu]) VALUES (37, 23, N'Không Đồng ý', 2)
SET IDENTITY_INSERT [dbo].[phuongAnBinhChon] OFF
GO
SET IDENTITY_INSERT [dbo].[quanLyXe] ON 

INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (1, 1, NULL, N'30A-123.45', N'OTo')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (2, 1, 3, N'29H1-678.90', N'XeMay')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (3, 2, 4, N'30F-456.78', N'OTo')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (4, 2, NULL, N'29K1-112.23', N'XeMay')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (5, 6, 6, N'30E-888.99', N'OTo')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (6, 9, 7, N'29P1-334.45', N'XeMay')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (7, 18, 8, N'30G-999.11', N'OTo')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (8, 35, NULL, N'XD-0503-01', N'XeDap')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (9, 35, NULL, N'29M1-556.67', N'XeMay')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (10, 1, NULL, N'30A-21749', N'OTo')
INSERT [dbo].[quanLyXe] ([id], [maCanHo], [maThe], [bienSoXe], [loaiXe]) VALUES (11, 1, NULL, N'30A-55977', N'OTo')
SET IDENTITY_INSERT [dbo].[quanLyXe] OFF
GO
SET IDENTITY_INSERT [dbo].[taiKhoan] ON 

INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (1, N'bql_0001', N'bql.truongban', N'$2a$12$bBgNd6is6Pix2ea8hzjZl.07pKfxfpRWMjZGb0dSL4tdAdc.QEoY.', N'BQL', N'BanQuanLy', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (2, N'nv_lt0001', N'letan.thi', N'$2a$12$8HMeG5xSIpA9dejRcvBx6eyehAcBoqzVwUuCHmhvYYaZv/KBXIM22', N'NV', N'LeTan', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (3, N'nv_lt0002', N'letan.mai', N'$2a$12$Rx7vr7DcJmXbpBWD4QJw3uiDNGWLaPuXYl3wNBlXr5yL4725j3qZW', N'NV', N'LeTan', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (4, N'nv_kt0001', N'ketoan.linh', N'$2a$12$owl8DEpwiFcJ948WS2pEJOhNMkrLB.Ae4ZVDuQmq0QdIC/yzcCCse', N'NV', N'KeToan', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (5, N'nv_ktht0001', N'kythuat.nam', N'$2a$12$gOR1/SR0IDH.lPI3Y.m/L.j2z8IHLue6N3eRpRh09WrrbyE0N6lOS', N'NV', N'KyThuat', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (6, N'nv_ktht0002', N'kythuat.duc', N'$2a$12$F8YARMcM0lznWsj6v6Q5QOqjxcgMtzatGClpWgpg1lpqUfp9HXo9e', N'NV', N'KyThuat', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (7, N'nv_bv0001', N'baove.hung', N'$2a$12$doTE0qr5yAtixaR6TFXhNOO8BlQKeJYZrLBTHbeH1vkdksaTOtGqO', N'NV', N'BaoVe', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (8, N'nv_bv0002', N'baove.tuan', N'$2a$12$Kzv5rvVtBBsavphtlZu0cukKQRLgyt8bXB7C3vRjGHB9dz6Dqx8x.', N'NV', N'BaoVe', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (9, N'nv_bv0003', N'baove.son', N'$2a$12$aqGLm3wNFwfgrqbTddO1p.HO1YHs4O450PBvPLgetpUqtX.Xfq.Yy', N'NV', N'BaoVe', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (11, N'cd_0001', N'cudan.p101', N'$2a$12$B8I6WiWhcILaFHUBSCYWceVt5.v8tTzBysPrLBDtU72ttcpgbF.AS', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (12, N'nv_ktht0003', N'kt.nam', N'$2a$12$q8oRldvjlO66ogP02VfXYeMFRurWCAOTqdqR34VizsOTm1803FlBe', N'NV', N'KyThuat', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (13, N'nv_kt0002', N'ketoan.lan', N'$2a$12$83.8zaKM0y4w8Iigy1GuN.C3EWJIGW0II3JJBm.A84rpXd25.hCsK', N'NV', N'KeToan', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (14, N'bql_0002', N'bql.admin', N'$2a$12$iOOZU8xfozxtwdECFKTyPeZeXGB5vkl3WySabF5V7iBldJ5HTRZ.C', N'BQL', N'BanQuanLy', N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (15, N'cd_0002', N'cudan.p102', N'$2a$12$JvmW2Zui0e6.PHieTEAnOe8Irx6XBN3b.nrHRz.Cj5cq9DtAZTm.O', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (19, N'cd_0003', N'cudan.p201', N'$2a$12$BjrSRxSYBb/GHtFBbtPca.wXmQKTCZpQbBR/jVs2ic4VqYxB9Hp/m', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (20, N'cd_0004', N'cudan.p302', N'$2a$12$iwsDN6vkDBQ7WED.9JGvx.9BSyT1/UUTNuvVsBXguI4J8K6XSJGa.', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (21, N'cd_0005', N'cudan.p503', N'$2a$12$1r7yPrD0GQEM6vas6tiaYeeJYFMUngQztxvAXvEpmF2KOnKZwndjG', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (22, N'cd_0006', N'cudan.p106', N'$2a$12$eykP5Ge7CN7yySue7ToVOuw4uE9Auf7xLtq4iUBPtjw1TNsJdPtfe', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (28, N'cd_0007', N'cudan.p103', N'$2a$12$kL4cjBHNGUuyQZ1DtcSmKeSjWhKJAA6Z9VBcd4BowJUrRySnpq0gK', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (29, N'cd_0008', N'cudan.p104', N'$2a$12$6B.3GnCsPX7.0eX./g70VekC36HabXHixD8BgcLzKTiPiCXSggttK', N'CD', NULL, N'HoatDong')
INSERT [dbo].[taiKhoan] ([id], [maTaiKhoan], [tenDangNhap], [matKhau], [vaiTro], [boPhanCode], [trangThaiHoatDong]) VALUES (30, N'cd_0009', N'cudan.p105', N'$2a$12$Pnkp3qHWoXSwmGs0LMZ7X.GwEUjqHh8gLhr91d4ACaUTKnmi403gy', N'CD', NULL, N'HoatDong')
SET IDENTITY_INSERT [dbo].[taiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[theTu] ON 

INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (2, 1, 2, N'THE-0101-01', CAST(N'2025-01-15' AS Date), CAST(N'2027-01-15' AS Date), N'DaThuHoi')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (3, 1, 3, N'THE-0101-02', CAST(N'2025-08-01' AS Date), CAST(N'2027-08-01' AS Date), N'DangSuDung')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (4, 2, 8, N'THE-0102-01', CAST(N'2025-02-01' AS Date), CAST(N'2027-02-01' AS Date), N'DangSuDung')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (5, 2, 8, N'THE-0102-02', CAST(N'2024-01-01' AS Date), CAST(N'2026-01-01' AS Date), N'DaThuHoi')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (6, 6, 12, N'THE-0106-01', CAST(N'2025-03-10' AS Date), CAST(N'2027-03-10' AS Date), N'DangSuDung')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (7, 9, 9, N'THE-0201-01', CAST(N'2025-04-15' AS Date), CAST(N'2027-04-15' AS Date), N'DangSuDung')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (8, 18, 10, N'THE-0302-01', CAST(N'2025-05-20' AS Date), CAST(N'2027-05-20' AS Date), N'DangSuDung')
INSERT [dbo].[theTu] ([id], [maCanHo], [maCuDan], [soThe], [ngayCap], [ngayHetHan], [trangThai]) VALUES (9, 35, 11, N'THE-0503-01', CAST(N'2025-06-01' AS Date), CAST(N'2027-06-01' AS Date), N'DaThuHoi')
SET IDENTITY_INSERT [dbo].[theTu] OFF
GO
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (2, N'BaiXeOTo')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (2, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (2, N'HoBoi')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (2, N'PhongGym')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (2, N'ThangMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (3, N'BaiXeMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (4, N'BaiXeMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (4, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (4, N'ThangMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (6, N'BaiXeOTo')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (6, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (6, N'ThangMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (7, N'BaiXeMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (7, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (7, N'ThangMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (8, N'BaiXeOTo')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (8, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (8, N'HoBoi')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (8, N'ThangMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (9, N'BaiXeMay')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (9, N'CuaChinh')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (9, N'PhongGym')
INSERT [dbo].[theTu_ChucNang] ([maThe], [chucNang]) VALUES (9, N'ThangMay')
GO
SET IDENTITY_INSERT [dbo].[thongBao] ON 

INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (2, 1, N'Bảo trì máy lạnh', N'sssss', N'BaoTri', CAST(N'2026-07-20T22:03:59.667' AS DateTime), N'TatCa', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (3, 1, N'Bảo trì thang máy', N'ádsfds', N'BaoTri', CAST(N'2026-07-20T22:07:03.883' AS DateTime), N'TatCa', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (10, 1, N'Vỡ ống nước', N'sdgfaf', N'ThongThuong', CAST(N'2026-07-24T20:10:00.557' AS DateTime), N'TatCa', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (17, 1, N'Thông báo sinh hoạt cư dân tháng 7', N'Kính mời cư dân tham gia buổi sinh hoạt định kỳ tháng 7 tại phòng sinh hoạt cộng đồng tầng 1.', N'ThongThuong', CAST(N'2026-07-27T20:01:59.757' AS DateTime), N'CuDan', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (18, 1, N'Lịch họp nội bộ Ban Quản Lý & Nhân Viên', N'Yêu cầu toàn thể nhân viên các bộ phận tham dự buổi giao ban tuần.', N'ThongThuong', CAST(N'2026-07-27T20:01:59.757' AS DateTime), N'NhanVien', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (19, 1, N'gfsegesdfg', N'gthrg', N'BaoTri', CAST(N'2026-07-27T22:02:01.997' AS DateTime), N'CuDan', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (20, 1, N'dsds', N'ádad', N'ThongThuong', CAST(N'2026-07-28T21:06:47.020' AS DateTime), N'CuDan', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (21, 1, N'Nhắc phí tháng 7/2026', N'Kính gửi cư dân căn hộ 0106,

Ban Quản lý xin thông báo nhắc phí dịch vụ kỳ Tháng 7/2026:
• Tổng tiền hóa đơn: 971.800đ
• Đã thanh toán: 0đ
• Số tiền còn nợ: 971.800đ

Rất mong Quý cư dân hoàn tất thanh toán để đảm bảo duy trì các dịch vụ tiện ích.', N'NhacPhi', CAST(N'2026-07-29T10:38:13.633' AS DateTime), N'CanHo', 6)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (22, 1, N'Nhắc phí tháng 7/2026', N'Kính gửi cư dân căn hộ 0201,

Ban Quản lý xin thông báo nhắc phí dịch vụ kỳ Tháng 7/2026:
• Tổng tiền hóa đơn: 1.838.400đ
• Đã thanh toán: 0đ
• Số tiền còn nợ: 1.838.400đ

Rất mong Quý cư dân hoàn tất thanh toán để đảm bảo duy trì các dịch vụ tiện ích.', N'NhacPhi', CAST(N'2026-07-29T10:38:13.687' AS DateTime), N'CanHo', 9)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (23, 1, N'Nhắc phí tháng 7/2026', N'Kính gửi cư dân căn hộ 0302,

Ban Quản lý xin thông báo nhắc phí dịch vụ kỳ Tháng 7/2026:
• Tổng tiền hóa đơn: 1.195.200đ
• Đã thanh toán: 0đ
• Số tiền còn nợ: 1.195.200đ

Rất mong Quý cư dân hoàn tất thanh toán để đảm bảo duy trì các dịch vụ tiện ích.', N'NhacPhi', CAST(N'2026-07-29T10:38:13.697' AS DateTime), N'CanHo', 18)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (24, 1, N'Nhắc phí tháng 7/2026', N'Kính gửi cư dân căn hộ 0503,

Ban Quản lý xin thông báo nhắc phí dịch vụ kỳ Tháng 7/2026:
• Tổng tiền hóa đơn: 940.100đ
• Đã thanh toán: 0đ
• Số tiền còn nợ: 940.100đ

Rất mong Quý cư dân hoàn tất thanh toán để đảm bảo duy trì các dịch vụ tiện ích.', N'NhacPhi', CAST(N'2026-07-29T10:38:13.710' AS DateTime), N'CanHo', 35)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (25, 1, N'Nhắc phí tháng 8/2026', N'Kính gửi cư dân căn hộ 0503,

Ban Quản lý xin thông báo nhắc phí dịch vụ kỳ Tháng 8/2026:
• Tổng tiền hóa đơn: 1.098.600đ
• Đã thanh toán: 0đ
• Số tiền còn nợ: 1.098.600đ

Rất mong Quý cư dân hoàn tất thanh toán để đảm bảo duy trì các dịch vụ tiện ích.', N'NhacPhi', CAST(N'2026-07-29T10:51:00.737' AS DateTime), N'CanHo', 35)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (26, 1, N'a', N'a', N'ThongThuong', CAST(N'2026-07-29T19:31:44.003' AS DateTime), N'NhanVien', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (28, 1, N'Thông báo họp bộ phận kỹ thuật & kế toán', N'Nội dung họp triển khai công tác tuần tới.', N'BaoTri', CAST(N'2026-07-30T16:41:44.333' AS DateTime), N'NhanVien', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (33, 1, N'Mai chung kết xuống sảnh coi', N'AFF cup', N'ThongThuong', CAST(N'2026-07-31T13:33:05.563' AS DateTime), N'TatCa', NULL)
INSERT [dbo].[thongBao] ([id], [maNhanVien], [tieuDe], [noiDung], [loaiThongBao], [ngayTao], [doiTuong], [maCanHo]) VALUES (34, 1, N'Mai họp ở dưới ban quản lý', N'ban số chi phí tiện ích', N'ThongThuong', CAST(N'2026-07-31T13:34:48.847' AS DateTime), N'NhanVien', NULL)
SET IDENTITY_INSERT [dbo].[thongBao] OFF
GO
SET IDENTITY_INSERT [dbo].[thongBao_DaDoc] ON 

INSERT [dbo].[thongBao_DaDoc] ([id], [maThongBao], [maCuDan], [thoiGianDoc], [maNhanVien]) VALUES (1, 17, 2, CAST(N'2026-07-27T20:22:22.123' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[thongBao_DaDoc] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_canHo_vitri]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[canHo] ADD  CONSTRAINT [UQ_canHo_vitri] UNIQUE NONCLUSTERED 
(
	[soTang] ASC,
	[soPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_chamCong]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[chamCong] ADD  CONSTRAINT [UQ_chamCong] UNIQUE NONCLUSTERED 
(
	[maNhanVien] ASC,
	[ngayLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_chiSo_ky]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[chiSoTieuThu] ADD  CONSTRAINT [UQ_chiSo_ky] UNIQUE NONCLUSTERED 
(
	[maCanHo] ASC,
	[loaiDichVu] ASC,
	[thang] ASC,
	[nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_cuDan_maTaiKhoan]    Script Date: 8/7/2026 7:27:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_cuDan_maTaiKhoan] ON [dbo].[cuDan]
(
	[maTaiKhoan] ASC
)
WHERE ([maTaiKhoan] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__danhMucT__EAD24CB50E5D7AFF]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[danhMucTienIch] ADD UNIQUE NONCLUSTERED 
(
	[tenTienIch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_datLich_khongTrung]    Script Date: 8/7/2026 7:27:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_datLich_khongTrung] ON [dbo].[datLichTienIch]
(
	[maTienIch] ASC,
	[ngayDat] ASC,
	[khungGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_gdtt_soThamChieuSaoKe]    Script Date: 8/7/2026 7:27:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_gdtt_soThamChieuSaoKe] ON [dbo].[giaoDichThanhToan]
(
	[soThamChieuSaoKe] ASC
)
WHERE ([soThamChieuSaoKe] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_hoaDon_thang]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[hoaDon] ADD  CONSTRAINT [UQ_hoaDon_thang] UNIQUE NONCLUSTERED 
(
	[maCanHo] ASC,
	[thang] ASC,
	[nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__nhanVien__8FFF6A9C1047BD2C]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[nhanVien] ADD UNIQUE NONCLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_caTruc]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[nhatKyCaTruc] ADD  CONSTRAINT [UQ_caTruc] UNIQUE NONCLUSTERED 
(
	[maBaoVe] ASC,
	[caTruc] ASC,
	[ngayTruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_phieuBau_motPhieu]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[phieuBau] ADD  CONSTRAINT [UQ_phieuBau_motPhieu] UNIQUE NONCLUSTERED 
(
	[maBinhChon] ASC,
	[maCuDan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_phieuBau_motCan]    Script Date: 8/7/2026 7:27:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_phieuBau_motCan] ON [dbo].[phieuBau]
(
	[maBinhChon] ASC,
	[maCanHo] ASC
)
WHERE ([maCanHo] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__quanLyXe__410E03A7726A1A1C]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[quanLyXe] ADD UNIQUE NONCLUSTERED 
(
	[bienSoXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_quanLyXe_bienSoXe]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[quanLyXe] ADD  CONSTRAINT [UQ_quanLyXe_bienSoXe] UNIQUE NONCLUSTERED 
(
	[bienSoXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__taiKhoan__59267D4AA14E95F2]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[taiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[tenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__taiKhoan__8FFF6A9CB3CC9C12]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[taiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[maTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__theTu__53D7D7E4FDF130EB]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[theTu] ADD UNIQUE NONCLUSTERED 
(
	[soThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_theTu_soThe]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[theTu] ADD  CONSTRAINT [UQ_theTu_soThe] UNIQUE NONCLUSTERED 
(
	[soThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_daDoc]    Script Date: 8/7/2026 7:27:33 PM ******/
ALTER TABLE [dbo].[thongBao_DaDoc] ADD  CONSTRAINT [UQ_daDoc] UNIQUE NONCLUSTERED 
(
	[maThongBao] ASC,
	[maCuDan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bieuGiaDichVu] ADD  DEFAULT ((0)) FOR [bacTu]
GO
ALTER TABLE [dbo].[binhChon] ADD  DEFAULT (getdate()) FOR [ngayBatDau]
GO
ALTER TABLE [dbo].[binhChon] ADD  DEFAULT ((50.00)) FOR [tyLeTucSo]
GO
ALTER TABLE [dbo].[chiSoTieuThu] ADD  DEFAULT (getdate()) FOR [ngayGhi]
GO
ALTER TABLE [dbo].[chiTietHoaDon] ADD  DEFAULT ((0)) FOR [thanhTien]
GO
ALTER TABLE [dbo].[danhMucTienIch] ADD  DEFAULT ((0)) FOR [giaThueMacDinh]
GO
ALTER TABLE [dbo].[danhMucTienIch] ADD  DEFAULT (N'HoatDong') FOR [trangThaiHoatDong]
GO
ALTER TABLE [dbo].[datLichTienIch] ADD  DEFAULT ((0)) FOR [giaTien]
GO
ALTER TABLE [dbo].[datLichTienIch] ADD  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[giaoDichThanhToan] ADD  DEFAULT (getdate()) FOR [thoiGianTao]
GO
ALTER TABLE [dbo].[hoaDon] ADD  DEFAULT ((0)) FOR [tongTien]
GO
ALTER TABLE [dbo].[lichSuXuLySuCo] ADD  DEFAULT (getdate()) FOR [thoiGian]
GO
ALTER TABLE [dbo].[nhatKyTuanTra] ADD  DEFAULT (getdate()) FOR [thoiGianQuet]
GO
ALTER TABLE [dbo].[phanAnhSuCo] ADD  DEFAULT (getdate()) FOR [ngayGui]
GO
ALTER TABLE [dbo].[phieuBau] ADD  DEFAULT (getdate()) FOR [thoiGianBau]
GO
ALTER TABLE [dbo].[phuongAnBinhChon] ADD  DEFAULT ((1)) FOR [thuTu]
GO
ALTER TABLE [dbo].[theTu] ADD  DEFAULT (getdate()) FOR [ngayCap]
GO
ALTER TABLE [dbo].[thongBao] ADD  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[thongBao_DaDoc] ADD  DEFAULT (getdate()) FOR [thoiGianDoc]
GO
ALTER TABLE [dbo].[binhChon]  WITH CHECK ADD  CONSTRAINT [FK_binhChon_thongBao] FOREIGN KEY([maThongBao])
REFERENCES [dbo].[thongBao] ([id])
GO
ALTER TABLE [dbo].[binhChon] CHECK CONSTRAINT [FK_binhChon_thongBao]
GO
ALTER TABLE [dbo].[chamCong]  WITH CHECK ADD  CONSTRAINT [FK_chamCong_nhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[chamCong] CHECK CONSTRAINT [FK_chamCong_nhanVien]
GO
ALTER TABLE [dbo].[chiSoTieuThu]  WITH CHECK ADD  CONSTRAINT [FK_chiSo_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[chiSoTieuThu] CHECK CONSTRAINT [FK_chiSo_canHo]
GO
ALTER TABLE [dbo].[chiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_chiTietHoaDon_hoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[hoaDon] ([id])
GO
ALTER TABLE [dbo].[chiTietHoaDon] CHECK CONSTRAINT [FK_chiTietHoaDon_hoaDon]
GO
ALTER TABLE [dbo].[cuDan]  WITH CHECK ADD  CONSTRAINT [FK_cuDan_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[cuDan] CHECK CONSTRAINT [FK_cuDan_canHo]
GO
ALTER TABLE [dbo].[cuDan]  WITH CHECK ADD  CONSTRAINT [FK_cuDan_taiKhoan] FOREIGN KEY([maTaiKhoan])
REFERENCES [dbo].[taiKhoan] ([id])
GO
ALTER TABLE [dbo].[cuDan] CHECK CONSTRAINT [FK_cuDan_taiKhoan]
GO
ALTER TABLE [dbo].[datLichTienIch]  WITH CHECK ADD  CONSTRAINT [FK_datLich_tienIch] FOREIGN KEY([maTienIch])
REFERENCES [dbo].[danhMucTienIch] ([id])
GO
ALTER TABLE [dbo].[datLichTienIch] CHECK CONSTRAINT [FK_datLich_tienIch]
GO
ALTER TABLE [dbo].[datLichTienIch]  WITH CHECK ADD  CONSTRAINT [FK_datLichTienIch_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[datLichTienIch] CHECK CONSTRAINT [FK_datLichTienIch_canHo]
GO
ALTER TABLE [dbo].[datLichTienIch]  WITH CHECK ADD  CONSTRAINT [FK_datLichTienIch_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[datLichTienIch] CHECK CONSTRAINT [FK_datLichTienIch_cuDan]
GO
ALTER TABLE [dbo].[giaoDichThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_giaoDich_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[giaoDichThanhToan] CHECK CONSTRAINT [FK_giaoDich_cuDan]
GO
ALTER TABLE [dbo].[giaoDichThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_giaoDich_hoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[hoaDon] ([id])
GO
ALTER TABLE [dbo].[giaoDichThanhToan] CHECK CONSTRAINT [FK_giaoDich_hoaDon]
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD  CONSTRAINT [FK_hoaDon_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[hoaDon] CHECK CONSTRAINT [FK_hoaDon_canHo]
GO
ALTER TABLE [dbo].[lichSuXuLySuCo]  WITH CHECK ADD  CONSTRAINT [FK_lichSu_nhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[lichSuXuLySuCo] CHECK CONSTRAINT [FK_lichSu_nhanVien]
GO
ALTER TABLE [dbo].[lichSuXuLySuCo]  WITH CHECK ADD  CONSTRAINT [FK_lichSu_phanAnh] FOREIGN KEY([maPhanAnh])
REFERENCES [dbo].[phanAnhSuCo] ([id])
GO
ALTER TABLE [dbo].[lichSuXuLySuCo] CHECK CONSTRAINT [FK_lichSu_phanAnh]
GO
ALTER TABLE [dbo].[nhanVien]  WITH CHECK ADD  CONSTRAINT [FK_nhanVien_boPhan] FOREIGN KEY([boPhan])
REFERENCES [dbo].[danhMucBoPhan] ([maBoPhan])
GO
ALTER TABLE [dbo].[nhanVien] CHECK CONSTRAINT [FK_nhanVien_boPhan]
GO
ALTER TABLE [dbo].[nhanVien]  WITH CHECK ADD  CONSTRAINT [FK_nhanVien_taiKhoan] FOREIGN KEY([maTaiKhoan])
REFERENCES [dbo].[taiKhoan] ([id])
GO
ALTER TABLE [dbo].[nhanVien] CHECK CONSTRAINT [FK_nhanVien_taiKhoan]
GO
ALTER TABLE [dbo].[nhatKyCaTruc]  WITH CHECK ADD  CONSTRAINT [FK_caTruc_baoVe] FOREIGN KEY([maBaoVe])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[nhatKyCaTruc] CHECK CONSTRAINT [FK_caTruc_baoVe]
GO
ALTER TABLE [dbo].[nhatKyCaTruc]  WITH CHECK ADD  CONSTRAINT [FK_caTruc_nhanCa] FOREIGN KEY([maNguoiNhanCa])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[nhatKyCaTruc] CHECK CONSTRAINT [FK_caTruc_nhanCa]
GO
ALTER TABLE [dbo].[nhatKyTuanTra]  WITH CHECK ADD  CONSTRAINT [FK_nhatKyTuanTra_nhanVien] FOREIGN KEY([maBaoVe])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[nhatKyTuanTra] CHECK CONSTRAINT [FK_nhatKyTuanTra_nhanVien]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [FK_phanAnhSuCo_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [FK_phanAnhSuCo_canHo]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [FK_phanAnhSuCo_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [FK_phanAnhSuCo_cuDan]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [FK_phanAnhSuCo_nhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [FK_phanAnhSuCo_nhanVien]
GO
ALTER TABLE [dbo].[phieuBau]  WITH CHECK ADD  CONSTRAINT [FK_phieuBau_binhChon] FOREIGN KEY([maBinhChon])
REFERENCES [dbo].[binhChon] ([id])
GO
ALTER TABLE [dbo].[phieuBau] CHECK CONSTRAINT [FK_phieuBau_binhChon]
GO
ALTER TABLE [dbo].[phieuBau]  WITH CHECK ADD  CONSTRAINT [FK_phieuBau_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[phieuBau] CHECK CONSTRAINT [FK_phieuBau_canHo]
GO
ALTER TABLE [dbo].[phieuBau]  WITH CHECK ADD  CONSTRAINT [FK_phieuBau_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[phieuBau] CHECK CONSTRAINT [FK_phieuBau_cuDan]
GO
ALTER TABLE [dbo].[phieuBau]  WITH CHECK ADD  CONSTRAINT [FK_phieuBau_phuongAn] FOREIGN KEY([maPhuongAn])
REFERENCES [dbo].[phuongAnBinhChon] ([id])
GO
ALTER TABLE [dbo].[phieuBau] CHECK CONSTRAINT [FK_phieuBau_phuongAn]
GO
ALTER TABLE [dbo].[phuongAnBinhChon]  WITH CHECK ADD  CONSTRAINT [FK_phuongAn_binhChon] FOREIGN KEY([maBinhChon])
REFERENCES [dbo].[binhChon] ([id])
GO
ALTER TABLE [dbo].[phuongAnBinhChon] CHECK CONSTRAINT [FK_phuongAn_binhChon]
GO
ALTER TABLE [dbo].[quanLyXe]  WITH CHECK ADD  CONSTRAINT [FK_quanLyXe_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[quanLyXe] CHECK CONSTRAINT [FK_quanLyXe_canHo]
GO
ALTER TABLE [dbo].[quanLyXe]  WITH CHECK ADD  CONSTRAINT [FK_quanLyXe_theTu] FOREIGN KEY([maThe])
REFERENCES [dbo].[theTu] ([id])
GO
ALTER TABLE [dbo].[quanLyXe] CHECK CONSTRAINT [FK_quanLyXe_theTu]
GO
ALTER TABLE [dbo].[taiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_taiKhoan_boPhan] FOREIGN KEY([boPhanCode])
REFERENCES [dbo].[danhMucBoPhan] ([maBoPhan])
GO
ALTER TABLE [dbo].[taiKhoan] CHECK CONSTRAINT [FK_taiKhoan_boPhan]
GO
ALTER TABLE [dbo].[taiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_taiKhoan_vaiTro] FOREIGN KEY([vaiTro])
REFERENCES [dbo].[danhMucVaiTro] ([maVaiTro])
GO
ALTER TABLE [dbo].[taiKhoan] CHECK CONSTRAINT [FK_taiKhoan_vaiTro]
GO
ALTER TABLE [dbo].[theTu]  WITH CHECK ADD  CONSTRAINT [FK_theTu_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[theTu] CHECK CONSTRAINT [FK_theTu_canHo]
GO
ALTER TABLE [dbo].[theTu]  WITH CHECK ADD  CONSTRAINT [FK_theTu_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[theTu] CHECK CONSTRAINT [FK_theTu_cuDan]
GO
ALTER TABLE [dbo].[theTu_ChucNang]  WITH CHECK ADD  CONSTRAINT [FK_ttcn_theTu] FOREIGN KEY([maThe])
REFERENCES [dbo].[theTu] ([id])
GO
ALTER TABLE [dbo].[theTu_ChucNang] CHECK CONSTRAINT [FK_ttcn_theTu]
GO
ALTER TABLE [dbo].[thongBao]  WITH CHECK ADD  CONSTRAINT [FK_thongBao_canHo] FOREIGN KEY([maCanHo])
REFERENCES [dbo].[canHo] ([id])
GO
ALTER TABLE [dbo].[thongBao] CHECK CONSTRAINT [FK_thongBao_canHo]
GO
ALTER TABLE [dbo].[thongBao]  WITH CHECK ADD  CONSTRAINT [FK_thongBao_nhanVien] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[nhanVien] ([id])
GO
ALTER TABLE [dbo].[thongBao] CHECK CONSTRAINT [FK_thongBao_nhanVien]
GO
ALTER TABLE [dbo].[thongBao_DaDoc]  WITH CHECK ADD  CONSTRAINT [FK_daDoc_cuDan] FOREIGN KEY([maCuDan])
REFERENCES [dbo].[cuDan] ([id])
GO
ALTER TABLE [dbo].[thongBao_DaDoc] CHECK CONSTRAINT [FK_daDoc_cuDan]
GO
ALTER TABLE [dbo].[thongBao_DaDoc]  WITH CHECK ADD  CONSTRAINT [FK_daDoc_thongBao] FOREIGN KEY([maThongBao])
REFERENCES [dbo].[thongBao] ([id])
GO
ALTER TABLE [dbo].[thongBao_DaDoc] CHECK CONSTRAINT [FK_daDoc_thongBao]
GO
ALTER TABLE [dbo].[bieuGiaDichVu]  WITH CHECK ADD  CONSTRAINT [CK_bieuGiaDichVu_loaiDichVu] CHECK  (([loaiDichVu]='GuiXeMay' OR [loaiDichVu]='GuiXeOTo' OR [loaiDichVu]='PhiQuanLy' OR [loaiDichVu]='Nuoc' OR [loaiDichVu]='Dien'))
GO
ALTER TABLE [dbo].[bieuGiaDichVu] CHECK CONSTRAINT [CK_bieuGiaDichVu_loaiDichVu]
GO
ALTER TABLE [dbo].[binhChon]  WITH CHECK ADD  CONSTRAINT [CK_binhChon_hanChot] CHECK  (([hanChot]>[ngayBatDau]))
GO
ALTER TABLE [dbo].[binhChon] CHECK CONSTRAINT [CK_binhChon_hanChot]
GO
ALTER TABLE [dbo].[binhChon]  WITH CHECK ADD  CONSTRAINT [CK_binhChon_trangThai] CHECK  (([trangThai]='KhongDuTucSo' OR [trangThai]='DaDong' OR [trangThai]='DangMo'))
GO
ALTER TABLE [dbo].[binhChon] CHECK CONSTRAINT [CK_binhChon_trangThai]
GO
ALTER TABLE [dbo].[canHo]  WITH CHECK ADD  CONSTRAINT [CK_canHo_dienTich] CHECK  (([dienTich]>(0)))
GO
ALTER TABLE [dbo].[canHo] CHECK CONSTRAINT [CK_canHo_dienTich]
GO
ALTER TABLE [dbo].[canHo]  WITH CHECK ADD  CONSTRAINT [CK_canHo_trangThai] CHECK  (([trangThai]='BaoTri' OR [trangThai]='TrongChoThue' OR [trangThai]='DangO'))
GO
ALTER TABLE [dbo].[canHo] CHECK CONSTRAINT [CK_canHo_trangThai]
GO
ALTER TABLE [dbo].[chamCong]  WITH CHECK ADD  CONSTRAINT [CK_chamCong_caLam] CHECK  (([caLam]='Dem' OR [caLam]='Chieu' OR [caLam]='Sang'))
GO
ALTER TABLE [dbo].[chamCong] CHECK CONSTRAINT [CK_chamCong_caLam]
GO
ALTER TABLE [dbo].[chamCong]  WITH CHECK ADD  CONSTRAINT [CK_chamCong_gioRa] CHECK  (([gioRa] IS NULL OR [gioRa]>[gioVao]))
GO
ALTER TABLE [dbo].[chamCong] CHECK CONSTRAINT [CK_chamCong_gioRa]
GO
ALTER TABLE [dbo].[chiSoTieuThu]  WITH CHECK ADD CHECK  (([thang]>=(1) AND [thang]<=(12)))
GO
ALTER TABLE [dbo].[chiSoTieuThu]  WITH CHECK ADD  CONSTRAINT [CK_chiSoTieuThu_chiSo] CHECK  (([chiSo]>=(0)))
GO
ALTER TABLE [dbo].[chiSoTieuThu] CHECK CONSTRAINT [CK_chiSoTieuThu_chiSo]
GO
ALTER TABLE [dbo].[chiSoTieuThu]  WITH CHECK ADD  CONSTRAINT [CK_chiSoTieuThu_loaiDichVu] CHECK  (([loaiDichVu]='Nuoc' OR [loaiDichVu]='Dien'))
GO
ALTER TABLE [dbo].[chiSoTieuThu] CHECK CONSTRAINT [CK_chiSoTieuThu_loaiDichVu]
GO
ALTER TABLE [dbo].[chiSoTieuThu]  WITH CHECK ADD  CONSTRAINT [CK_chiSoTieuThu_thang] CHECK  (([thang]>=(1) AND [thang]<=(12)))
GO
ALTER TABLE [dbo].[chiSoTieuThu] CHECK CONSTRAINT [CK_chiSoTieuThu_thang]
GO
ALTER TABLE [dbo].[chiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [CK_chiTietHoaDon_donViTinh] CHECK  (([donViTinh] IS NULL OR ([donViTinh]='luot' OR [donViTinh]='xe' OR [donViTinh]='m2' OR [donViTinh]='m3' OR [donViTinh]='kWh')))
GO
ALTER TABLE [dbo].[chiTietHoaDon] CHECK CONSTRAINT [CK_chiTietHoaDon_donViTinh]
GO
ALTER TABLE [dbo].[chiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [CK_chiTietHoaDon_loaiDichVu] CHECK  (([loaiDichVu]='DatTienIch' OR [loaiDichVu]='GuiXeMay' OR [loaiDichVu]='GuiXeOTo' OR [loaiDichVu]='PhiQuanLy' OR [loaiDichVu]='Nuoc' OR [loaiDichVu]='Dien'))
GO
ALTER TABLE [dbo].[chiTietHoaDon] CHECK CONSTRAINT [CK_chiTietHoaDon_loaiDichVu]
GO
ALTER TABLE [dbo].[cuDan]  WITH CHECK ADD  CONSTRAINT [CK_cuDan_loaiCuDan] CHECK  (([loaiCuDan]='KhachThue' OR [loaiCuDan]='ChuHo'))
GO
ALTER TABLE [dbo].[cuDan] CHECK CONSTRAINT [CK_cuDan_loaiCuDan]
GO
ALTER TABLE [dbo].[cuDan]  WITH CHECK ADD  CONSTRAINT [CK_cuDan_trangThai] CHECK  (([trangThai]='DaChuyenDi' OR [trangThai]='DangO'))
GO
ALTER TABLE [dbo].[cuDan] CHECK CONSTRAINT [CK_cuDan_trangThai]
GO
ALTER TABLE [dbo].[danhMucTienIch]  WITH CHECK ADD  CONSTRAINT [CK_danhMucTienIch_trangThaiHoatDong] CHECK  (([trangThaiHoatDong]='BaoTri' OR [trangThaiHoatDong]='TamNgung' OR [trangThaiHoatDong]='HoatDong'))
GO
ALTER TABLE [dbo].[danhMucTienIch] CHECK CONSTRAINT [CK_danhMucTienIch_trangThaiHoatDong]
GO
ALTER TABLE [dbo].[datLichTienIch]  WITH CHECK ADD  CONSTRAINT [CK_datLichTienIch_trangThai] CHECK  (([trangThai]='DaHuy' OR [trangThai]='HoanThanh' OR [trangThai]='DaDuyet' OR [trangThai]='ChoDuyet'))
GO
ALTER TABLE [dbo].[datLichTienIch] CHECK CONSTRAINT [CK_datLichTienIch_trangThai]
GO
ALTER TABLE [dbo].[giaoDichThanhToan]  WITH CHECK ADD  CONSTRAINT [CK_giaoDichThanhToan_phuongThuc] CHECK  (([phuongThuc]='QR' OR [phuongThuc]='ChuyenKhoan' OR [phuongThuc]='TienMat'))
GO
ALTER TABLE [dbo].[giaoDichThanhToan] CHECK CONSTRAINT [CK_giaoDichThanhToan_phuongThuc]
GO
ALTER TABLE [dbo].[giaoDichThanhToan]  WITH CHECK ADD  CONSTRAINT [CK_giaoDichThanhToan_trangThai] CHECK  (([trangThai]='ThatBai' OR [trangThai]='ThanhCong' OR [trangThai]='ChoXacNhan'))
GO
ALTER TABLE [dbo].[giaoDichThanhToan] CHECK CONSTRAINT [CK_giaoDichThanhToan_trangThai]
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD CHECK  (([thang]>=(1) AND [thang]<=(12)))
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD  CONSTRAINT [CK_hoaDon_thang] CHECK  (([thang]>=(1) AND [thang]<=(12)))
GO
ALTER TABLE [dbo].[hoaDon] CHECK CONSTRAINT [CK_hoaDon_thang]
GO
ALTER TABLE [dbo].[hoaDon]  WITH CHECK ADD  CONSTRAINT [CK_hoaDon_trangThaiThanhToan] CHECK  (([trangThaiThanhToan]='QuaHan' OR [trangThaiThanhToan]='DaThanhToan' OR [trangThaiThanhToan]='ChuaThanhToan'))
GO
ALTER TABLE [dbo].[hoaDon] CHECK CONSTRAINT [CK_hoaDon_trangThaiThanhToan]
GO
ALTER TABLE [dbo].[nhatKyCaTruc]  WITH CHECK ADD  CONSTRAINT [CK_nhatKyCaTruc_caTruc] CHECK  (([caTruc]='Dem' OR [caTruc]='Chieu' OR [caTruc]='Sang'))
GO
ALTER TABLE [dbo].[nhatKyCaTruc] CHECK CONSTRAINT [CK_nhatKyCaTruc_caTruc]
GO
ALTER TABLE [dbo].[nhatKyTuanTra]  WITH CHECK ADD  CONSTRAINT [CK_nhatKyTuanTra_soTang] CHECK  (([soTang]>=(1) AND [soTang]<=(25)))
GO
ALTER TABLE [dbo].[nhatKyTuanTra] CHECK CONSTRAINT [CK_nhatKyTuanTra_soTang]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [CK_phanAnhSuCo_loaiSuCo] CHECK  (([loaiSuCo]='Khac' OR [loaiSuCo]='VeSinh' OR [loaiSuCo]='AnNinh' OR [loaiSuCo]='PCCC' OR [loaiSuCo]='ThangMay' OR [loaiSuCo]='Nuoc' OR [loaiSuCo]='Dien'))
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [CK_phanAnhSuCo_loaiSuCo]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [CK_phanAnhSuCo_mucDoUuTien] CHECK  (([mucDoUuTien]='Thap' OR [mucDoUuTien]='TrungBinh' OR [mucDoUuTien]='Cao'))
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [CK_phanAnhSuCo_mucDoUuTien]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [CK_phanAnhSuCo_nguonGui] CHECK  (([nguonGui]='BaoVe' OR [nguonGui]='LeTan' OR [nguonGui]='CuDan'))
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [CK_phanAnhSuCo_nguonGui]
GO
ALTER TABLE [dbo].[phanAnhSuCo]  WITH CHECK ADD  CONSTRAINT [CK_phanAnhSuCo_trangThai] CHECK  (([trangThai]='Huy' OR [trangThai]='HoanThanh' OR [trangThai]='DangXuLy' OR [trangThai]='DaTiepNhan' OR [trangThai]='MoiTiepNhan'))
GO
ALTER TABLE [dbo].[phanAnhSuCo] CHECK CONSTRAINT [CK_phanAnhSuCo_trangThai]
GO
ALTER TABLE [dbo].[quanLyXe]  WITH CHECK ADD  CONSTRAINT [CK_quanLyXe_loaiXe] CHECK  (([loaiXe]='XeDap' OR [loaiXe]='XeMay' OR [loaiXe]='OTo'))
GO
ALTER TABLE [dbo].[quanLyXe] CHECK CONSTRAINT [CK_quanLyXe_loaiXe]
GO
ALTER TABLE [dbo].[taiKhoan]  WITH CHECK ADD  CONSTRAINT [CK_taiKhoan_boPhan_theoVaiTro] CHECK  ((([vaiTro]='NV' OR [vaiTro]='BQL') AND [boPhanCode] IS NOT NULL OR [vaiTro]='CD' AND [boPhanCode] IS NULL))
GO
ALTER TABLE [dbo].[taiKhoan] CHECK CONSTRAINT [CK_taiKhoan_boPhan_theoVaiTro]
GO
ALTER TABLE [dbo].[theTu]  WITH CHECK ADD  CONSTRAINT [CK_theTu_ngayHetHan] CHECK  (([ngayHetHan] IS NULL OR [ngayHetHan]>[ngayCap]))
GO
ALTER TABLE [dbo].[theTu] CHECK CONSTRAINT [CK_theTu_ngayHetHan]
GO
ALTER TABLE [dbo].[theTu]  WITH CHECK ADD  CONSTRAINT [CK_theTu_trangThai] CHECK  (([trangThai]='DaThuHoi' OR [trangThai]='TamKhoa' OR [trangThai]='DangSuDung'))
GO
ALTER TABLE [dbo].[theTu] CHECK CONSTRAINT [CK_theTu_trangThai]
GO
ALTER TABLE [dbo].[theTu_ChucNang]  WITH CHECK ADD  CONSTRAINT [CK_theTuChucNang_chucNang] CHECK  (([chucNang]='PhongGym' OR [chucNang]='HoBoi' OR [chucNang]='BaiXeMay' OR [chucNang]='BaiXeOTo' OR [chucNang]='ThangMay' OR [chucNang]='CuaChinh'))
GO
ALTER TABLE [dbo].[theTu_ChucNang] CHECK CONSTRAINT [CK_theTuChucNang_chucNang]
GO
ALTER TABLE [dbo].[thongBao]  WITH CHECK ADD  CONSTRAINT [CK_thongBao_doiTuong] CHECK  (([doiTuong]='CanHo' OR [doiTuong]='CuDan' OR [doiTuong]='NhanVien' OR [doiTuong]='TatCa'))
GO
ALTER TABLE [dbo].[thongBao] CHECK CONSTRAINT [CK_thongBao_doiTuong]
GO
ALTER TABLE [dbo].[thongBao]  WITH CHECK ADD  CONSTRAINT [CK_thongBao_loaiThongBao] CHECK  (([loaiThongBao]='NhacPhi' OR [loaiThongBao]='KhanCap' OR [loaiThongBao]='BaoTri' OR [loaiThongBao]='ThongThuong'))
GO
ALTER TABLE [dbo].[thongBao] CHECK CONSTRAINT [CK_thongBao_loaiThongBao]
GO
ALTER TABLE [dbo].[thongBao]  WITH CHECK ADD  CONSTRAINT [CK_thongBao_maCanHo_doiTuong] CHECK  (([doiTuong]='CanHo' AND [maCanHo] IS NOT NULL OR [doiTuong]<>'CanHo' AND [maCanHo] IS NULL))
GO
ALTER TABLE [dbo].[thongBao] CHECK CONSTRAINT [CK_thongBao_maCanHo_doiTuong]
GO
/****** Object:  StoredProcedure [dbo].[sp_BoPhieu]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_BoPhieu]
    @maBinhChon INT,
    @maPhuongAn INT,
    @maCuDan    INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cuoc binh chon phai dang mo va con han
    IF NOT EXISTS (SELECT 1 FROM dbo.binhChon
                   WHERE id = @maBinhChon
                     AND trangThai = N'DangMo'
                     AND hanChot > GETDATE())
    BEGIN
        RAISERROR(N'Cuoc binh chon da dong hoac het han', 16, 1);
        RETURN;
    END

    -- Phuong an phai thuoc dung cuoc binh chon
    IF NOT EXISTS (SELECT 1 FROM dbo.phuongAnBinhChon
                   WHERE id = @maPhuongAn AND maBinhChon = @maBinhChon)
    BEGIN
        RAISERROR(N'Phuong an khong thuoc cuoc binh chon nay', 16, 1);
        RETURN;
    END

    DECLARE @maCanHo INT;
    SELECT @maCanHo = maCanHo FROM dbo.cuDan WHERE id = @maCuDan;

    BEGIN TRY
        INSERT INTO dbo.phieuBau (maBinhChon, maPhuongAn, maCuDan, maCanHo)
        VALUES (@maBinhChon, @maPhuongAn, @maCuDan, @maCanHo);
        PRINT N'Bo phieu thanh cong';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() IN (2601, 2627)  -- vi pham UNIQUE
            RAISERROR(N'Can ho cua ban da bo phieu cho cuoc binh chon nay', 16, 1);
        ELSE
            THROW;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatKetQuaSuCo]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CapNhatKetQuaSuCo]
    @maPhanAnh   INT,
    @maNhanVien  INT,
    @anhSauXuLy  VARCHAR(255),
    @ghiChu      NVARCHAR(300) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM dbo.phanAnhSuCo
                   WHERE id = @maPhanAnh AND maNhanVien = @maNhanVien)
    BEGIN
        RAISERROR(N'Phieu khong ton tai hoac khong duoc giao cho nhan vien nay', 16, 1);
        RETURN;
    END

    UPDATE dbo.phanAnhSuCo
    SET trangThai = 'HoanThanh', anhSauXuLy = @anhSauXuLy, ngayHoanThanh = GETDATE()
    WHERE id = @maPhanAnh;

    INSERT INTO dbo.lichSuXuLySuCo (maPhanAnh, trangThai, ghiChu, maNhanVien)
    VALUES (@maPhanAnh, 'HoanThanh',
            ISNULL(@ghiChu, N'Da xu ly xong, kem anh nghiem thu'), @maNhanVien);
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DongBinhChon]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_DongBinhChon] @maBinhChon INT AS BEGIN     SET NOCOUNT ON;     IF NOT EXISTS (SELECT 1 FROM dbo.binhChon WHERE id = @maBinhChon AND trangThai = N'DangMo')     BEGIN         RAISERROR(N'Cuộc bình chọn không tồn tại hoặc đã đóng', 16, 1);         RETURN;     END     DECLARE @tongCan INT, @canDaBau INT, @tyLeThamGia DECIMAL(5,2), @tucSo DECIMAL(5,2);     SELECT @tongCan = ISNULL(tongCanHoLucMo, (SELECT COUNT(*) FROM dbo.canHo WHERE trangThai = N'DangO')),            @tucSo = tyLeTucSo     FROM dbo.binhChon WHERE id = @maBinhChon;     SELECT @canDaBau = COUNT(DISTINCT maCanHo) FROM dbo.phieuBau WHERE maBinhChon = @maBinhChon;     SET @tyLeThamGia = CASE WHEN @tongCan = 0 THEN 0 ELSE CAST(100.0 * @canDaBau / @tongCan AS DECIMAL(5,2)) END;     DECLARE @maxVotes INT = 0;     SELECT @maxVotes = ISNULL(MAX(t.soPhieu), 0) FROM (         SELECT pa.id, COUNT(pb.id) AS soPhieu FROM dbo.phuongAnBinhChon pa         LEFT JOIN dbo.phieuBau pb ON pb.maPhuongAn = pa.id         WHERE pa.maBinhChon = @maBinhChon GROUP BY pa.id, pa.noiDung     ) t;     DECLARE @countMax INT = 0, @phuongAnThang NVARCHAR(300) = NULL;     SELECT @countMax = COUNT(*), @phuongAnThang = MAX(pa.noiDung) FROM (         SELECT pa.id, pa.noiDung, COUNT(pb.id) AS soPhieu FROM dbo.phuongAnBinhChon pa         LEFT JOIN dbo.phieuBau pb ON pb.maPhuongAn = pa.id         WHERE pa.maBinhChon = @maBinhChon GROUP BY pa.id, pa.noiDung     ) pa WHERE pa.soPhieu = @maxVotes;     DECLARE @noiDungKetQua NVARCHAR(500);     IF @countMax >= 2     BEGIN         IF @tyLeThamGia >= @tucSo             SET @noiDungKetQua = N'Hòa phiếu — không có phương án nào được thông qua (' + CAST(@maxVotes AS NVARCHAR) + N' phiếu, tỷ lệ tham gia ' + CAST(@tyLeThamGia AS NVARCHAR) + N'%)';         ELSE             SET @noiDungKetQua = N'KHÔNG ĐỦ TÚC SỐ (' + CAST(@tyLeThamGia AS NVARCHAR) + N'% < ' + CAST(@tucSo AS NVARCHAR) + N'%). Hòa phiếu — không có phương án chiến thắng.';     END     ELSE     BEGIN         IF @tyLeThamGia >= @tucSo             SET @noiDungKetQua = N'Thông qua: "' + ISNULL(@phuongAnThang, N'') + N'" (' + CAST(@maxVotes AS NVARCHAR) + N' phiếu, tỷ lệ tham gia ' + CAST(@tyLeThamGia AS NVARCHAR) + N'%)';         ELSE             SET @noiDungKetQua = N'KHÔNG ĐỦ TÚC SỐ (' + CAST(@tyLeThamGia AS NVARCHAR) + N'% < ' + CAST(@tucSo AS NVARCHAR) + N'%). Kết quả chỉ mang tính tham khảo: "' + ISNULL(@phuongAnThang, N'') + N'"';     END     UPDATE dbo.binhChon SET trangThai = CASE WHEN @tyLeThamGia >= @tucSo THEN N'DaDong' ELSE N'KhongDuTucSo' END, ketQua = LEFT(@noiDungKetQua, 500) WHERE id = @maBinhChon;     SELECT id, cauHoi, trangThai, ketQua FROM dbo.binhChon WHERE id = @maBinhChon; END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GiaoViecSuCo]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GiaoViecSuCo]
    @maPhanAnh   INT,
    @maNhanVien  INT,
    @mucDoUuTien VARCHAR(10) = 'TrungBinh'
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM dbo.phanAnhSuCo WHERE id = @maPhanAnh)
    BEGIN
        RAISERROR(N'Phieu phan anh khong ton tai', 16, 1);
        RETURN;
    END

    UPDATE dbo.phanAnhSuCo
    SET maNhanVien = @maNhanVien, mucDoUuTien = @mucDoUuTien, trangThai = 'DangXuLy'
    WHERE id = @maPhanAnh;

    INSERT INTO dbo.lichSuXuLySuCo (maPhanAnh, trangThai, ghiChu, maNhanVien)
    VALUES (@maPhanAnh, 'DaPhanCong',
            N'Giao viec cho nhan vien ' + CAST(@maNhanVien AS NVARCHAR)
            + N', uu tien ' + @mucDoUuTien, @maNhanVien);
END

GO
/****** Object:  StoredProcedure [dbo].[sp_TaoTaiKhoan]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =====================================================================
   PHAN 3: STORED PROCEDURE SINH MA TAI KHOAN TU DONG
   ===================================================================== */
CREATE   PROCEDURE [dbo].[sp_TaoTaiKhoan]
    @vaiTro         VARCHAR(10),
    @boPhan         VARCHAR(10) = NULL,
    @tenDangNhap    VARCHAR(50),
    @matKhau        VARCHAR(255),
    @maTaiKhoanOut  VARCHAR(20) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF @vaiTro NOT IN ('BQL','NV','CD')
    BEGIN
        RAISERROR(N'Vai tro khong hop le (chi nhan BQL/NV/CD)', 16, 1);
        RETURN;
    END

    IF @vaiTro IN ('BQL','NV') AND (@boPhan IS NULL OR NOT EXISTS (SELECT 1 FROM danhMucBoPhan WHERE maBoPhan = @boPhan))
    BEGIN
        RAISERROR(N'BQL/NV bat buoc phai co bo phan hop le', 16, 1);
        RETURN;
    END

    DECLARE @soThuTu INT;
    DECLARE @maMoi   VARCHAR(20);

    IF @vaiTro = 'CD'
    BEGIN
        SELECT @soThuTu = COUNT(*) + 1 FROM taiKhoan WHERE vaiTro = 'CD';
        SET @maMoi = 'cd_' + FORMAT(@soThuTu, '00');

        INSERT INTO taiKhoan (maTaiKhoan, tenDangNhap, matKhau, vaiTro, boPhanCode, trangThaiHoatDong)
        VALUES (@maMoi, @tenDangNhap, @matKhau, @vaiTro, NULL, N'HoatDong');
    END
    ELSE
    BEGIN
        SELECT @soThuTu = COUNT(*) + 1 FROM taiKhoan WHERE vaiTro = @vaiTro AND boPhanCode = @boPhan;
        SET @maMoi = LOWER(@vaiTro) + '_' + LOWER(@boPhan) + FORMAT(@soThuTu, '00');

        INSERT INTO taiKhoan (maTaiKhoan, tenDangNhap, matKhau, vaiTro, boPhanCode, trangThaiHoatDong)
        VALUES (@maMoi, @tenDangNhap, @matKhau, @vaiTro, @boPhan, N'HoatDong');
    END

    SET @maTaiKhoanOut = @maMoi;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_XuatHoaDonHangLoat]    Script Date: 8/7/2026 7:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================
-- PHẦN 3 — SỬA LẠI STORED PROCEDURE sp_XuatHoaDonHangLoat
-- =======================================================================
CREATE   PROCEDURE [dbo].[sp_XuatHoaDonHangLoat]
    @thang INT,
    @nam INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Tính tháng/năm kỳ trước và ngày cuối kỳ hiện tại
        DECLARE @thangTruoc INT = CASE WHEN @thang = 1 THEN 12 ELSE @thang - 1 END;
        DECLARE @namTruoc INT = CASE WHEN @thang = 1 THEN @nam - 1 ELSE @nam END;
        DECLARE @ngayCuoiKy DATE = EOMONTH(DATEFROMPARTS(@nam, @thang, 1));

        -- 2. Tạo hóa đơn mới cho các căn hộ DangO chưa có hóa đơn kỳ này
        DECLARE @hoaDonMoi TABLE (maHoaDon INT PRIMARY KEY, maCanHo INT);

        INSERT INTO dbo.hoaDon (maCanHo, thang, nam, tongTien, trangThaiThanhToan)
        OUTPUT inserted.id, inserted.maCanHo INTO @hoaDonMoi (maHoaDon, maCanHo)
        SELECT c.id, @thang, @nam, 0, N'ChuaThanhToan'
        FROM dbo.canHo c
        WHERE c.trangThai = N'DangO'
          AND NOT EXISTS (
              SELECT 1 FROM dbo.hoaDon h
              WHERE h.maCanHo = c.id AND h.thang = @thang AND h.nam = @nam
          );

        -- 3. Biểu giá hiệu lực chung cho tất cả dịch vụ tại mốc @ngayCuoiKy
        IF OBJECT_ID('tempdb..#giaHieuLuc') IS NOT NULL DROP TABLE #giaHieuLuc;

        SELECT g.*
        INTO #giaHieuLuc
        FROM dbo.bieuGiaDichVu g
        WHERE g.hieuLucTu = (
            SELECT MAX(b2.hieuLucTu)
            FROM dbo.bieuGiaDichVu b2
            WHERE b2.loaiDichVu = g.loaiDichVu
              AND b2.hieuLucTu <= @ngayCuoiKy
        );

        -- 4. Điện & Nước: Tách bậc và sinh diễn giải
        IF OBJECT_ID('tempdb..#bacChiTiet') IS NOT NULL DROP TABLE #bacChiTiet;

        SELECT 
            t.maHoaDon,
            t.loaiDichVu,
            t.chiSoCu,
            t.chiSoMoi,
            t.soTieuThu,
            t.donViTinh,
            g.bacTu,
            g.bacDen,
            g.donGia,
            ROW_NUMBER() OVER (PARTITION BY t.maHoaDon, t.loaiDichVu ORDER BY g.bacTu) AS thuTuBac,
            (CASE 
                WHEN g.bacDen IS NULL OR t.soTieuThu < g.bacDen THEN t.soTieuThu 
                ELSE g.bacDen 
             END - g.bacTu) AS soLuongBac,
            ((CASE 
                WHEN g.bacDen IS NULL OR t.soTieuThu < g.bacDen THEN t.soTieuThu 
                ELSE g.bacDen 
             END - g.bacTu) * g.donGia) AS tienBac
        INTO #bacChiTiet
        FROM (
            SELECT 
                m.maHoaDon,
                c_moi.loaiDichVu,
                ISNULL(c_cu.chiSo, c_moi.chiSo) AS chiSoCu,
                c_moi.chiSo AS chiSoMoi,
                (c_moi.chiSo - ISNULL(c_cu.chiSo, c_moi.chiSo)) AS soTieuThu,
                CASE WHEN c_moi.loaiDichVu = 'Dien' THEN 'kWh' ELSE 'm3' END AS donViTinh
            FROM @hoaDonMoi m
            JOIN dbo.chiSoTieuThu c_moi 
              ON c_moi.maCanHo = m.maCanHo 
             AND c_moi.thang = @thang 
             AND c_moi.nam = @nam 
             AND c_moi.loaiDichVu IN ('Dien', 'Nuoc')
            LEFT JOIN dbo.chiSoTieuThu c_cu 
              ON c_cu.maCanHo = m.maCanHo 
             AND c_cu.thang = @thangTruoc 
             AND c_cu.nam = @namTruoc 
             AND c_cu.loaiDichVu = c_moi.loaiDichVu
        ) t
        JOIN #giaHieuLuc g 
          ON g.loaiDichVu = t.loaiDichVu 
         AND g.bacTu < t.soTieuThu;

        -- 4a. Thêm các dòng tiêu thụ > 0 (tính tiền + diễn giải tách bậc)
        INSERT INTO dbo.chiTietHoaDon (maHoaDon, loaiDichVu, chiSoCu, chiSoMoi, soLuong, donViTinh, donGia, thanhTien, dienGiai)
        SELECT 
            b.maHoaDon,
            b.loaiDichVu,
            b.chiSoCu,
            b.chiSoMoi,
            b.soTieuThu AS soLuong,
            b.donViTinh,
            NULL AS donGia,
            SUM(b.tienBac) AS thanhTien,
            STRING_AGG(
                N'Bậc ' + CAST(b.thuTuBac AS NVARCHAR) + N': ' 
                + FORMAT(b.soLuongBac, 'N0') + N' ' + b.donViTinh 
                + N' × ' + FORMAT(b.donGia, 'N0') + N'đ = ' 
                + FORMAT(b.tienBac, 'N0') + N'đ',
                N'; '
            ) WITHIN GROUP (ORDER BY b.bacTu) AS dienGiai
        FROM #bacChiTiet b
        GROUP BY b.maHoaDon, b.loaiDichVu, b.chiSoCu, b.chiSoMoi, b.soTieuThu, b.donViTinh;

        -- 4b. Thêm các dòng tiêu thụ <= 0 (kỳ đầu tiên hoặc không dùng)
        INSERT INTO dbo.chiTietHoaDon (maHoaDon, loaiDichVu, chiSoCu, chiSoMoi, soLuong, donViTinh, donGia, thanhTien, dienGiai)
        SELECT 
            m.maHoaDon,
            c_moi.loaiDichVu,
            ISNULL(c_cu.chiSo, c_moi.chiSo) AS chiSoCu,
            c_moi.chiSo AS chiSoMoi,
            (c_moi.chiSo - ISNULL(c_cu.chiSo, c_moi.chiSo)) AS soLuong,
            CASE WHEN c_moi.loaiDichVu = 'Dien' THEN 'kWh' ELSE 'm3' END AS donViTinh,
            NULL AS donGia,
            0 AS thanhTien,
            N'Kỳ đầu tiên, chưa có chỉ số kỳ trước để đối chiếu' AS dienGiai
        FROM @hoaDonMoi m
        JOIN dbo.chiSoTieuThu c_moi 
          ON c_moi.maCanHo = m.maCanHo 
         AND c_moi.thang = @thang 
         AND c_moi.nam = @nam 
         AND c_moi.loaiDichVu IN ('Dien', 'Nuoc')
        LEFT JOIN dbo.chiSoTieuThu c_cu 
          ON c_cu.maCanHo = m.maCanHo 
         AND c_cu.thang = @thangTruoc 
         AND c_cu.nam = @namTruoc 
         AND c_cu.loaiDichVu = c_moi.loaiDichVu
        WHERE (c_moi.chiSo - ISNULL(c_cu.chiSo, c_moi.chiSo)) <= 0;

        -- 5. Phí quản lý: theo diện tích m² sàn (soLuong = dienTich, donViTinh = 'm2', donGia = g.donGia)
        INSERT INTO dbo.chiTietHoaDon (maHoaDon, loaiDichVu, soLuong, donViTinh, donGia, thanhTien)
        SELECT m.maHoaDon, 'PhiQuanLy', c.dienTich, 'm2', g.donGia, c.dienTich * g.donGia
        FROM @hoaDonMoi m
        JOIN dbo.canHo c ON c.id = m.maCanHo
        JOIN #giaHieuLuc g ON g.loaiDichVu = 'PhiQuanLy';

        -- 6. Gửi xe: đếm số xe nhân đơn giá (soLuong = COUNT, donViTinh = 'xe', donGia = g.donGia)
        INSERT INTO dbo.chiTietHoaDon (maHoaDon, loaiDichVu, soLuong, donViTinh, donGia, thanhTien)
        SELECT 
            m.maHoaDon,
            CASE WHEN x.loaiXe = 'OTo' THEN 'GuiXeOTo' ELSE 'GuiXeMay' END AS loaiDichVu,
            COUNT(x.id) AS soLuong,
            'xe' AS donViTinh,
            g.donGia AS donGia,
            COUNT(x.id) * g.donGia AS thanhTien
        FROM @hoaDonMoi m
        JOIN dbo.quanLyXe x ON x.maCanHo = m.maCanHo
        JOIN #giaHieuLuc g ON g.loaiDichVu = CASE WHEN x.loaiXe = 'OTo' THEN 'GuiXeOTo' ELSE 'GuiXeMay' END
        GROUP BY m.maHoaDon, x.loaiXe, g.donGia;

        -- 7. Đặt tiện ích: gộp theo lượt (soLuong = COUNT, donViTinh = 'luot', donGia = NULL)
        INSERT INTO dbo.chiTietHoaDon (maHoaDon, loaiDichVu, soLuong, donViTinh, donGia, thanhTien)
        SELECT 
            m.maHoaDon,
            'DatTienIch' AS loaiDichVu,
            COUNT(d.id) AS soLuong,
            'luot' AS donViTinh,
            NULL AS donGia,
            SUM(d.giaTien) AS thanhTien
        FROM @hoaDonMoi m
        JOIN dbo.datLichTienIch d ON d.maCanHo = m.maCanHo
        WHERE MONTH(d.ngayDat) = @thang 
          AND YEAR(d.ngayDat) = @nam
          AND d.trangThai IN ('DaDuyet', 'HoanThanh')
        GROUP BY m.maHoaDon
        HAVING SUM(d.giaTien) > 0;

        -- 8. Chốt tổng tiền cho hóa đơn vừa tạo
        UPDATE h 
        SET h.tongTien = ISNULL(t.tong, 0)
        FROM dbo.hoaDon h
        JOIN @hoaDonMoi m ON m.maHoaDon = h.id
        OUTER APPLY (
            SELECT SUM(ct.thanhTien) AS tong 
            FROM dbo.chiTietHoaDon ct
            WHERE ct.maHoaDon = h.id
        ) t;

        COMMIT TRANSACTION;

        -- 9. Trả về 2 Result Sets
        -- Result Set 1: Danh sách hóa đơn vừa tạo
        SELECT h.id AS maHoaDon, h.maCanHo, c.soPhong, h.tongTien
        FROM dbo.hoaDon h
        JOIN @hoaDonMoi m ON m.maHoaDon = h.id
        JOIN dbo.canHo c ON c.id = h.maCanHo
        ORDER BY h.id ASC;

        -- Result Set 2: Cảnh báo căn hộ DangO thiếu chỉ số Điện/Nước, chỉ số âm, hoặc thiếu diện tích
        SELECT c.id AS maCanHo, c.soPhong, req.loaiDichVu, N'Thiếu chỉ số kỳ này' AS lyDo
        FROM dbo.canHo c
        CROSS JOIN (VALUES ('Dien'), ('Nuoc')) AS req(loaiDichVu)
        JOIN @hoaDonMoi m ON m.maCanHo = c.id
        WHERE NOT EXISTS (
            SELECT 1 FROM dbo.chiSoTieuThu s
            WHERE s.maCanHo = c.id AND s.loaiDichVu = req.loaiDichVu
              AND s.thang = @thang AND s.nam = @nam
        )
        UNION ALL
        SELECT c.id AS maCanHo, c.soPhong, ct.loaiDichVu, N'Chỉ số âm (số mới < số cũ)' AS lyDo
        FROM @hoaDonMoi m
        JOIN dbo.canHo c ON c.id = m.maCanHo
        JOIN dbo.chiTietHoaDon ct ON ct.maHoaDon = m.maHoaDon
        WHERE ct.loaiDichVu IN ('Dien', 'Nuoc') AND ct.chiSoMoi < ct.chiSoCu
        UNION ALL
        SELECT c.id AS maCanHo, c.soPhong, 'PhiQuanLy' AS loaiDichVu, N'Diện tích chưa nhập hoặc <= 0' AS lyDo
        FROM @hoaDonMoi m
        JOIN dbo.canHo c ON c.id = m.maCanHo
        WHERE c.dienTich IS NULL OR c.dienTich <= 0;

    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [QLCCNew2] SET  READ_WRITE 
GO
