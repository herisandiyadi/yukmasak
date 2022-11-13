part of 'recipes_cubit.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final RecipesResponse recipesResponse;
  const RecipesLoaded(this.recipesResponse);

  @override
  List<Object> get props => [recipesResponse];
}

class RecipesFailed extends RecipesState {
  final String message;
  const RecipesFailed(this.message);

  @override
  List<Object> get props => [message];
}
