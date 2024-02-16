SELECT M.name, B.title
FROM Books AS B, Members AS M, Lending as L
WHERE B.isbn = L.isbn
	AND M.id = L.id
	AND L.returned IS NULL
ORDER BY M.name DESC;