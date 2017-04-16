USE [master]
GO
/****** Object:  Database [PizzaExpress]    Script Date: 16/04/2017 12:37:52 ******/
CREATE DATABASE [PizzaExpress]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaExpress', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PizzaExpress.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzaExpress_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PizzaExpress_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PizzaExpress] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaExpress].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaExpress] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaExpress] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaExpress] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaExpress] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaExpress] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaExpress] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaExpress] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaExpress] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaExpress] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaExpress] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaExpress] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaExpress] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaExpress] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaExpress] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaExpress] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaExpress] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzaExpress] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaExpress] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaExpress] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaExpress] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaExpress] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaExpress] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaExpress] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaExpress] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaExpress] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaExpress] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaExpress] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaExpress] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaExpress] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PizzaExpress]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NomeCliente] [varchar](60) NOT NULL,
	[TelefoneCliente] [varchar](18) NULL,
	[Rua] [varchar](30) NULL,
	[Bairro] [varchar](30) NULL,
	[Numero] [varchar](10) NULL,
 CONSTRAINT [PK_Tb_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Funcionario]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Funcionario](
	[IdFuncionario] [int] NULL,
	[nome] [varchar](100) NULL,
	[telefone] [varchar](50) NULL,
	[senha] [varchar](50) NULL,
	[permissao] [varchar](50) NULL,
	[setor] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Pedido]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Pedido](
	[NumPedido] [int] IDENTITY(10000,1) NOT NULL,
	[DescPedido] [varchar](50) NOT NULL,
	[DataPedido] [datetime] NOT NULL,
	[PrecoTotal] [money] NOT NULL,
	[TipoPedido] [varchar](20) NOT NULL,
	[StatusPedido] [varchar](50) NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Tb_Pedido] PRIMARY KEY CLUSTERED 
(
	[NumPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_PedidoPizza]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PedidoPizza](
	[NumPedido] [int] NOT NULL,
	[IdPizza] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tb_PedidoProduto]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PedidoProduto](
	[IdProduto] [int] NULL,
	[NumPedido] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tb_Pizza]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Pizza](
	[IdPizza] [int] IDENTITY(1,1) NOT NULL,
	[PrecoPizza] [money] NOT NULL,
	[Tamanho] [varchar](20) NOT NULL,
	[Sabor1] [int] NOT NULL,
	[Sabor2] [int] NULL,
	[Sabor3] [int] NULL,
	[status] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tb_Pizza] PRIMARY KEY CLUSTERED 
(
	[IdPizza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Produto]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Produto](
	[IdProduto] [int] IDENTITY(1,1) NOT NULL,
	[NomeProduto] [varchar](50) NOT NULL,
	[DescProduto] [varchar](50) NULL,
	[PrecoProduto] [money] NOT NULL,
 CONSTRAINT [PK_Tb_Produto] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Sabor]    Script Date: 16/04/2017 12:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Sabor](
	[IdSabor] [int] IDENTITY(1,1) NOT NULL,
	[NomeSabor] [varchar](30) NOT NULL,
	[DescSabor] [varchar](60) NOT NULL,
	[PrecoSabor] [money] NOT NULL,
 CONSTRAINT [PK_Tb_Sabor] PRIMARY KEY CLUSTERED 
(
	[IdSabor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Tb_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Pedido_Tb_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Tb_Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Tb_Pedido] CHECK CONSTRAINT [FK_Tb_Pedido_Tb_Cliente]
GO
ALTER TABLE [dbo].[Tb_PedidoPizza]  WITH CHECK ADD  CONSTRAINT [FK_Tb_PedidoPizza_Tb_Pedido] FOREIGN KEY([NumPedido])
REFERENCES [dbo].[Tb_Pedido] ([NumPedido])
GO
ALTER TABLE [dbo].[Tb_PedidoPizza] CHECK CONSTRAINT [FK_Tb_PedidoPizza_Tb_Pedido]
GO
ALTER TABLE [dbo].[Tb_PedidoPizza]  WITH CHECK ADD  CONSTRAINT [FK_Tb_PedidoPizza_Tb_Pizza] FOREIGN KEY([IdPizza])
REFERENCES [dbo].[Tb_Pizza] ([IdPizza])
GO
ALTER TABLE [dbo].[Tb_PedidoPizza] CHECK CONSTRAINT [FK_Tb_PedidoPizza_Tb_Pizza]
GO
ALTER TABLE [dbo].[Tb_PedidoProduto]  WITH CHECK ADD  CONSTRAINT [FK_PedidoProduto_Tb_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Tb_Produto] ([IdProduto])
GO
ALTER TABLE [dbo].[Tb_PedidoProduto] CHECK CONSTRAINT [FK_PedidoProduto_Tb_Produto]
GO
ALTER TABLE [dbo].[Tb_PedidoProduto]  WITH CHECK ADD  CONSTRAINT [FK_Tb_PedidoProduto_Tb_Pedido] FOREIGN KEY([NumPedido])
REFERENCES [dbo].[Tb_Pedido] ([NumPedido])
GO
ALTER TABLE [dbo].[Tb_PedidoProduto] CHECK CONSTRAINT [FK_Tb_PedidoProduto_Tb_Pedido]
GO
ALTER TABLE [dbo].[Tb_Pizza]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Pizza_Tb_Sabor] FOREIGN KEY([Sabor1])
REFERENCES [dbo].[Tb_Sabor] ([IdSabor])
GO
ALTER TABLE [dbo].[Tb_Pizza] CHECK CONSTRAINT [FK_Tb_Pizza_Tb_Sabor]
GO
ALTER TABLE [dbo].[Tb_Pizza]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Pizza_Tb_Sabor1] FOREIGN KEY([Sabor2])
REFERENCES [dbo].[Tb_Sabor] ([IdSabor])
GO
ALTER TABLE [dbo].[Tb_Pizza] CHECK CONSTRAINT [FK_Tb_Pizza_Tb_Sabor1]
GO
ALTER TABLE [dbo].[Tb_Pizza]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Pizza_Tb_Sabor2] FOREIGN KEY([Sabor3])
REFERENCES [dbo].[Tb_Sabor] ([IdSabor])
GO
ALTER TABLE [dbo].[Tb_Pizza] CHECK CONSTRAINT [FK_Tb_Pizza_Tb_Sabor2]
GO
USE [master]
GO
ALTER DATABASE [PizzaExpress] SET  READ_WRITE 
GO
