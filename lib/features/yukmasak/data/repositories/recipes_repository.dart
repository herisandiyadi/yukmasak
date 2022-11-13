import 'dart:convert';

import 'package:yukmasak/features/yukmasak/data/datasources/helper.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/detail_recipe_response.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/recipes_response.dart';
import 'package:yukmasak/features/yukmasak/domain/repositories/recipes_repository_impl.dart';
import 'package:http/http.dart' as http;

class RecipesRepository implements RecipesRepositoryImplement {
  @override
  Future<RecipesResponse> getAllRecipes() async {
    final url = Uri.parse('$baseUrl/api/recipes');

    final response = await http.get(url);
    final jsonResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final result = RecipesResponse.fromJson(jsonResult);

      return result;
    }

    throw UnimplementedError();
  }

  @override
  Future<DetailRecipeResponse> getDetailRecipe(String key) async {
    final url = Uri.parse('$baseUrl/api/recipe/$key');
    final response = await http.get(url);
    final jsonResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final result = DetailRecipeResponse.fromJson(jsonResult);

      return result;
    }
    throw UnimplementedError();
  }
}
