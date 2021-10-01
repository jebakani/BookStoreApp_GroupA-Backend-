USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromCart]    Script Date: 9/29/2021 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RemoveFromCart]
 @CartId int,
 @result int output

 as
 begin
  BEGIN TRY
      if Exists(select * from CartList where CartId=@CartId)
	     begin
		   DELETE FROM CartList WHERE CartId=@CartId;
		   set @result=1;
		 end
	  else
	     begin
		   set @result=0;
		 end
  END TRY
  begin catch
      set @result=0;
  end catch
 end