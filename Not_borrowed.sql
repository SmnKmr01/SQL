--Write a query to find all books that were not borrowed in the last 6months

SELECT b.Title from Books b
left join Borrowed BR
on B.BookID = BR.BookID
Where b.BOOKID not in
(select BOOKID from Borrowed where BorrowDate > currDate() - Interval 6 month)
or BR.BorrowDate is NULL