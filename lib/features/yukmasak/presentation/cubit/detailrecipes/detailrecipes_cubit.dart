import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yukmasak/features/yukmasak/data/repositories/recipes_repository.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/detail_recipe_response.dart';

part 'detailrecipes_state.dart';

class DetailrecipesCubit extends Cubit<DetailrecipesState> {
  final RecipesRepository recipesRepository;
  DetailrecipesCubit(this.recipesRepository) : super(DetailrecipesInitial());

  Future<void> getDetailRecipes(String key) async {
    try {
      emit(DetailrecipesLoading());
      final detailResponse = await recipesRepository.getDetailRecipe(key);
      emit(DetailrecipesLoaded(detailResponse));
    } catch (e) {
      emit(DetailrecipesFailed(e.toString()));
    }
  }
}
