USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromUserDetails]    Script Date: 9/30/2021 12:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[RemoveFromUserDetails]
@AddressId INT 
AS
BEGIN
BEGIN TRY
Delete FROM UserDetails Where AddressId =@AddressId  
END TRY
BEGIN CATCH
END CATCH
END