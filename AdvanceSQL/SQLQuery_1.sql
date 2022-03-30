SELECT ing.IngredientName,ingcos.Cost,srv.ServingPortionQuantity, dbo.Ingredient_Price(ingcos.Cost, srv.ServingPortionQuantity) as PerPiece

from dbo.Ingredient ing 
    INNER JOIN dbo.IngredientCost ingcos 
    ON ing.IngredientID = ingcos.IngredientID
    INNER JOIN dbo.ServingPortion srv 
    ON ingcos.ServingPortionID = srv.ServingPortionID;

SELECT *
FROM dbo.IngredientsByRecipe(5);

SELECT rec.RecipeName, inglis.IngredientName, inglis.IngredientCost
from dbo.Recipe rec 
inner join dbo.RecipeIngredient recing 
on rec.RecipeID = recing.RecipeID
inner join dbo.Ingredient ing 
on recing.IngredientID = ing.IngredientID
CROSS APPLY dbo.IngredientCostByIngredientID(ing.IngredientID) inglis

WHERE ing.IngredientName = 'Italian Sausage';