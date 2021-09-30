USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[PlaceTheOrder]    Script Date: 9/30/2021 3:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[PlaceTheOrder]
 @BookId int,
 @UserId int,
 @OrderDate varchar(20),
 @CartId int,
 @result int output

 as
 begin
  BEGIN TRY
  BEGIN TRAN
	     begin
		   insert into Orders values (@BookId,@UserId,@OrderDate)
		   set @result=1
		   end
	    if(@result=1)
	      begin
	       delete from CartList where CartId=@CartId
		  Commit Tran
		end
  END TRY
  begin catch
      set @result=0;
	  Rollback Tran
  end catch
 end