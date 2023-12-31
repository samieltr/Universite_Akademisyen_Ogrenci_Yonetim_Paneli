USE [OgrenciSinav]
GO
/****** Object:  Table [dbo].[TblDersler]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDersler](
	[Dersid] [int] IDENTITY(1,1) NOT NULL,
	[DersAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblDersler] PRIMARY KEY CLUSTERED 
(
	[Dersid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOgrenci]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOgrenci](
	[Ogrid] [int] IDENTITY(1,1) NOT NULL,
	[OgrAd] [nvarchar](50) NULL,
	[OgrSoyad] [nvarchar](50) NULL,
	[OgrNumara] [char](5) NULL,
	[OgrSifre] [nvarchar](10) NULL,
	[OgrMail] [nvarchar](50) NULL,
	[OgrResim] [nvarchar](100) NULL,
	[OgrBolum] [int] NULL,
	[OgrDurum] [bit] NULL,
 CONSTRAINT [PK_TblOgrenci] PRIMARY KEY CLUSTERED 
(
	[Ogrid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblNotlar]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblNotlar](
	[Notid] [int] IDENTITY(1,1) NOT NULL,
	[Sinav1] [int] NULL,
	[Sinav2] [int] NULL,
	[Sinav3] [int] NULL,
	[Quiz1] [int] NULL,
	[Quiz2] [int] NULL,
	[Proje] [int] NULL,
	[Ortalama] [decimal](5, 2) NULL,
	[Ders] [int] NULL,
	[Ogrenci] [int] NULL,
 CONSTRAINT [PK_TblNotlar] PRIMARY KEY CLUSTERED 
(
	[Notid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.TblNotlar.Notid, dbo.TblOgrenci.OgrAd, dbo.TblOgrenci.OgrSoyad, dbo.TblDersler.DersAd, dbo.TblNotlar.Sinav1, dbo.TblNotlar.Sinav2, dbo.TblNotlar.Sinav3, dbo.TblNotlar.Quiz1, dbo.TblNotlar.Quiz2, dbo.TblNotlar.Proje, 
                         dbo.TblNotlar.Ortalama
FROM            dbo.TblNotlar INNER JOIN
                         dbo.TblDersler ON dbo.TblNotlar.Ders = dbo.TblDersler.Dersid INNER JOIN
                         dbo.TblOgrenci ON dbo.TblNotlar.Ogrenci = dbo.TblOgrenci.Ogrid
GO
/****** Object:  View [dbo].[View_2]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.TblNotlar.Notid, dbo.TblOgrenci.OgrAd, dbo.TblOgrenci.OgrSoyad, dbo.TblOgrenci.OgrNumara, dbo.TblDersler.DersAd, dbo.TblNotlar.Sinav1, dbo.TblNotlar.Sinav2, dbo.TblNotlar.Sinav3, dbo.TblNotlar.Quiz1, 
                         dbo.TblNotlar.Quiz2, dbo.TblNotlar.Proje, dbo.TblNotlar.Ortalama
FROM            dbo.TblOgrenci INNER JOIN
                         dbo.TblNotlar ON dbo.TblOgrenci.Ogrid = dbo.TblNotlar.Ogrenci INNER JOIN
                         dbo.TblDersler ON dbo.TblNotlar.Ders = dbo.TblDersler.Dersid
GO
/****** Object:  Table [dbo].[TblAkademisyen]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAkademisyen](
	[Akademisyenid] [int] IDENTITY(1,1) NOT NULL,
	[AkademisyenAd] [nvarchar](30) NULL,
	[AkademisyenSoyad] [nvarchar](30) NULL,
	[Unvan] [nvarchar](30) NULL,
	[AkademisyenNumara] [char](5) NULL,
	[AkademisyenSifre] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Akademisyenid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblBolum]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblBolum](
	[Bolumid] [int] IDENTITY(1,1) NOT NULL,
	[BolumAd] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Bolumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblAkademisyen] ON 

INSERT [dbo].[TblAkademisyen] ([Akademisyenid], [AkademisyenAd], [AkademisyenSoyad], [Unvan], [AkademisyenNumara], [AkademisyenSifre]) VALUES (3, N'Samet', N'Erten', N'Rektör', N'1    ', N'1')
SET IDENTITY_INSERT [dbo].[TblAkademisyen] OFF
GO
SET IDENTITY_INSERT [dbo].[TblBolum] ON 

INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (1, N'Yazılım Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (2, N'Endüstri Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (3, N'Makine Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (4, N'Otomotiv Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (5, N'Yapay Zeka Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (6, N'Bilgisayar Programcılığı')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (7, N'Mekatronik Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (8, N'İnşaat Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (9, N'Genetik Mühendisliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (11, N'Moleküler Biyoloji')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (12, N'Uçak Bakım Onarım')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (13, N'Veri Madenciliği')
INSERT [dbo].[TblBolum] ([Bolumid], [BolumAd]) VALUES (14, N'Matematik Mühendisliği')
SET IDENTITY_INSERT [dbo].[TblBolum] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDersler] ON 

INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (1, N'Algoritma ve Programlama')
INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (2, N'Veri Analizi')
INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (3, N'C# Nesne Tabanlı Programlama')
INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (4, N'Yapay Zeka Programlama')
INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (5, N'Veri Yapıları')
INSERT [dbo].[TblDersler] ([Dersid], [DersAd]) VALUES (6, N'E-Ticaret ve Pazarlama')
SET IDENTITY_INSERT [dbo].[TblDersler] OFF
GO
SET IDENTITY_INSERT [dbo].[TblNotlar] ON 

INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (1, 89, 76, 90, 90, 88, 100, CAST(88.00 AS Decimal(5, 2)), 3, 2)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (2, 100, 100, 100, 90, 90, 90, CAST(95.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (3, 100, 90, 89, 90, 56, 60, CAST(80.00 AS Decimal(5, 2)), 3, 3)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (4, 100, 90, 89, 90, 56, 90, CAST(85.00 AS Decimal(5, 2)), 3, 4)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (5, 100, 90, 25, 90, 56, 90, CAST(75.00 AS Decimal(5, 2)), 2, 5)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (6, 100, 25, 25, 90, 56, 90, CAST(64.00 AS Decimal(5, 2)), 2, 6)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (7, 100, 25, 25, 65, 56, 90, CAST(60.00 AS Decimal(5, 2)), 5, 7)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (8, 75, 67, 45, 65, 56, 90, CAST(66.00 AS Decimal(5, 2)), 4, 8)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (9, 75, 67, 45, 65, 56, 90, CAST(66.00 AS Decimal(5, 2)), 2, 9)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (10, 100, 67, 100, 65, 56, 90, CAST(79.00 AS Decimal(5, 2)), 1, 10)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (11, 27, 67, 100, 65, 56, 90, CAST(67.00 AS Decimal(5, 2)), 5, 11)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (12, 100, 96, 56, 89, 65, 75, CAST(80.00 AS Decimal(5, 2)), 1, 14)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (13, 100, 100, 100, 90, 90, 90, CAST(95.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (14, 100, 90, 90, 75, 75, 100, CAST(88.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[TblNotlar] ([Notid], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (15, 55, 65, 45, 55, 45, 50, CAST(52.00 AS Decimal(5, 2)), 2, 6)
SET IDENTITY_INSERT [dbo].[TblNotlar] OFF
GO
SET IDENTITY_INSERT [dbo].[TblOgrenci] ON 

INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (1, N'Samet', N'Erten', N'1    ', N'1', N'sametertenyb@gmail.com', N'C:\Users\samet\OneDrive\Masaüstü\Erkek.png', 6, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (2, N'Gözde', N'Erten', N'12643', N'g', N'gozde@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 1, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (3, N'Ayşe', N'Gül', N'21357', N'a', N'ayse@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 2, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (4, N'Mesut', N'Çınar', N'11273', N'm', N'mesut@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Erkek.png', 6, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (5, N'Ali', N'Veysel', N'98066', N'a', N'ali@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Erkek.png', 7, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (6, N'Ahmet', N'Türk', N'54216', N'a', N'ahmet@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Erkek.png', 3, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (7, N'Meliha', N'Sargın', N'28375', N'm', N'meliha@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 5, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (8, N'Tuğba', N'Erten', N'21356', N't', N'tugba@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 2, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (9, N'Sevgi', N'Yılmaz', N'11239', N's', N'sevgi@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 9, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (10, N'Zeliha', N'Ertürk', N'45683', N'z', N'zeliha@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 1, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (11, N'Zeynep', N'İbrahimov', N'12390', N'z', N'zeynep@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 11, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (14, N'Serpil', N'Çakmak', N'76543', N'123', N'serpil@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 4, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (15, N'Steve', N'Jobs', N'10455', N'steve', N'steve@apple.com', N'C:\Users\samet\OneDrive\Masaüstü\Erkek.png', 1, 1)
INSERT [dbo].[TblOgrenci] ([Ogrid], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (16, N'Julia', N'Patric', N'76543', N'123', N'julia@mail.com', N'C:\Users\samet\OneDrive\Masaüstü\Kadin.png', 1, 1)
SET IDENTITY_INSERT [dbo].[TblOgrenci] OFF
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblDersler] FOREIGN KEY([Ders])
REFERENCES [dbo].[TblDersler] ([Dersid])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblDersler]
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblOgrenci] FOREIGN KEY([Ogrenci])
REFERENCES [dbo].[TblOgrenci] ([Ogrid])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblOgrenci]
GO
ALTER TABLE [dbo].[TblOgrenci]  WITH CHECK ADD  CONSTRAINT [FK_TblOgrenci_TblBolum] FOREIGN KEY([OgrBolum])
REFERENCES [dbo].[TblBolum] ([Bolumid])
GO
ALTER TABLE [dbo].[TblOgrenci] CHECK CONSTRAINT [FK_TblOgrenci_TblBolum]
GO
/****** Object:  StoredProcedure [dbo].[Notlar]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Notlar]
AS
Select Notid as 'Not ID',DersAd as 'Ders Adı',OgrAd+' '+OgrSoyad as 'Öğrenci',Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,proje as 'Proje',Ortalama From TblNotlar
inner join TblDersler on TblNotlar.Ders=TblDersler.Dersid
inner join TblOgrenci on TblNotlar.Ogrenci=TblOgrenci.Ogrid
GO
/****** Object:  StoredProcedure [dbo].[Notlar2]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Notlar2]
AS
Select Notid as 'Not ID',DersAd as 'Ders Adı',OgrAd+' '+OgrSoyad as 'Öğrenci',Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,proje as 'Proje',Ortalama From TblNotlar
inner join TblDersler on TblNotlar.Ders=TblDersler.Dersid
inner join TblOgrenci on TblNotlar.Ogrenci=TblOgrenci.Ogrid
GO
/****** Object:  StoredProcedure [dbo].[Notlar3]    Script Date: 11.12.2023 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Notlar3]
AS
Select Notid as 'Not ID',DersAd as 'Ders Adı',OgrAd+' '+OgrSoyad as 'Öğrenci',Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,proje as 'Proje',Ortalama,Ogrenci From TblNotlar
inner join TblDersler on TblNotlar.Ders=TblDersler.Dersid
inner join TblOgrenci on TblNotlar.Ogrenci=TblOgrenci.Ogrid
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TblNotlar"
            Begin Extent = 
               Top = 42
               Left = 184
               Bottom = 290
               Right = 354
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblDersler"
            Begin Extent = 
               Top = 1
               Left = 626
               Bottom = 97
               Right = 796
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblOgrenci"
            Begin Extent = 
               Top = 119
               Left = 630
               Bottom = 331
               Right = 973
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TblOgrenci"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 283
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblNotlar"
            Begin Extent = 
               Top = 11
               Left = 442
               Bottom = 277
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblDersler"
            Begin Extent = 
               Top = 37
               Left = 796
               Bottom = 255
               Right = 966
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
