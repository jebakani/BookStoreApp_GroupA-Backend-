USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[UserDetailsInsert]    Script Date: 9/28/2021 2:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UserDetailsInsert]
(
@address varchar(255),
@city varchar(50),
@state varchar(50),
@type varchar(10),
@userId int
)
AS
BEGIN
BEGIN TRY
INSERT INTO UserDetails(address,city,state,type,userId)
values(@address,@city,@state,@type,@userId)
END TRY
BEGIN CATCH 
END CATCH
END