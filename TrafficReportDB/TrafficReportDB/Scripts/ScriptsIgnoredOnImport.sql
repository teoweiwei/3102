
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/14/2016 22:29:11
-- Generated from EDMX file: G:\SIT\Current_Trimester\ICT3102\Assignment1\ict2106-master\TrafficReport\Models\TrafficAccidentModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO

USE [trafficreport];
GO

IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_tblRainfall_tblLocationName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblRainfall] DROP CONSTRAINT [FK_tblRainfall_tblLocationName];
GO

IF OBJECT_ID(N'[dbo].[FK_tblRoadName_tblLocationName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblRoadName] DROP CONSTRAINT [FK_tblRoadName_tblLocationName];
GO

IF OBJECT_ID(N'[dbo].[FK_tblTrafficAccident_tblRoadName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTrafficAccident] DROP CONSTRAINT [FK_tblTrafficAccident_tblRoadName];
GO

IF OBJECT_ID(N'[dbo].[FK_tblTrafficSpeed_tblRoadName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblTrafficSpeed] DROP CONSTRAINT [FK_tblTrafficSpeed_tblRoadName];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tblLocationName]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblLocationName];
GO

IF OBJECT_ID(N'[dbo].[tblRainfall]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblRainfall];
GO

IF OBJECT_ID(N'[dbo].[tblRoadName]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblRoadName];
GO

IF OBJECT_ID(N'[dbo].[tblTrafficAccident]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblTrafficAccident];
GO

IF OBJECT_ID(N'[dbo].[tblTrafficSpeed]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblTrafficSpeed];
GO


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

GO
