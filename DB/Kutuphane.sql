USE [master]
GO
/****** Object:  Database [KütüphaneOtomasyonu]    Script Date: 7.06.2022 04:04:41 ******/
CREATE DATABASE [KütüphaneOtomasyonu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KütüphaneOtomasyonu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KütüphaneOtomasyonu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KütüphaneOtomasyonu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KütüphaneOtomasyonu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KütüphaneOtomasyonu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ARITHABORT OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET  MULTI_USER 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET QUERY_STORE = OFF
GO
USE [KütüphaneOtomasyonu]
GO
/****** Object:  Table [dbo].[Kayitlar]    Script Date: 7.06.2022 04:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kayitlar](
	[kayit_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_id] [int] NULL,
	[kitap_id] [int] NULL,
	[alis_tarih] [datetime] NULL,
	[teslim_tarih] [datetime] NULL,
	[durum] [bit] NULL,
 CONSTRAINT [PK_Kayitlar] PRIMARY KEY CLUSTERED 
(
	[kayit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kaynaklar]    Script Date: 7.06.2022 04:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kaynaklar](
	[kaynak_id] [int] IDENTITY(1,1) NOT NULL,
	[kaynak_ad] [nvarchar](50) NULL,
	[kaynak_yazar] [nvarchar](50) NULL,
	[kaynak_yayıncı] [nvarchar](50) NULL,
	[kaynak_sayfasayısı] [int] NULL,
	[kaynak_basımtarihi] [datetime] NULL,
 CONSTRAINT [PK_Kaynaklar] PRIMARY KEY CLUSTERED 
(
	[kaynak_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 7.06.2022 04:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[kullanici_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_ad] [nvarchar](50) NULL,
	[kullanici_soyad] [nvarchar](50) NULL,
	[kullanici_tc] [nvarchar](11) NULL,
	[kullanici_mail] [nvarchar](50) NULL,
	[kullanici_tel] [nvarchar](11) NULL,
	[kullanici_ceza] [float] NULL,
	[kullanici_cinsiyet] [nvarchar](1) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[kullanici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelTable]    Script Date: 7.06.2022 04:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelTable](
	[personel_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_ad] [nvarchar](50) NULL,
	[personel_soyad] [nvarchar](50) NULL,
	[personel_tc] [nvarchar](11) NULL,
	[personel_tel] [nvarchar](11) NULL,
	[personel_mail] [nvarchar](50) NULL,
	[personel_kullaniciadi] [nvarchar](50) NULL,
	[personel_sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonelTable] PRIMARY KEY CLUSTERED 
(
	[personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kayitlar] ON 

INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (1, 2, 4, CAST(N'2015-01-05T00:00:00.000' AS DateTime), CAST(N'2015-01-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (2, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (3, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (4, 2, 4, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (5, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (6, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (7, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (8, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (9, 3, 4, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (10, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (11, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (12, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (13, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (14, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (15, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (16, 2, 3, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (17, 2, 4, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (18, 2, 4, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Kayitlar] ([kayit_id], [kullanici_id], [kitap_id], [alis_tarih], [teslim_tarih], [durum]) VALUES (19, 2, 4, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-19T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Kayitlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kaynaklar] ON 

INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (3, N'İz Bıraktığın Kadar Varsın', N'Esra Ezmeci', N'Destek Yayınları', 55, CAST(N'2015-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (4, N'Kararı Ben Veriririm', N'Esra Ezmeci', N'Destek Yayınları', 79, CAST(N'2019-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (7, N'Şimdi Onlar Düşünsün', N'Bircan Yıldırım', N'Destek Yayınları', 45, CAST(N'2021-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (8, N'Geliştiren Anne-Baba', N'Doğan Cüceoğlu', N'Kronik Kitap', 99, CAST(N'2021-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (9, N'Gece Yarısı Kütüphanesi', N'Matt Haig', N'Domingo Yayınevi', 105, CAST(N'2021-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (10, N'Enkaz Altındakiler', N'Beyza Alkoç', N'İndigo Kitap', 452, CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (11, N'Kozmos', N'Carl Sagan', N'Altın Kitaplar', 250, CAST(N'2021-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (12, N'Elif''in Şems''i ', N'Elen Vera', N'Platanus Publishing', 198, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (13, N'Balıkçı ve Oğlu', N'Zülfü Livaneli', N'İnkılap Kitabevi', 95, CAST(N'2020-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (14, N'Altıncı Koğuş', N'Anton Pavloviç Çehov', N'İş Bankası Kültür Yayınları', 52, CAST(N'2018-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (15, N'Dönüşüm', N'Franz Kafka', N'İş Bankası Kültür Yayınları', 68, CAST(N'2018-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (16, N'Değirmen ', N'Sabahattin Ali', N'Yapı Kredi Yayınları', 35, CAST(N'2015-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (17, N'Satranç', N'Stefan Zweig', N'İş Bankası Kültür Yayınları', 65, CAST(N'2015-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (18, N'Küçük Prens ', N'Antoine de Saint-Exupery', N'Can Çocuk Yayınları', 102, CAST(N'2020-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Kaynaklar] ([kaynak_id], [kaynak_ad], [kaynak_yazar], [kaynak_yayıncı], [kaynak_sayfasayısı], [kaynak_basımtarihi]) VALUES (19, N'Derinde Saklı', N'Burcu Alşan', N'Doğan Kitap', 152, CAST(N'2021-05-09T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Kaynaklar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([kullanici_id], [kullanici_ad], [kullanici_soyad], [kullanici_tc], [kullanici_mail], [kullanici_tel], [kullanici_ceza], [kullanici_cinsiyet]) VALUES (2, N'Hatice', N'Atamer', N'12312312312', N'sadfqegqergqerg', N'12121212123', 0, NULL)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [kullanici_ad], [kullanici_soyad], [kullanici_tc], [kullanici_mail], [kullanici_tel], [kullanici_ceza], [kullanici_cinsiyet]) VALUES (3, N'Meltem', N'Güven', N'11223344556', N'sdfwdfgsfdg', N'11223344556', 365, NULL)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelTable] ON 

INSERT [dbo].[PersonelTable] ([personel_id], [personel_ad], [personel_soyad], [personel_tc], [personel_tel], [personel_mail], [personel_kullaniciadi], [personel_sifre]) VALUES (1, N'sefa', N'gülmez', N'01234567891', N'05425784565', N'sefa@gmail.com', N'sefa.gülmez', N'sefa')
INSERT [dbo].[PersonelTable] ([personel_id], [personel_ad], [personel_soyad], [personel_tc], [personel_tel], [personel_mail], [personel_kullaniciadi], [personel_sifre]) VALUES (2, N'yusuf', N'akkobak', N'01234567899', N'05425789874', N'yusug@gmail.com', N'yusuf', N'akkobak')
INSERT [dbo].[PersonelTable] ([personel_id], [personel_ad], [personel_soyad], [personel_tc], [personel_tel], [personel_mail], [personel_kullaniciadi], [personel_sifre]) VALUES (3, N'sefa', N'gülmez', N'11111111111', N'12222222222', N'sefagsdg', N'sefa', N'grammer')
SET IDENTITY_INSERT [dbo].[PersonelTable] OFF
GO
ALTER TABLE [dbo].[Kayitlar]  WITH CHECK ADD  CONSTRAINT [FK_Kayitlar_Kaynaklar] FOREIGN KEY([kitap_id])
REFERENCES [dbo].[Kaynaklar] ([kaynak_id])
GO
ALTER TABLE [dbo].[Kayitlar] CHECK CONSTRAINT [FK_Kayitlar_Kaynaklar]
GO
ALTER TABLE [dbo].[Kayitlar]  WITH CHECK ADD  CONSTRAINT [FK_Kayitlar_Kullanicilar] FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[Kullanicilar] ([kullanici_id])
GO
ALTER TABLE [dbo].[Kayitlar] CHECK CONSTRAINT [FK_Kayitlar_Kullanicilar]
GO
USE [master]
GO
ALTER DATABASE [KütüphaneOtomasyonu] SET  READ_WRITE 
GO
