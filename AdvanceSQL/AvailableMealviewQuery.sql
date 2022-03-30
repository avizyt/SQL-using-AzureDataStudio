
SELECT top(1000) MealTypeName, RecipeName, IngredientName
from dbo.AvailableMeal;

UPDATE dbo.AvailableMeal
SET IngredientName = 'Spicy Italian Sausage'
WHERE RecipeName= 'Spaghetti';

INSERT INTO dbo.AvailableMeal (MealTypeName, RecipeName)
VALUES ('Lunch', 'Spinach Quiche');