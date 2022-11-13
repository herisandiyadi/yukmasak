import 'package:yukmasak/features/yukmasak/domain/entities/detail_recipe_response.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/recipes_response.dart';

abstract class RecipesRepositoryImplement {
  Future<RecipesResponse> getAllRecipes();
  Future<DetailRecipeResponse> getDetailRecipe(String key);
}
