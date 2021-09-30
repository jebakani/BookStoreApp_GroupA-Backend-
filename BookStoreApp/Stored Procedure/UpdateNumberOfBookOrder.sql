USE [BookStore]
GO
/****** Object:  StoredProcedure [dbo].[EditNumberOfBooks]    Script Date: 9/30/2021 5:15:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[EditNumberOfBooks]
 @CartId int,
 @type bit,
 @result int output

 as
 begin
  BEGIN TRY
  declare @count  int , @bookid int;

      if Exists(select * from CartList where CartId=@CartId)
	     begin
		   select @count=BookCount,@bookid=BookId from CartList where CartId=@CartId; 
		   if(@type=1)		
			 begin
			   if exists(select * from Books where @count+1<Books.BookCount and BookId=@bookid)
			    begin
				  update CartList
				   set BookCount=@count+1
				   where CartId=@CartId;
				   set @result=1;
				end
				else
				 begin
				  set @result=0;
				 end
			 end
			 else
			   begin
			     update CartList
				   set BookCount=@count-1
				   where CartId=@CartId;
				   set @result=1;
			   end
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