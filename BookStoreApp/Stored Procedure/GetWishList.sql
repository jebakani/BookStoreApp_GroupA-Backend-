USE BookStore
CREATE PROC GetWishList
(@userId INT)
AS
BEGIN
BEGIN TRY
select 
Books.BookId,BookName,AuthorName,Price,OrginalPrice,Image,WishListId
FROM Books
inner join Wishlist
on WishList.BookId=Books.BookId where WishList.UserId=@userId
END TRY
BEGIN CATCH
END CATCH
END