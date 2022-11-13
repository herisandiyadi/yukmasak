import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yukmasak/features/yukmasak/data/repositories/recipes_repository.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/recipes_response.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final RecipesRepository recipesRepository;
  RecipesCubit(this.recipesRepository) : super(RecipesInitial());

  Future<void> getRecipes() async {
    try {
      emit(RecipesLoading());
      final recipesResponse = await recipesRepository.getAllRecipes();
      emit(RecipesLoaded(recipesResponse));
    } catch (e) {
      emit(RecipesFailed(e.toString()));
    }
  }
}
