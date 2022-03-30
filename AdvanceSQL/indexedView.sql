CREATE UNIQUE CLUSTERED INDEX CX_AvailableMeal_RecipeNameIngredientsName
ON dbo.AvailableMeal (RecipeName, IngredientName);