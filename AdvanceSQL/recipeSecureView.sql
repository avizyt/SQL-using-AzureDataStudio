CREATE VIEW dbo.RecipeSecure
WITH SCHEMABINDING
AS

SELECT RecipeName, RecipeDescription, IsActive
from dbo.Recipe;

/*
NOTE:: When adding SCHEMABINDING to a view, I have changed how SQL Server handles
changes to the columns contained within the view. Specifically, I cannot modify
columns in the dbo.Recipe table in a way that would impact the view dbo.RecipeSecure.*/
