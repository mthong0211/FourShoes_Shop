USE [master]
GO
/****** Object:  Database [Shoes3]    Script Date: 7/7/2023 4:33:04 AM ******/
CREATE DATABASE [Shoes3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shoes3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shoes3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shoes3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shoes3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shoes3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shoes3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shoes3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shoes3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shoes3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shoes3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shoes3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shoes3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shoes3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shoes3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shoes3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shoes3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shoes3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shoes3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shoes3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shoes3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shoes3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shoes3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shoes3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shoes3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shoes3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shoes3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shoes3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shoes3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shoes3] SET RECOVERY FULL 
GO
ALTER DATABASE [Shoes3] SET  MULTI_USER 
GO
ALTER DATABASE [Shoes3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shoes3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shoes3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shoes3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shoes3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shoes3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shoes3', N'ON'
GO
ALTER DATABASE [Shoes3] SET QUERY_STORE = OFF
GO
USE [Shoes3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/7/2023 4:33:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[A_id] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[isAdmin] [int] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[A_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/7/2023 4:33:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[O_id] [int] NOT NULL,
	[P_id] [int] NULL,
	[C_id] [int] NULL,
	[price] [float] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[O_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/7/2023 4:33:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_id] [int] IDENTITY(1,1) NOT NULL,
	[P_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[brand] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[stock] [int] NULL,
	[status] [int] NULL,
	[des] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (1, N'loc12', N'827ccb0eea8a706c4c34a16891f84e7b', 1, N'locdtce170077@fpt.edu.vn')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (2, N'loi', N'3664940859edd8b28137801625a24524', 0, N'loihhca171233@fpt.edu.vn')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (3, N'nhat', N'ae77ce193db16dd814859af97c312f74', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (4, N'tahoangtrong', N'eadf4a44b227470564747ca9ee9bdcaa', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (5, N'khanhce', N'7e35f0077b1327eefbdfcee6f336410e', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (6, N'nguyentronghoang', N'1234567', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (14, N'loc123456', N'bcbe3365e6ac95ea2c0343a2395834dd', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (15, N'loc789', N'25d55ad283aa400af464c76d713c07ad', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (16, N'loi123', N'202cb962ac59075b964b07152d234b70', 0, N'loihhca171233@fpt.edu.vn')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (17, N'loi1234', N'202cb962ac59075b964b07152d234b70', 0, N'loihhca171233@fpt.edu.vn')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (18, N'loi12345', N'81dc9bdb52d04dc20036dbd8313ed055', 0, N'loihhca171233@fpt.edu.vn')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (19, N'loi0910', N'e10adc3949ba59abbe56e057f20f883e', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (20, N'loc0910', N'e10adc3949ba59abbe56e057f20f883e', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (21, N'loc0911', N'81dc9bdb52d04dc20036dbd8313ed055', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (22, N'loc0912', N'827ccb0eea8a706c4c34a16891f84e7b', 0, N'hungloipro123@gmail.com')
INSERT [dbo].[Account] ([A_id], [user], [pass], [isAdmin], [Email]) VALUES (23, N'nguyenvana', N'386a61898531ee23f2f15efcee263819', 0, N'daudaihoc2021@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Order] ([O_id], [P_id], [C_id], [price], [date]) VALUES (1, 1, 1, 1000, CAST(N'2023-10-06T00:06:32.000' AS DateTime))
INSERT [dbo].[Order] ([O_id], [P_id], [C_id], [price], [date]) VALUES (2, 2, 2, 2000, CAST(N'2023-01-10T10:05:28.000' AS DateTime))
INSERT [dbo].[Order] ([O_id], [P_id], [C_id], [price], [date]) VALUES (3, 13, 3, 900, CAST(N'2023-06-20T08:33:05.363' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (1, N'Air Force 1', 49, N'Nike', N'https://images.unsplash.com/photo-1641792669610-83e23d551bec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bmlrZSUyMGFpciUyMGZvcmNlJTIwMXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80', 12, 1, N'The radiance lives on in the Nike Air Force 1 ''07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.')
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (2, N'Blazer', 99, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/9dc2ee60-d9bc-4bee-92fa-b1e053ff2b26/blazer-low-77-jumbo-shoes-mvhvNn.png', 50, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (3, N'Jordan 1', 150, N'Nike', N'data:image/jpeg;base64,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', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (13, N'Vans Old skool', 900, N'Vans', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLmMvDefXkgXX4o-GgrQ52DAntCE368buro76oOb7TfQthIRTk', 20, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (14, N'Era', 39, N'Vans', N'data:image/jpeg;base64,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', 15, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (15, N'Yeezy Boost 350 V2 Bone', 110, N'Adidas', N'https://cdn.shopify.com/s/files/1/0594/7781/9562/products/Adidas-Yeezy-350-V2-Bone-Wethenew-1_2000x_55746a9b-1719-4603-9278-767b99c12eb8.png?v=1674662380', 5, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (16, N'Ultra Boost 4.0 Grey', 120, N'Adidas', N'https://admin.thegioigiay.com/files/289/giay-the-thao-adidas-ultra-boost-4-0-wmns-grey-mau-xam-5fb224422d568-16112020140330-5fb87f50e6424.jpg', 15, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (17, N'Yeezy Boost 350 V2 Black Red', 449, N'Adidas', N'https://www.kicksonfire.com/wp-content/uploads/2020/12/adidas-Yeezy-Boost-350-v2-Black-Red-Bred-2020.jpg', 5, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (18, N'Yeezy Boost 350 V2 Zebra', 469, N'Adidas', N'https://cdn.shopify.com/s/files/1/0319/9913/1780/products/zebra_2048x2048.png?v=1649488163', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (19, N'Ultra Boost Cloud White', 169, N'Adidas', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f97d22f5b3af403ab63a5ba083e9edef_9366/Ultraboost_Light_Shoes_White_GY9350_HM3_hover.jpg', 5, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (20, N'Ultra Boost', 189, N'Adidas', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/603054f90779462f92ccbc56321755e9_9366/Ultraboost_Light_Shoes_Black_GY9351_HM3_hover.jpg', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (21, N'Nike Air Max 90', 159, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/fae76b88-93ac-4eb7-813c-ac247e8161cf/air-max-90-futura-shoes-CL8cvW.png', 5, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (22, N'Nike Air Max Excee', 129, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a807e808-00f3-4eef-8881-7518fb1be5eb/air-max-excee-shoes-MxgpKq.png', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (23, N'Nike Air Max 270', 191, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5694f621-e45c-44d7-b9ea-e58cadf72c3e/air-max-270-shoes-V4DfZQ.png', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (24, N'Nike Air Max Dawn', 153, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/1179fcfd-66fb-47fd-abd6-f2291c7599b9/air-max-dawn-shoes-tx7TpB.png', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (25, N'Nike Air Max Plus SE', 152, N'Nike', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/c9f9b4cd-7d6b-4e20-bc4b-a98c5cf78b63/air-max-plus-se-shoes-hH93Cl.png', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (26, N'Super Star Core Black', 113, N'Adidas', N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSzi1eV8KI9qeeHRCDl04NFquon23bj5d-_JyRQ6tdvs4g57wAx', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (27, N'Super Star Cloud White', 113, N'Adidas', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSDtZ8jRjXMQov4kosfjMu7cWmWsc_XGe0dh5u2YYJcojOmZ6ub', 10, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (28, N'NMD_R1 PRIMEBLUE Core Black', 169, N'Adidas', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ2AMc9oK0ZXSrKns1jWeLQFvvKmchbAdFYZS5WJ60ArD7NLK9A', 20, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (29, N'NMD_R1 PRIMEBLUE Core White', 179, N'Adidas', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS__1cjneyyb-CUlP8d7eBpl97imT1ypCOSXVT3jrZQNUQECmCj', 20, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (30, N'NMD_R1 PRIMEBLUE Grey Five', 159, N'Adidas', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRWD6D4ITAGGhjPy6ZbxdTu9ZgKmKNVHuatH3nAkDuGmiIVTZcq', 20, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (31, N'Vans UA Old Skool Platform', 59, N'Vans', N'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A3B3UY28/VN0A3B3UY28_1-650x650.jpg', 40, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (32, N'Vans UA Old Skool Vintage Pop', 69, N'Vans', N'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0005UFBLS/VN0005UFBLS_1-650x650.jpg', 40, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (33, N'Vans MN Skate Old Skool', 89, N'Vans', N'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5FCBY28/VN0A5FCBY28-650x650.jpg', 60, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (34, N'Vans Authentic 44 DX Anaheim Factory', 39, N'Vans', N'https://drake.vn/image/cache/catalog/Vans/SNEAKER/H%C3%ACnh%20Trang%20Ch%E1%BB%A7/VN0A38ENOAK-DRAKE-650x650.jpg', 50, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (35, N'Vans Classic Slip On', 49, N'Vans', N'https://drake.vn/image/cache/catalog/Vans/EYEBWW-650x650.jpg', 30, 1, NULL)
INSERT [dbo].[Product] ([P_id], [P_name], [price], [brand], [image], [stock], [status], [des]) VALUES (36, N'Blazer Low 77 Jumpo', 100000, N'Nike', N'https://leftfoot.com.sg/cdn/shop/products/Nike-Blazer-Low-Jumbo-White-Blue-DQ8768-100-Release-Date-3_300x300.jpg?v=1657875506', 55, 0, N'add them cai gi do vao voi pls')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([P_id])
REFERENCES [dbo].[Product] ([P_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
USE [master]
GO
ALTER DATABASE [Shoes3] SET  READ_WRITE 
GO
