SELECT B.genre, COUNT(L.isbn) AS checkouts
FROM Books AS B LEFT OUTER JOIN Lending AS L ON B.isbn = L.isbn
GROUP BY B.genre
ORDER BY checkouts ASC;