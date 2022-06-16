
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/16/2022 11:55:34
-- Generated from EDMX file: C:\Users\Umbraco\source\repos\Airport\Airport\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Airport];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[AirportModelStoreContainer].[FK__Airport_R__Airpo__4222D4EF]', 'F') IS NOT NULL
    ALTER TABLE [AirportModelStoreContainer].[Airport_Route] DROP CONSTRAINT [FK__Airport_R__Airpo__4222D4EF];
GO
IF OBJECT_ID(N'[AirportModelStoreContainer].[FK__Airport_R__Route__412EB0B6]', 'F') IS NOT NULL
    ALTER TABLE [AirportModelStoreContainer].[Airport_Route] DROP CONSTRAINT [FK__Airport_R__Route__412EB0B6];
GO
IF OBJECT_ID(N'[dbo].[FK__Plane__Airport_I__3F466844]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Plane] DROP CONSTRAINT [FK__Plane__Airport_I__3F466844];
GO
IF OBJECT_ID(N'[dbo].[FK__Plane__Company_C__3D5E1FD2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Plane] DROP CONSTRAINT [FK__Plane__Company_C__3D5E1FD2];
GO
IF OBJECT_ID(N'[dbo].[FK__Plane__Route_Rou__3E52440B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Plane] DROP CONSTRAINT [FK__Plane__Route_Rou__3E52440B];
GO
IF OBJECT_ID(N'[dbo].[FK__Route__Company_C__37A5467C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK__Route__Company_C__37A5467C];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AirPort]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AirPort];
GO
IF OBJECT_ID(N'[dbo].[Company]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company];
GO
IF OBJECT_ID(N'[dbo].[Plane]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Plane];
GO
IF OBJECT_ID(N'[dbo].[Route]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Route];
GO
IF OBJECT_ID(N'[AirportModelStoreContainer].[Airport_Route]', 'U') IS NOT NULL
    DROP TABLE [AirportModelStoreContainer].[Airport_Route];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AirPorts'
CREATE TABLE [dbo].[AirPorts] (
    [IATA] varchar(3)  NOT NULL,
    [Airport_Name] varchar(256)  NOT NULL,
    [Airport_Address] varchar(256)  NOT NULL
);
GO

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [Company_Id] int IDENTITY(1,1) NOT NULL,
    [Company_Name] varchar(256)  NOT NULL
);
GO

-- Creating table 'Planes'
CREATE TABLE [dbo].[Planes] (
    [Serial_Number] varchar(256)  NOT NULL,
    [Company_CompanyId] int  NOT NULL,
    [Route_RouteId] int  NOT NULL,
    [Airport_IATA] varchar(3)  NOT NULL
);
GO

-- Creating table 'Routes'
CREATE TABLE [dbo].[Routes] (
    [Route_Id] int IDENTITY(1,1) NOT NULL,
    [Company_CompanyId] int  NULL
);
GO

-- Creating table 'Airport_Route'
CREATE TABLE [dbo].[Airport_Route] (
    [AirPorts_IATA] varchar(3)  NOT NULL,
    [Routes_Route_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IATA] in table 'AirPorts'
ALTER TABLE [dbo].[AirPorts]
ADD CONSTRAINT [PK_AirPorts]
    PRIMARY KEY CLUSTERED ([IATA] ASC);
GO

-- Creating primary key on [Company_Id] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([Company_Id] ASC);
GO

-- Creating primary key on [Serial_Number] in table 'Planes'
ALTER TABLE [dbo].[Planes]
ADD CONSTRAINT [PK_Planes]
    PRIMARY KEY CLUSTERED ([Serial_Number] ASC);
GO

-- Creating primary key on [Route_Id] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [PK_Routes]
    PRIMARY KEY CLUSTERED ([Route_Id] ASC);
GO

-- Creating primary key on [AirPorts_IATA], [Routes_Route_Id] in table 'Airport_Route'
ALTER TABLE [dbo].[Airport_Route]
ADD CONSTRAINT [PK_Airport_Route]
    PRIMARY KEY CLUSTERED ([AirPorts_IATA], [Routes_Route_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Airport_IATA] in table 'Planes'
ALTER TABLE [dbo].[Planes]
ADD CONSTRAINT [FK__Plane__Airport_I__3F466844]
    FOREIGN KEY ([Airport_IATA])
    REFERENCES [dbo].[AirPorts]
        ([IATA])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Plane__Airport_I__3F466844'
CREATE INDEX [IX_FK__Plane__Airport_I__3F466844]
ON [dbo].[Planes]
    ([Airport_IATA]);
GO

-- Creating foreign key on [Company_CompanyId] in table 'Planes'
ALTER TABLE [dbo].[Planes]
ADD CONSTRAINT [FK__Plane__Company_C__3D5E1FD2]
    FOREIGN KEY ([Company_CompanyId])
    REFERENCES [dbo].[Companies]
        ([Company_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Plane__Company_C__3D5E1FD2'
CREATE INDEX [IX_FK__Plane__Company_C__3D5E1FD2]
ON [dbo].[Planes]
    ([Company_CompanyId]);
GO

-- Creating foreign key on [Company_CompanyId] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [FK__Route__Company_C__37A5467C]
    FOREIGN KEY ([Company_CompanyId])
    REFERENCES [dbo].[Companies]
        ([Company_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Route__Company_C__37A5467C'
CREATE INDEX [IX_FK__Route__Company_C__37A5467C]
ON [dbo].[Routes]
    ([Company_CompanyId]);
GO

-- Creating foreign key on [Route_RouteId] in table 'Planes'
ALTER TABLE [dbo].[Planes]
ADD CONSTRAINT [FK__Plane__Route_Rou__3E52440B]
    FOREIGN KEY ([Route_RouteId])
    REFERENCES [dbo].[Routes]
        ([Route_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Plane__Route_Rou__3E52440B'
CREATE INDEX [IX_FK__Plane__Route_Rou__3E52440B]
ON [dbo].[Planes]
    ([Route_RouteId]);
GO

-- Creating foreign key on [AirPorts_IATA] in table 'Airport_Route'
ALTER TABLE [dbo].[Airport_Route]
ADD CONSTRAINT [FK_Airport_Route_AirPort]
    FOREIGN KEY ([AirPorts_IATA])
    REFERENCES [dbo].[AirPorts]
        ([IATA])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Routes_Route_Id] in table 'Airport_Route'
ALTER TABLE [dbo].[Airport_Route]
ADD CONSTRAINT [FK_Airport_Route_Route]
    FOREIGN KEY ([Routes_Route_Id])
    REFERENCES [dbo].[Routes]
        ([Route_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Airport_Route_Route'
CREATE INDEX [IX_FK_Airport_Route_Route]
ON [dbo].[Airport_Route]
    ([Routes_Route_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------