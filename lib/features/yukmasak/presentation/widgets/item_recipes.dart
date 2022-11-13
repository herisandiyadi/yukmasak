import 'package:flutter/material.dart';
import 'package:yukmasak/features/yukmasak/data/datasources/style.dart';
import 'package:yukmasak/features/yukmasak/domain/entities/recipes_response.dart';
import 'package:yukmasak/features/yukmasak/presentation/pages/detailpage/detail_page.dart';

class ItemRecipes extends StatelessWidget {
  final Result recipesResponse;
  const ItemRecipes({super.key, required this.recipesResponse});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              keyRecipe: recipesResponse.key,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          recipesResponse.thumb,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.08,
                child: Text(
                  recipesResponse.title,
                  style: darkTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 12),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.signal_cellular_alt,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipesResponse.difficulty.toString(),
                    style: darkTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.room_service_outlined,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipesResponse.serving,
                    style: darkTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.timer,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipesResponse.times,
                    style: darkTextStyle.copyWith(fontSize: 11),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
