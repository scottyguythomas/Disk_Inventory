-- Scott Thomas
-- Modified: 10/04/2019
-- Week 2 Project
USE master;
GO
-- Drop the database if it exists
DROP DATABASE IF EXISTS [disk_inventoryRT];
GO

-- Re-create the database
CREATE DATABASE [disk_inventoryRT];
GO

-- Use the newly created databse
USE [disk_inventoryRT];
GO



-- Drop the Genre table if it exists
DROP TABLE IF EXISTS [Genre];
GO

-- Create a table to hold the different types of genres we carry
CREATE TABLE [Genre]
(
	[Genre_ID] int NOT NULL,
	[Description] varchar(50) NOT NULL,
	PRIMARY KEY ([Genre_ID])
);
GO


-- Drop the Status table if it exists
DROP TABLE IF EXISTS [Status];
GO

-- Create a Table to hold the disks current status
CREATE TABLE [Status]
(
	[Status_ID] int NOT NULL,
	[Status_Desc] varchar(50) NOT NULL,
	PRIMARY KEY ([Status_ID])
);
GO


-- Drop the Type table if it exists
DROP TABLE IF EXISTS [Type];
GO

-- Create a table to hold the different type of disks
CREATE TABLE [Type]
(
	[Type_ID] int NOT NULL,
	[Description] varchar(50) NOT NULL,
	PRIMARY KEY ([Type_ID])
);
GO



-- Drop the Borrower table if it exists
DROP TABLE IF EXISTS [Borrower];
GO

-- Create the borrower table to hold information about disk borrowers
CREATE TABLE [Borrower]
(
	[Borrower_ID] int NOT NULL,
	[Borrower_FName] varchar(50) NOT NULL,
	[Borrower_LName] varchar(50) NOT NULL,
	[Borrower_Number] varchar(50) NOT NULL,
	PRIMARY KEY ([Borrower_ID])
);
GO



-- Drop the artist table if it exists
DROP TABLE IF EXISTS [Artist];
GO

-- Create the artist table to hold the artist name and type.
CREATE TABLE [Artist]
(
	[Artist_ID] int NOT NULL,
	[Artist_FName] varchar(50) NOT NULL,
	[Artist_LName] varchar(50),
	[Artist_Type] int NOT NULL,
	PRIMARY KEY ([Artist_ID])
);
GO


-- Drop the Disk_Artists table if it exists
DROP TABLE IF EXISTS [Disk_Artists];
GO

-- Create the artist table to hold the artist name and type.
CREATE TABLE [Disk_Artists]
(
	[Artist_ID] int NOT NULL,
	[Disk_ID] int NOT NULL,
	PRIMARY KEY ([Artist_ID], [Disk_ID])
);
GO


-- Drop the Disk table if it exists
DROP TABLE IF EXISTS [Disk];
GO

-- Create the disk table to hold information about each disk.
CREATE TABLE [Disk]
(
	[Disk_ID] int NOT NULL,
	[Name] varchar(50) NOT NULL,
	[ReleaseDate] datetime2 NOT NULL,
	[Type_ID] int NOT NULL,
	[Genre_ID] int NOT NULL,
	[Status_ID] int NOT NULL,
	PRIMARY KEY ([Disk_ID])
);
GO


-- Drop the DiskHasBorrower table if it exists
DROP TABLE IF EXISTS [DiskHasBorrower];
GO

-- Create the DiskHasBorrower table to track who has borrowed the disk, when it was checked out, and when it was brought back.
CREATE TABLE [DiskHasBorrower]
(
	[Checkout_ID] int NOT NULL, -- Primary key
	[Disk_ID] int NOT NULL,
	[Borrower_ID] int NOT NULL,
	[Borrowed_Date] datetime2 NOT NULL,
	[Returned_Date] datetime2 DEFAULT NULL,
	-- PRIMARY KEY ([Checkout_ID], [Disk_ID], [Borrower_ID])
	PRIMARY KEY ([Checkout_ID])
);
GO

-- Create the foreign keys for Disk_Artists
ALTER TABLE [Disk_Artists]
	ADD CONSTRAINT FK_Artist_ID FOREIGN KEY ([Artist_ID])
	REFERENCES [Artist] ([Artist_ID]);
GO

ALTER TABLE [Disk_Artists]
	ADD CONSTRAINT FK_Disk_ID FOREIGN KEY ([Disk_ID])
	REFERENCES [Disk] ([Disk_ID]);
GO

-- Create foreign keys for DiskHasBorrower
ALTER TABLE [DiskHasBorrower]
	ADD CONSTRAINT FK_Borrower_Disk_ID FOREIGN KEY ([Disk_ID])
	REFERENCES [Disk] ([Disk_ID]);
GO

ALTER TABLE [DiskHasBorrower]
	ADD CONSTRAINT FK_Borrower_ID FOREIGN KEY ([Borrower_ID])
	REFERENCES [Borrower] ([Borrower_ID]);
GO

-- Create the foreign keys for Disk
ALTER TABLE [Disk]
	ADD CONSTRAINT FK_Type_ID FOREIGN KEY ([Type_ID])
	REFERENCES [Type] ([Type_ID]);
GO

ALTER TABLE [Disk]
	ADD CONSTRAINT FK_Genre_ID FOREIGN KEY ([Genre_ID])
	REFERENCES [Genre] ([Genre_ID]);
GO

ALTER TABLE [Disk]
	ADD CONSTRAINT FK_Status_ID FOREIGN KEY ([Status_ID])
	REFERENCES [Status] ([Status_ID]);
GO


-- Create a new login for the disk user
use [master];
go
if SUSER_ID('diskUserRT') is null
	create login diskUserRT with password = 'ZpQg%$f73Jgru1aUQ1ITL#G8^G5M8#!X';
go

use [disk_inventoryRT];

-- Add the new login as a user in the database
go
if USER_ID('diskUserRT') is null
	create user diskUserRT;
go

-- add the disk user to a read only role
alter role db_datareader add member diskUserRT;
go

-- return to master
use [master];