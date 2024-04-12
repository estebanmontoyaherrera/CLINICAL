CREATE OR ALTER PROCEDURE uspList 
(
@PageNumber INT,
@PageSize INT
)
AS
BEGIN
    
	ORDER BY Id
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END 
GO