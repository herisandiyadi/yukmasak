import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:yukmasak/features/yukmasak/data/datasources/style.dart';

import 'package:yukmasak/features/yukmasak/presentation/cubit/detailrecipes/detailrecipes_cubit.dart';

class DetailPage extends StatefulWidget {
  final String? keyRecipe;
  const DetailPage({super.key, required this.keyRecipe});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void getDetail() {
    context.read<DetailrecipesCubit>().getDetailRecipes(widget.keyRecipe!);
  }

  @override
  void initState() {
    getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text(widget.keyRecipe.toString().replaceAll('-', ' ')),
        centerTitle: true,
      ),
      body: BlocConsumer<DetailrecipesCubit, DetailrecipesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is DetailrecipesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailrecipesLoaded) {
            final detailData = state.detailRecipeResponse.results;

            return ListView(
              children: [
                detailData.thumb == null
                    ? SizedBox(
                        width: size.width * 0.8,
                        height: size.height * 0.3,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          size: 75,
                          color: greyColor,
                        ),
                      )
                    : Container(
                        width: size.width * 0.8,
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(detailData.thumb!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    detailData.title!,
                    style: darkTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.room_service_outlined,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            detailData.servings!,
                            style: darkTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            detailData.times!,
                            style: darkTextStyle.copyWith(fontSize: 14),
                          )
                        ],
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
                            detailData.difficulty!,
                            style: darkTextStyle.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ReadMoreText(
                    detailData.desc!,
                    trimLines: 4,
                    colorClickableText: blueColor,
                    moreStyle: blueTextStyle,
                    lessStyle: blueTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bahan yang dibutuhkan : ',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: detailData.needItem!
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(item.thumbItem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          item.itemName,
                                          style: darkTextStyle.copyWith(
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Bahan - bahan :'),
                        const SizedBox(
                          height: 6,
                        ),
                        Wrap(
                          children: detailData.ingredient!
                              .map((ingredients) => SizedBox(
                                    width: size.width * 0.8,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.arrow_right),
                                        SizedBox(
                                          width: size.width * 0.6,
                                          child: Text(
                                            ingredients,
                                            maxLines: 3,
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cara pembuatan :',
                        style: darkTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Column(
                        children: detailData.step!
                            .map(
                              (cara) => Column(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.9,
                                    child: Text(
                                      cara,
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Author : ',
                            style: darkTextStyle.copyWith(fontWeight: semiBold),
                          ),
                          Text(
                            detailData.author!.user,
                            style: darkTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Tanggal Terbit : ',
                            style: darkTextStyle.copyWith(fontSize: 10),
                          ),
                          Text(
                            detailData.author!.datePublished,
                            style: darkTextStyle.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Terjadi Kesalahan',
                style: darkTextStyle.copyWith(fontSize: 16),
              ),
              ElevatedButton(
                  onPressed: () {
                    getDetail();
                  },
                  child: const Text('Memuat ulang'))
            ],
          ));
        },
      ),
    );
  }
}
