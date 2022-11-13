import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yukmasak/features/yukmasak/data/repositories/recipes_repository.dart';
import 'package:yukmasak/features/yukmasak/presentation/cubit/detailrecipes/detailrecipes_cubit.dart';
import 'package:yukmasak/features/yukmasak/presentation/cubit/recipes/recipes_cubit.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/home.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesCubit(
            RecipesRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => DetailrecipesCubit(
            RecipesRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/homepage': (context) => Home(
                tabIndex: 0,
              )
        },
      ),
    );
  }
}
