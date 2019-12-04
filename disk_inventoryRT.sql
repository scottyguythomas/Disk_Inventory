-- Scott Thomas
-- Modified: 10/18/2019
-- Week 5 Project
-- 10/23/2019 - added procedures to insert/delete/update for tables disk/borrower/artist. Along with test cases for the new procs
-- replaced disk instert statements with sp_insDisk prc
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


-- insert artist proc
DROP PROC IF EXISTS sp_InsArtist;
GO

Create Proc sp_InsArtist
	@fname varchar(100),
	@artistType int,
	@lname varchar(100) = null
AS
	BEGIN TRY
		insert into Artist
		(Artist_FName, Artist_LName, Artist_Type)
		VALUES
		(@fname, @lname, @artistType);
		return @@identity;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_InsArtist';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- update artist  proc
DROP PROC IF EXISTS sp_UpdateArtist;
GO

CREATE PROC sp_UpdateArtist
	@artistID int,
	@fname varchar(100),
	@artistType int,
	@lname varchar(100) = null
AS
BEGIN TRY
	UPDATE Artist
	SET Artist_FName = @fname,
		Artist_LName = @lname,
		Artist_Type = @artistType
	WHERE Artist_ID = @artistID;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_UpdateArtist';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- delete artist  proc
DROP PROC IF EXISTS sp_DeleteArtist;
GO

Create Proc sp_DeleteArtist
	@artistID int
AS
	BEGIN TRY
		delete from Artist
		WHERE Artist_ID = @artistID;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_DeleteArtist';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--


-- insert borrower proc
DROP PROC IF EXISTS sp_InsBorrower;
GO

Create Proc sp_InsBorrower
	@fname varchar(50),
	@lname varchar(50),
	@number varchar(50)
AS
	BEGIN TRY
		insert into Borrower
		(Borrower_FName, Borrower_LName, Borrower_Number)
		VALUES
		(@fname, @lname, @number);
		RETURN @@IDENTITY;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_InsBorrower';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- update borrower proc
DROP PROC IF EXISTS sp_UpdateBorrower;
GO

Create Proc sp_UpdateBorrower
	@borrowerID int,
	@fname varchar(50),
	@number varchar(50),
	@lname varchar(50)
AS
BEGIN TRY
	update Borrower
	SET Borrower_FName = @fname,
		Borrower_LName = @lname,
		Borrower_Number = @number
	WHERE Borrower_ID = @borrowerID;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_UpdateBorrower';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- delete borrower proc
DROP PROC IF EXISTS sp_DeleteBorrower;
GO

Create Proc sp_DeleteBorrower
	@borrowerID int
AS
	BEGIN TRY
		delete from Borrower
		WHERE Borrower_ID = @borrowerID;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_DeleteArtist';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--


-- insert disk proc
DROP PROC IF EXISTS sp_InsDisk;
GO

Create Proc sp_InsDisk
	@fname varchar(50),
	@releaseDate datetime2,
	@type int,
	@genre int,
	@status int
AS
	BEGIN TRY
		insert into [Disk]
		([Name], ReleaseDate, [Type_ID], Genre_ID, Status_ID)
		VALUES
		(@fname, @releaseDate, @type, @genre, @status);
		RETURN @@IDENTITY;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_InsDisk';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- update Disk proc
DROP PROC IF EXISTS sp_UpdateDisk;
GO

Create Proc sp_UpdateDisk
	@diskID int,
	@fname varchar(50),
	@releaseDate datetime2,
	@type int,
	@genre int,
	@status int
AS
BEGIN TRY
	update [Disk]
	SET [Name] = @fname,
		ReleaseDate = @releaseDate,
		[Type_ID] = @type,
		Genre_ID = @genre,
		Status_ID =	@status
	WHERE Disk_ID = @diskID;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_UpdateDisk';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
--

-- delete Disk proc
DROP PROC IF EXISTS sp_DeleteDisk;
GO

Create Proc sp_DeleteDisk
	@diskID int
AS
	BEGIN TRY
		delete from Disk
		WHERE Disk_ID = @diskID;
	END TRY
	BEGIN CATCH
		print 'an error occurred while calling sp_DeleteArtist';
		print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
		print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
	END CATCH
GO
--

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
('Ready');
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

-- Add Group Artists

INSERT INTO [Artist]
([Artist_FName], [Artist_Type])
VALUES
('The Rolling Stones', 0);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_Type])
VALUES
('Red Hot Chili Peppers', 0);
GO

INSERT INTO [Artist]
([Artist_FName], [Artist_Type])
VALUES
('Arctic Monkeys', 0);
GO

-- 

-- Add disks
-- c.1

exec sp_InsDisk
'Ghost stories', '3/5/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Eye of the camera', '6/27/2000', 1, 3, 1;
GO

exec sp_InsDisk
'Bankrupcy', '7/25/2000', 1, 2, 1;
GO

exec sp_InsDisk
'Cat eat cat world', '1/8/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Down in flames', '9/18/2000', 1, 2, 2;
GO

exec sp_InsDisk
'from insult to injury', '6/26/2000', 1, 1, 1;
GO

exec sp_InsDisk
'No discounts', '2/19/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Broken ice', '10/19/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Curtain fall', '1/22/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Favoritism', '5/23/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Basket case', '8/24/2000', 1, 3, 2;
GO

exec sp_InsDisk
'Around the bush', '6/5/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Bag of mysteries', '6/12/2000', 1, 3, 1;
GO

exec sp_InsDisk
'Bursting out of my skin', '1/8/2000', 1, 3, 1;
GO

exec sp_InsDisk
'Final breath', '2/22/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Rocket surgery', '8/18/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Total destruction', '12/20/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Army of ants', '1/16/2000', 1, 2, 1;
GO

exec sp_InsDisk
'No celebration', '12/13/2000', 1, 3, 2;
GO

exec sp_InsDisk
'Pushing up daisies', '8/11/2000', 1, 2, 2;
GO

exec sp_InsDisk
'Bursting bubbles', '6/13/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Vital Hound', '7/13/2000', 1, 1, 2;
GO

exec sp_InsDisk
'Corroded Pit', '7/13/2000', 1, 2, 2;
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

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(22, 20);
GO

INSERT INTO [Disk_Artists]
([Artist_ID], [Disk_ID])
VALUES
(23, 22);
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

-- create checkout procDROP PROC IF EXISTS sp_CheckoutDisk;

DROP PROC IF EXISTS sp_CheckoutDisk;
GO

Create Proc sp_CheckoutDisk
	@diskID int,
	@borrowerID int,
	@checkoutDate datetime2 = null,
	@returnDate datetime2 = null
AS
	BEGIN TRY
		IF (@checkoutDate is null)
		BEGIN
		   SELECT @checkoutDate = GETDATE();
		END

		IF (@returnDate is null)
		BEGIN
		   SELECT @returnDate = DATEADD(day, 14, @checkoutDate);
		END

		update Disk
		set [Status_ID] = 1
		where Disk_ID = @diskID;

		insert into [dbo].[DiskHasBorrower]
		([Disk_ID], [Borrower_ID], [Borrowed_Date], [Returned_Date])
		VALUES
		(@diskID, @borrowerID, @checkoutDate, @returnDate);
		RETURN @@IDENTITY;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_CheckoutDisk';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
GO
-- 
-- return disk
DROP PROC IF EXISTS sp_ReturnDisk;
GO

Create Proc sp_ReturnDisk
	@transactionID int,
	@returnDate datetime2 = null
AS
	BEGIN TRY
		-- set the date if null
		IF (@returnDate is null)
		BEGIN
		   set @returnDate = GETDATE();
		END
		DECLARE @diskID int;

		-- find the disk id through the transaction id
		select @diskID = Disk_ID
		from DiskHasBorrower
		where Checkout_ID = @transactionID;

		-- update the status to reflect the returned state
		update Disk
		set [Status_ID] = 2
		where Disk_ID = @diskID;

		update [dbo].[DiskHasBorrower]
		set Returned_Date = @returnDate
		where CheckOut_ID = @transactionID;


		RETURN @@IDENTITY;
END TRY
BEGIN CATCH
	print 'an error occurred while calling sp_ReturnDisk';
	print 'ERROR NUMBER: ' + convert(varchar(512), ERROR_NUMBER());
	print 'ERROR MESSAGE: ' + convert(varchar(512), ERROR_MESSAGE());
END CATCH
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


-- 3.

-- select the disk name, release date, and artist name from the disk table
-- link the disk id's to the id's in disk_artist
-- link the artists from disk_artists to the artists in the artist table
select
	[Disk].[Name] as 'Disk Name',
	convert(varchar(10), [disk].[ReleaseDate], 101) as 'Release Date',
	[Artist].[Artist_FName] as 'Artist First Name',
	[Artist].[Artist_LName] as 'Artist Last Name'
from [Disk]
inner join Disk_Artists on [disk].[Disk_ID] = Disk_Artists.Disk_ID
inner join Artist on Disk_Artists.Artist_ID = Artist.Artist_ID
-- check if the artist id exists inside a subquery
-- the sub query grabs the artist id from the disk_artists table
-- due to how subqueries work the artist id is then grouped
-- the results are then filtered by the number of instances of an individual artist id.
where [Disk_Artists].[Artist_ID] in
(
	select [Disk_Artists].[Artist_ID]
	from [Disk_Artists]
	group by [Disk_Artists].[Artist_ID]
	having COUNT([Artist_ID]) = 1
)
order by [artist].[Artist_LName], [Artist].[Artist_FName], [Disk].[Name];

go

-- 4.
-- drop the view if it's already been created
drop view if exists View_Individual_Artist;
go

-- creates a view with the artist id and name stored inside.
-- only stores individual artists and not group artists
create view View_Individual_Artist as
	select Artist_ID, Artist_FName, Artist_LName
	from Artist
	where Artist_Type = 1;
go

-- 4a?
-- "Include the artist id in the view definition but do not display the id in your output."
-- I'm assuming that this means display the newly created view without artist id displayed.

select
	Artist_FName as FirstName,
	Artist_LName as LastName
from View_Individual_Artist;
go

-- 5.
-- select the disk name, release date, and group name from the disk table
-- format the release date to client specs
-- link the disk_artits and artists tables together
-- only grab the artists that aren't inside the solo artist view (groups)
select
	[Disk].[Name] as 'Disk Name',
	convert(varchar(10), [disk].ReleaseDate, 101) as 'Release Date',
	Artist.Artist_FName as 'Group Name'
from Disk
inner join Disk_Artists on [disk].[Disk_ID] = Disk_Artists.Disk_ID
inner join Artist on Disk_Artists.Artist_ID = Artist.Artist_ID
where Disk_Artists.Artist_ID not in
(
	select Artist_ID
	from View_Individual_Artist
)
order by Artist.Artist_FName, [Disk].[Name];

go

-- 6.
-- grab the borrowers first and last name, the dist that they borrowed and the dates that they were borrowed/returned.
-- format the dates to the clients specs
-- connect the tables together on the borrower and disk id's
-- sort them by name then date.
select
	Borrower.Borrower_FName as 'First',
	Borrower.Borrower_LName as 'Last',
	[Disk].[Name] as 'Disk Name',
	Convert(date, DiskHasBorrower.Borrowed_Date)
		as 'Borrowed Date',
	Convert(date, DiskHasBorrower.Returned_Date)
		as 'Returned Date'
from disk
inner join DiskHasBorrower on [Disk].[Disk_ID] = DiskHasBorrower.Disk_ID
inner join Borrower on DiskHasBorrower.Borrower_ID = Borrower.Borrower_ID
order by 'Last', 'First', 'Disk Name', 'Borrowed Date', 'Returned Date';
go

-- 7.
-- get the disk id and name, and a count of the number of instances inside the DiskHasBorrower table
-- join them where the disk id exists inside the DiskHasBorrower
-- 		note: doesn't show disks that haven't been borrowed
-- group the non-aggregate columns together and order by the id
select
	[disk].[Disk_ID] as 'DiskId',
	[Disk].[Name] as 'Disk Name',
	count(DiskHasBorrower.Disk_ID) as 'Times Borrowed'
from Disk
inner join DiskHasBorrower on DiskHasBorrower.Disk_ID = [disk].[Disk_ID]
group by [disk].[Disk_ID], [Disk].[Name]
order by 'DiskId';
go

-- 8.
-- grab the disk name and the dates borrowed along with the last name of the person who borrowed them.
-- format them to client specs
-- join the tables on the disk ids and the borrower ids
-- filter out any rows that have a return date
-- order by the name of the disk
select
	[Disk].[Name] as 'Disk Name',
	Convert(date, DiskHasBorrower.Borrowed_Date)
		as 'Borrowed',
	Convert(date, DiskHasBorrower.Returned_Date)
		as 'Returned',
	Borrower.Borrower_LName as 'Last Name'
from Disk
inner join DiskHasBorrower on DiskHasBorrower.Disk_ID = [disk].[Disk_ID]
inner join Borrower on Borrower.Borrower_ID = DiskHasBorrower.Borrower_ID
where DiskHasBorrower.Returned_Date is null
order by 'Disk Name'
go



-- test borrower procs
declare @ident int;
exec @ident = sp_InsBorrower 'sheriff', '2085551234', 'marshall';
exec sp_UpdateBorrower @ident, 'marshal', '2085551234', 'sheriff';
exec sp_DeleteBorrower @ident;
GO
--
-- test artist procs
declare @ident int;
exec @ident = sp_InsArtist 'brunoooooo', 1, 'marsssssss';
exec sp_UpdateArtist @ident, 'bruno', 1, 'mars';
exec sp_DeleteArtist @ident;
GO
--
-- test disk procs
declare @ident int;
exec @ident = sp_InsDisk '5000 hours of rain', '01/01/2000', 1, 1, 1;
exec sp_UpdateDisk @ident, '10,000 hours of rain', '01/01/2000', 1, 1, 2;
exec sp_DeleteDisk @ident;
GO
--

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