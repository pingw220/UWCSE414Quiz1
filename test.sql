CREATE TABLE Lending (
	isbn INT REFERENCES Books,
	id INT REFERENCES Members,
	checkout DATETIME,
	returned DATETIME
);

SELECT M.name, B.title
FROM Books AS B, Members AS M, Lending as L
WHERE B.isbn = L.isbn
	AND M.id = L.id
	AND L.returned IS NULL
ORDER BY M.name DESC;

SELECT B.genre, COUNT(L.isbn) AS checkouts
FROM Books AS B LEFT OUTER JOIN Lending AS L ON B.isbn = L.isbn
GROUP BY B.genre
ORDER BY checkouts ASC;

SELECT DISTINCT  M.id, M.name
FROM Books AS B, Members AS M, Lending AS L
WHERE B.isbn = L.isbn
	AND M.id = L.id
	AND B.title = 'Leaves of Grass'
	AND EXISTS (
		SELECT *
		FROM Books AS B1, Members AS M1, Lending AS L1
		WHERE B1.isbn = L1.isbn
			AND M1.id = L1.id
			AND M1.id = M.id
			AND B1.title = 'Moby Dick');