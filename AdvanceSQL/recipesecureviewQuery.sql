ALTER TABLE dbo.Recipe 
DROP COLUMN RecipeDescription;

SELECT am.MealTypeName, am.RecipeName
from dbo.AvailableMeal as am;