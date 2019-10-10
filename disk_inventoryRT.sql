-- Scott Thomas
-- Modified: 10/10/2019
-- Week 3 Project

-- START OF DATABASE CREATE SECTION
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
	[Genre_ID] int NOT NULL IDENTITY,
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
	[Status_ID] int NOT NULL IDENTITY,
	[Description] varchar(50) NOT NULL,
	PRIMARY KEY ([Status_ID])
);
GO

-- Drop the Type table if it exists
DROP TABLE IF EXISTS [Type];
GO

-- Create a table to hold the different type of disks
CREATE TABLE [Type]
(
	[Type_ID] int NOT NULL IDENTITY,
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
	[Borrower_ID] int NOT NULL IDENTITY,
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
	[Artist_ID] int NOT NULL IDENTITY,
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
	[Disk_ID] int NOT NULL IDENTITY,
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
	[Checkout_ID] int NOT NULL IDENTITY, -- Primary key
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

-- END


-- START OF WEEK 3 PROJECT




USE [disk_inventoryRT];
GO

-- Add Type VALUES
INSERT INTO [Type]
([Description])
VALUES
('CD');
GO

INSERT INTO [Type]
([Description])
VALUES
('Movie');
GO

-- Add Genre VALUES
INSERT INTO [Genre]
([Description])
VALUES
('Rock');
GO

INSERT INTO [Genre]
([Description])
VALUES
('Country');
GO

INSERT INTO [Genre]
([Description])
VALUES
('Hip Hop');
GO

-- Add Status VALUES
INSERT INTO [Status]
([Description])
VALUES
('Checked Out');
GO

INSERT INTO [Status]
([Description])
VALUES
('In Storage');
GO

INSERT INTO [Status]
([Description])
VALUES
('On Display');
GO

-- d.1
-- Add Borrowers

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Cecelia', 'Howard', '2085552407');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Warren', 'Medina', '2085558045');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Hattie', 'Swanson', '2085551067');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Chad', 'Snyder', '2085555349');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Marvin', 'Reyes', '2085557988');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Luis', 'Chavez', '2085558091');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Thomas', 'Massey', '2085559186');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Herbert', 'Coleman', '2085554679');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Ann', 'Reeves', '2085559787');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Russell', 'Cole', '2085559930');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Juan', 'Hansen', '2085553263');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Joe', 'Guzman', '2085555483');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Jose', 'Robertson', '2085555683');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Polly', 'Fleming', '2085553955');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Sadie', 'Henry', '2085556800');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Rhoda', 'Kelley', '2085552579');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Jeffrey', 'Smith', '2085557561');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Herman', 'Fernandez', '2085552685');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Olga', 'Hale', '2085552416');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Amy', 'Lawrence', '2085551206');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Devin', 'Medina', '2085552026');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Lula', 'Alexander', '2085556430');
GO

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Maud', 'Johnston', '2085559058');
GO

-- d.2
-- delete one borrower

INSERT INTO [Borrower]
([Borrower_Fname], [Borrower_Lname], [Borrower_Number])
VALUES
('Nathan', 'Baker', '2085559791');
GO

DELETE FROM [Borrower]
WHERE [Borrower_Number] = '2085559791';
GO

-- e.1
-- Add Artists

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Adam', 'Warner', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Randall', 'Dean', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Richard', 'Gray', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Lenora', 'Davidson', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Lucy', 'Peterson', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Trevor', 'Parsons', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Leroy', 'Evans', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Calvin', 'Stephens', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Genevieve', 'Hubbard', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Brett', 'Hudson', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Ethan', 'Meyer', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Lottie', 'Palmer', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Craig', 'Terry', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Myrtle', 'Greer', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Rosalie', 'Park', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Jerome', 'Stone', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Manuel', 'Morgan', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('GreGOry', 'Harper', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Dominic', 'Pope', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Duane', 'Drake', 1);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_LName], [Artist_Type])
VALUES
('Elsie', 'Chapman', 1);
GO

-- Add disks
-- c.1

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Ghost stories', '3/5/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Eye of the camera', '6/27/2000', 1, 3, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Bankrupcy', '7/25/2000', 1, 2, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Cat eat cat world', '1/8/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Down in flames', '9/18/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('FROM insult to injury', '6/26/2000', 1, 1, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('No discounts', '2/19/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Broken ice', '10/19/2000', 1, 1, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Curtain fall', '1/22/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Favoritism', '5/23/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Basket case', '8/24/2000', 1, 3, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Around the bush', '6/5/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Bag of mysteries', '6/12/2000', 1, 3, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Bursting out of my skin', '1/8/2000', 1, 3, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Final breath', '2/22/2000', 1, 1, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Rocket surgery', '8/18/2000', 1, 1, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Total destruction', '12/20/2000', 1, 1, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Army of ants', '1/16/2000', 1, 2, 1);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('No celebration', '12/13/2000', 1, 3, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Pushing up daisies', '8/11/2000', 1, 2, 2);
GO

INSERT INTO [Disk]
([Name], [ReleaseDate], [Type_ID], [Genre_ID], [Status_ID])
VALUES
('Bursting bubbles', '6/13/2000', 1, 1, 2);
GO


-- c.2
-- change 'cat eat cat' to 'dog eat dog'

UPDATE [Disk]
SET [Name] = 'Dog eat dog world'
WHERE [Name] = 'Cat eat cat world';
GO


-- g.1
-- Add artists to disks

-- g.2

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(16, 9);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(14, 9);
GO

-- 

-- g.3

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(6, 13);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(6, 19);
GO

-- 

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(2, 11);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(4, 12);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(1, 13);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(15, 18);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(3, 1);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(10, 8);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(19, 2);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(12, 19);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(7, 2);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(19, 3);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(10, 3);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(18, 8);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(15, 1);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(4, 11);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(7, 13);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(17, 3);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(10, 14);
GO

-- f.1
-- Add borrow history

-- f.4

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(1, 1, '2/11/2019', '2/18/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(1, 1, '2/18/2019', '2/15/2019');
GO

--

-- f.6

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(2, 2, '2/20/2019', '3/1/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(2, 3, '4/1/2019', '4/2/2019');
GO

-- 

-- f.8

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(3, 3, '1/10/2019', '1/20/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(4, 3, '1/20/2019', '1/25/2019');
GO



INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
VALUES
(4, 4, '1/20/2019', '1/25/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(5, 5, '10/15/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(6, 6, '5/23/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(7, 7, '6/15/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(8, 8, '8/21/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(9, 9, '7/2/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(10, 10, '3/14/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(11, 11, '4/12/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(12, 12, '9/15/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(13, 13, '1/1/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(14, 14, '2/9/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(15, 15, '2/24/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(16, 16, '8/24/2019');
GO

INSERT INTO [DiskHasBorrower]
([Disk_ID], [Borrower_ID], [Borrowed_Date])
VALUES
(17, 17, '2/11/2019');
GO

-- f.5
-- no disk number 18 or 19
-- f.7
-- no borrower number 18 or 19

-- h
-- View all checked out disks
SELECT Borrower_ID, Disk_ID, Borrowed_Date, Returned_Date
FROM DiskHasBorrower
where Returned_Date is null;
GO

-- tests
/* 
-- Insert at least 20 rows of data into the disk table
SELECT count(*) as 'Disk Count'
FROM [Disk];
GO

-- Insert at least 20 rows of data into the Borrower table
SELECT count(*) as 'Borrower Count'
FROM [Borrower];
GO

-- Insert at least 20 rows of data into the artist table
SELECT count(*) as 'Artist Count'
FROM [Artist];
GO

-- -- Insert at least 20 rows of data into the DiskHasBorrower table
SELECT count(*) as 'DiskHasBorrower Count'
FROM [DiskHasBorrower];
GO

-- Insert at least 2 different disks
SELECT count(*) as 'Unique Disk Count'
FROM
	(
		SELECT DISTINCT [Disk_ID]
		FROM
		[DiskHasBorrower]
	) as [#DiskCount];
GO

-- insert at least 2 different borrowers
SELECT count(*) as 'Unique Borrower Count'
FROM
	(
		SELECT DISTINCT [Borrower_ID]
		FROM
		[DiskHasBorrower]
	) as [#BorrowerCount];
GO


-- At least 1 disk in the disk table does not have a related row here
SELECT count(*) as 'Number of Unchecked disks'
FROM [Disk]
WHERE [Disk_ID] NOT IN
(
	SELECT [Disk_ID]
	FROM 
	[DiskHasBorrower]
);
GO

-- At least 1 disk must have at least 2 different rows here
SELECT TOP 1 count([Disk_ID]) as 'Disk_ID Count', [Disk_ID]
FROM [DiskHasBorrower]
GROUP BY [Disk_ID]
ORDER BY 'Disk_ID Count' DESC;
GO

-- At least 1 borrower in the borrower table does not have a related row here
SELECT count(*) as 'Number of extra borrowers'
FROM [Borrower]
WHERE [Borrower_ID] NOT IN
(
	SELECT [Borrower_ID]
	FROM 
	[DiskHasBorrower]
);
GO

-- At least 1 borrower must have at least 2 different rows here
SELECT TOP 1 count([Borrower_ID]) as 'Borrower_ID Count', [Borrower_ID]
FROM [DiskHasBorrower]
GROUP BY [Borrower_ID]
ORDER BY 'Borrower_ID Count' DESC;
GO

-- insert at least 20 rows of data into the DiskHasArtist table
SELECT count(*) as 'DiskHasArtist Count'
FROM [Disk_Artists];
GO

-- At least 1 disk must have at least 2 different artist rows here
SELECT TOP 1 count([Disk_ID]) as 'Disk_ID Count', [Disk_ID]
FROM [Disk_Artists]
GROUP BY [Disk_ID]
ORDER BY 'Disk_ID Count' DESC;
GO

-- At least 1 artist must have at least 2 different disk rows here
SELECT TOP 1 count([Artist_ID]) as 'Artist_ID Count', [Artist_ID]
FROM [Disk_Artists]
GROUP BY [Artist_ID]
ORDER BY 'Artist_ID Count' DESC;
GO

 */