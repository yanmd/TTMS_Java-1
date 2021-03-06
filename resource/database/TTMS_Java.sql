USE [master]
GO
/****** Object:  Database [TTMS]    Script Date: 06/08/2017 21:26:06 ******/
CREATE DATABASE [TTMS] ON  PRIMARY 
( NAME = N'TTMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\TTMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TTMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\TTMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TTMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TTMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TTMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TTMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TTMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TTMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TTMS] SET ARITHABORT OFF
GO
ALTER DATABASE [TTMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TTMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TTMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TTMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TTMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TTMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TTMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TTMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TTMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TTMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TTMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [TTMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TTMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TTMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TTMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TTMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TTMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TTMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TTMS] SET  READ_WRITE
GO
ALTER DATABASE [TTMS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TTMS] SET  MULTI_USER
GO
ALTER DATABASE [TTMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TTMS] SET DB_CHAINING OFF
GO
USE [TTMS]
GO
/****** Object:  User [root]    Script Date: 06/08/2017 21:26:06 ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 06/08/2017 21:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[mv_id] [int] IDENTITY(1,1) NOT NULL,
	[mv_img] [nvarchar](200) NOT NULL,
	[mv_name] [nvarchar](20) NOT NULL,
	[mv_score] [real] NOT NULL,
	[mv_director] [nvarchar](200) NULL,
	[mv_actor] [nvarchar](200) NULL,
	[mv_type] [nvarchar](200) NULL,
	[mv_time] [nvarchar](20) NOT NULL,
	[mv_date] [nvarchar](20) NOT NULL,
	[mv_introduction] [nvarchar](max) NULL,
	[mv_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_movies_1] PRIMARY KEY CLUSTERED 
(
	[mv_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 06/08/2017 21:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_no] [char](20) NOT NULL,
	[emp_name] [varchar](100) NOT NULL,
	[emp_tel_num] [char](20) NULL,
	[emp_addr] [varchar](200) NULL,
	[emp_email] [varchar](100) NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY NONCLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[data_dict]    Script Date: 06/08/2017 21:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[data_dict](
	[dict_id] [int] IDENTITY(1,1) NOT NULL,
	[dict_parent_id] [int] NULL,
	[dict_index] [int] NULL,
	[dict_name] [varchar](200) NULL,
	[dict_value] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DATA_DICT] PRIMARY KEY NONCLUSTERED 
(
	[dict_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[cs_id] [int] IDENTITY(1,1) NOT NULL,
	[cs_nick] [varchar](100) NULL,
	[cs_psd] [varchar](50) NULL,
	[cs_name] [varchar](100) NULL,
	[cs_email] [varchar](100) NULL,
	[cs_sex] [varchar](10) NULL,
	[cs_date] [varchar](100) NULL,
	[cs_age] [varchar](100) NULL,
	[cs_phone] [varchar](50) NULL,
	[cs_intro] [varchar](max) NULL,
 CONSTRAINT [PK_CUSTOM] PRIMARY KEY NONCLUSTERED 
(
	[cs_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clerk]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clerk](
	[ck_id] [int] IDENTITY(1,1) NOT NULL,
	[ck_nick] [varchar](100) NULL,
	[ck_name] [varchar](100) NULL,
	[ck_num] [varchar](100) NULL,
	[ck_psd] [varchar](50) NULL,
	[ck_sex] [varchar](10) NULL,
	[ck_date] [varchar](100) NULL,
	[ck_age] [varchar](100) NULL,
	[ck_phone] [varchar](50) NULL,
	[ck_intro] [varchar](max) NULL,
 CONSTRAINT [PK_CLERK] PRIMARY KEY NONCLUSTERED 
(
	[ck_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studio]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studio](
	[studio_id] [int] IDENTITY(1,1) NOT NULL,
	[studio_name] [varchar](100) NOT NULL,
	[studio_row_count] [int] NULL,
	[studio_col_count] [int] NULL,
	[studio_introduction] [varchar](2000) NULL,
 CONSTRAINT [PK_STUDIO] PRIMARY KEY NONCLUSTERED 
(
	[studio_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seat]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[seat_id] [int] IDENTITY(1,1) NOT NULL,
	[studio_id] [int] NULL,
	[seat_row] [int] NULL,
	[seat_column] [int] NULL,
	[seat_status] [int] NULL,
 CONSTRAINT [PK_SEAT] PRIMARY KEY NONCLUSTERED 
(
	[seat_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[sched_id] [int] IDENTITY(1,1) NOT NULL,
	[studio_id] [int] NULL,
	[mv_id] [int] NULL,
	[sched_time] [datetime] NULL,
	[sched_ticket_price] [numeric](10, 2) NULL,
 CONSTRAINT [PK_SCHEDULE] PRIMARY KEY NONCLUSTERED 
(
	[sched_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale](
	[sale_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[sale_time] [datetime] NULL,
	[sale_payment] [decimal](10, 2) NULL,
	[sale_change] [numeric](10, 2) NULL,
	[sale_type] [smallint] NULL,
	[sale_status] [smallint] NULL,
 CONSTRAINT [PK_SALE] PRIMARY KEY NONCLUSTERED 
(
	[sale_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别取值含义：
   1：销售单
   -1：退款单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sale', @level2type=N'COLUMN',@level2name=N'sale_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售单状态如下：
   0：代付款
   1：已付款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sale', @level2type=N'COLUMN',@level2name=N'sale_status'
GO
/****** Object:  Table [dbo].[play]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[play](
	[play_id] [int] IDENTITY(1,1) NOT NULL,
	[play_type_id] [int] NULL,
	[play_lang_id] [int] NULL,
	[play_name] [varchar](200) NULL,
	[play_introduction] [varchar](2000) NULL,
	[play_image] [binary](1) NULL,
	[play_length] [int] NULL,
	[play_ticket_price] [numeric](10, 2) NULL,
	[play_status] [smallint] NULL,
 CONSTRAINT [PK_PLAY] PRIMARY KEY NONCLUSTERED 
(
	[play_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取值含义：
   0：待安排演出
   1：已安排演出
   -1：下线' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'play', @level2type=N'COLUMN',@level2name=N'play_status'
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [bigint] IDENTITY(1,1) NOT NULL,
	[seat_id] [int] NULL,
	[sched_id] [int] NULL,
	[ticket_price] [numeric](10, 2) NULL,
	[ticket_status] [smallint] NULL,
	[ticket_locked_time] [datetime] NULL,
 CONSTRAINT [PK_TICKET] PRIMARY KEY NONCLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'含义如下：
   0：待销售
   1：锁定
   9：卖出' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ticket', @level2type=N'COLUMN',@level2name=N'ticket_status'
GO
/****** Object:  Table [dbo].[sale_item]    Script Date: 06/08/2017 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_item](
	[sale_item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ticket_id] [bigint] NULL,
	[sale_ID] [bigint] NULL,
	[sale_item_price] [numeric](10, 2) NULL,
 CONSTRAINT [PK_SALE_ITEM] PRIMARY KEY NONCLUSTERED 
(
	[sale_item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_DATA_DIC_SUPER_CHI_DATA_DIC]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[data_dict]  WITH CHECK ADD  CONSTRAINT [FK_DATA_DIC_SUPER_CHI_DATA_DIC] FOREIGN KEY([dict_parent_id])
REFERENCES [dbo].[data_dict] ([dict_id])
GO
ALTER TABLE [dbo].[data_dict] CHECK CONSTRAINT [FK_DATA_DIC_SUPER_CHI_DATA_DIC]
GO
/****** Object:  ForeignKey [FK_SEAT_STUDIO_SE_STUDIO]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FK_SEAT_STUDIO_SE_STUDIO] FOREIGN KEY([studio_id])
REFERENCES [dbo].[studio] ([studio_id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FK_SEAT_STUDIO_SE_STUDIO]
GO
/****** Object:  ForeignKey [FK_SCHEDULE_STUDIO_SC_STUDIO]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_SCHEDULE_STUDIO_SC_STUDIO] FOREIGN KEY([studio_id])
REFERENCES [dbo].[studio] ([studio_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_SCHEDULE_STUDIO_SC_STUDIO]
GO
/****** Object:  ForeignKey [FK_SALE_EMPLOYEE__EMPLOYEE]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[sale]  WITH CHECK ADD  CONSTRAINT [FK_SALE_EMPLOYEE__EMPLOYEE] FOREIGN KEY([emp_id])
REFERENCES [dbo].[employee] ([emp_id])
GO
ALTER TABLE [dbo].[sale] CHECK CONSTRAINT [FK_SALE_EMPLOYEE__EMPLOYEE]
GO
/****** Object:  ForeignKey [FK_PLAY_DICT_LAN__DATA_DIC]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[play]  WITH CHECK ADD  CONSTRAINT [FK_PLAY_DICT_LAN__DATA_DIC] FOREIGN KEY([play_lang_id])
REFERENCES [dbo].[data_dict] ([dict_id])
GO
ALTER TABLE [dbo].[play] CHECK CONSTRAINT [FK_PLAY_DICT_LAN__DATA_DIC]
GO
/****** Object:  ForeignKey [FK_PLAY_DICT_TYPE_DATA_DIC]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[play]  WITH CHECK ADD  CONSTRAINT [FK_PLAY_DICT_TYPE_DATA_DIC] FOREIGN KEY([play_type_id])
REFERENCES [dbo].[data_dict] ([dict_id])
GO
ALTER TABLE [dbo].[play] CHECK CONSTRAINT [FK_PLAY_DICT_TYPE_DATA_DIC]
GO
/****** Object:  ForeignKey [FK_TICKET_SCHED_TIC_SCHEDULE]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_SCHED_TIC_SCHEDULE] FOREIGN KEY([sched_id])
REFERENCES [dbo].[schedule] ([sched_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_TICKET_SCHED_TIC_SCHEDULE]
GO
/****** Object:  ForeignKey [FK_TICKET_SEAT_TICK_SEAT]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_SEAT_TICK_SEAT] FOREIGN KEY([seat_id])
REFERENCES [dbo].[seat] ([seat_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_TICKET_SEAT_TICK_SEAT]
GO
/****** Object:  ForeignKey [FK_SALE_ITE_SALE_SALE_SALE]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[sale_item]  WITH CHECK ADD  CONSTRAINT [FK_SALE_ITE_SALE_SALE_SALE] FOREIGN KEY([sale_ID])
REFERENCES [dbo].[sale] ([sale_ID])
GO
ALTER TABLE [dbo].[sale_item] CHECK CONSTRAINT [FK_SALE_ITE_SALE_SALE_SALE]
GO
/****** Object:  ForeignKey [FK_SALE_ITE_TICKET_SA_TICKET]    Script Date: 06/08/2017 21:26:10 ******/
ALTER TABLE [dbo].[sale_item]  WITH CHECK ADD  CONSTRAINT [FK_SALE_ITE_TICKET_SA_TICKET] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[sale_item] CHECK CONSTRAINT [FK_SALE_ITE_TICKET_SA_TICKET]
GO
