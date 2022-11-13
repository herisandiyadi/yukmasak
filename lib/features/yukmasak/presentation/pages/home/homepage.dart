import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yukmasak/features/yukmasak/data/datasources/style.dart';
import 'package:yukmasak/features/yukmasak/presentation/cubit/recipes/recipes_cubit.dart';
import 'package:yukmasak/features/yukmasak/presentation/widgets/item_recipes.dart';
import 'package:yukmasak/features/yukmasak/presentation/widgets/search_nav.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void getData() {
    context.read<RecipesCubit>().getRecipes();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SearchNav(),
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resep Terbaru',
                style:
                    darkTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocConsumer<RecipesCubit, RecipesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is RecipesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is RecipesLoaded) {
                        final dataRecipes = state.recipesResponse.results;
                        return Row(
                          children: dataRecipes
                              .map((recipes) => ItemRecipes(
                                    recipesResponse: recipes,
                                  ))
                              .toList(),
                        );
                      }
                      return Container();
                    }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
