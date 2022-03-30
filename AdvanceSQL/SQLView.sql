
/* 
SQL Server Views

What is view?
A view in T-SQL is a means of taking several different items and putting them together to form one cohesive image.
------------------------------------------------------------------------------------
Features::
SQL Server does not store the actual data returned by a view physically. Therefore, each time a view is called, it will use the statement inside the view to pull back the data that currently exists. 

1.One of the advantages for this method is it allows users accessing these views to look at code that is cleaner and easier to read.

2.Another feature of views is that users can be granted permission to the view but not the associated tables. This can allow users to have access to some but not all the data from the tables that make up the view.
*/
------------------------------------------------------------------------------------
--Query For Analysis

ALTER VIEW dbo.AvailableMeal
WITH SCHEMABINDING
AS

    SELECT meal.MealTypeName, 
        rec.RecipeName, 
        rec.RecipeDescription as ServingQuantity, 
        ing.IngredientName
    FROM dbo.Recipe as rec
        INNER JOIN dbo.MealType as meal
        ON rec.MealTypeID = meal.MealTypeID
        INNER JOIN dbo.RecipeIngredient as recing
        ON rec.RecipeID = recing.RecipeID
        INNER JOIN dbo.Ingredient as ing
        ON recing.IngredientID = ing.IngredientID;
