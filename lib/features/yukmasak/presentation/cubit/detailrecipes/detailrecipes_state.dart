part of 'detailrecipes_cubit.dart';

abstract class DetailrecipesState extends Equatable {
  const DetailrecipesState();

  @override
  List<Object> get props => [];
}

class DetailrecipesInitial extends DetailrecipesState {}

class DetailrecipesLoading extends DetailrecipesState {}

class DetailrecipesLoaded extends DetailrecipesState {
  final DetailRecipeResponse detailRecipeResponse;
  const DetailrecipesLoaded(this.detailRecipeResponse);

  @override
  List<Object> get props => [detailRecipeResponse];
}

class DetailrecipesFailed extends DetailrecipesState {
  final String message;
  const DetailrecipesFailed(this.message);

  @override
  List<Object> get props => [message];
}
