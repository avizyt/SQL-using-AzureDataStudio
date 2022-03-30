CREATE FUNCTION dbo.IngredientsByRecipe (@RecipeID INT)
RETURNS TABLE
AS 
RETURN
(
    SELECT meal.MealTypeName, rec.ServingQuantity, ing.IngredientName
    from dbo.Recipe rec 
        INNER join dbo.MealType meal
        on rec.MealTypeID = meal.MealTypeID
        inner join dbo.RecipeIngredient recing 
        on rec.RecipeID = recing.RecipeID
        inner join dbo.Ingredient ing 
        on recing.IngredientID = ing.IngredientID
        WHERE rec.RecipeID = @RecipeID

);
GO
