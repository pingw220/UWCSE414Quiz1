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

SELECT DISTINCT  M.id, M.name
FROM Books AS B, Members AS M, Lending AS L
WHERE B.isbn = L.isbn
	AND M.id = L.id
	AND B.title = 'b1'
	AND EXISTS (
		SELECT *
		FROM Books AS B1, Members AS M1, Lending AS L1
		WHERE B1.isbn = L1.isbn
			AND M1.id = L1.id
			AND M1.id = M.id
			AND B1.title = 'b2');