
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
----------------------Base de datos en 'SQL SERVER'------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
USE [master]
GO
/****** Object:  Database [Indratest]    Script Date: 5/11/2022 2:55:32 p. m. ******/
CREATE DATABASE [Indratest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Indratest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Indratest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Indratest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Indratest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Indratest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Indratest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Indratest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Indratest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Indratest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Indratest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Indratest] SET ARITHABORT OFF 
GO
ALTER DATABASE [Indratest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Indratest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Indratest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Indratest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Indratest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Indratest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Indratest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Indratest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Indratest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Indratest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Indratest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Indratest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Indratest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Indratest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Indratest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Indratest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Indratest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Indratest] SET RECOVERY FULL 
GO
ALTER DATABASE [Indratest] SET  MULTI_USER 
GO
ALTER DATABASE [Indratest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Indratest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Indratest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Indratest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Indratest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Indratest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Indratest', N'ON'
GO
ALTER DATABASE [Indratest] SET QUERY_STORE = OFF
GO
USE [Indratest]
GO
/****** Object:  Schema [Admin]    Script Date: 5/11/2022 2:55:33 p. m. ******/
CREATE SCHEMA [Admin]
GO
/****** Object:  Schema [Producto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
CREATE SCHEMA [Producto]
GO
/****** Object:  Schema [Token]    Script Date: 5/11/2022 2:55:33 p. m. ******/
CREATE SCHEMA [Token]
GO
/****** Object:  Table [Admin].[Usuario]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Usuario](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[identificacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [Admin].[Usuario]
           ([userName]
           ,[nombre]
           ,[apellido]
           ,[identificacion]
           ,[fechaCreacion]
           ,[password])
     VALUES
           ('admin'
           ,'admin'
           ,'admin'
           ,'admin'
           ,'2022/11/05'
           ,'3xw9lO+bJaq+DRX3Phh5Pg==')
/****** Object:  Table [Producto].[CategoriaProducto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Producto].[CategoriaProducto](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CategoriaProducto] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [Producto].[CategoriaProducto]
           ([nombre])
     VALUES
           ('Facial')
/****** Object:  Table [Producto].[Producto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Producto].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[idCategoriaProducto] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Producto].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_CategoriaProducto] FOREIGN KEY([idCategoriaProducto])
REFERENCES [Producto].[CategoriaProducto] ([idCategoria])
GO
ALTER TABLE [Producto].[Producto] CHECK CONSTRAINT [FK_Producto_CategoriaProducto]
GO

INSERT INTO [Producto].[Producto]
           ([nombre]
           ,[idCategoriaProducto]
           ,[estado])
     VALUES
           ('Tapabocas'
           ,'1'
           ,'A')
/****** Object:  StoredProcedure [Admin].[GetUser]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Admin].[GetUser] 
	-- Add the parameters for the stored procedure here
	@User VARCHAR(50),
	@Pass VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [idUser]
      ,[userName]
      ,[nombre]
      ,[apellido]
      ,[identificacion]
      ,[fechaCreacion]
  FROM [Admin].[Usuario] U
  WHERE U.[userName] = @User AND U.[password] = @Pass
END
GO
/****** Object:  StoredProcedure [Producto].[ChangestateProducto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Producto].[ChangestateProducto]
	-- Add the parameters for the stored procedure here
	@idProducto int,
	@estado varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Producto].[Producto]
   SET [estado] = @estado
 WHERE [idProducto] = @idProducto



		   END
GO
/****** Object:  StoredProcedure [Producto].[GetCategoria]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Producto].[GetCategoria]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [idCategoria]
      ,[nombre]
  FROM [Producto].[CategoriaProducto]
END
GO
/****** Object:  StoredProcedure [Producto].[GetProductobyCategoria]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Producto].[GetProductobyCategoria]
	-- Add the parameters for the stored procedure here
	@Categoria INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [idProducto]
      ,[nombre]
	  ,[idCategoriaProducto]
      ,[estado]
  FROM [Producto].[Producto] P
  WHERE P.[idCategoriaProducto] = @Categoria
END
GO
/****** Object:  StoredProcedure [Producto].[INSERTProducto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
crEate PROCEDURE [Producto].[INSERTProducto]
	-- Add the parameters for the stored procedure here
	@nombre varchar(100) ,
	@idCategoriaProducto int,
	@estado varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
INSERT INTO [Producto].[Producto]
           ([nombre]
           ,[idCategoriaProducto]
           ,[estado])
     VALUES
           (@nombre
           ,@idCategoriaProducto
           ,@estado)
		   END
GO
/****** Object:  StoredProcedure [Producto].[UPDATEProducto]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Producto].[UPDATEProducto]
	-- Add the parameters for the stored procedure here
	@idProducto int,
	@nombre varchar(100) ,
	@idCategoriaProducto int,
	@estado varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Producto].[Producto]
   SET [nombre] = @nombre
      ,[idCategoriaProducto] = @idCategoriaProducto
      ,[estado] = @estado
 WHERE [idProducto] = @idProducto



		   END
GO
/****** Object:  StoredProcedure [Token].[GetToken]    Script Date: 5/11/2022 2:55:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [Token].[GetToken]
	-- Add the parameters for the stored procedure here
	@User VARCHAR(50),
	@Pass VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Result INT =
	(SELECT COUNT(*) FROM [Admin].[Usuario] U
	WHERE U.[userName] = @User AND U.[password] = @Pass)

	SELECT @Result AS Result
END

GO
USE [master]
GO
ALTER DATABASE [Indratest] SET  READ_WRITE 
GO
