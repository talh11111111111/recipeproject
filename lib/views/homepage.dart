// ignore_for_file: depend_on_referenced_packages, must_be_immutable, override_on_non_overriding_member, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeproject/views/foodetailpage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/recipeservice.dart';
import '../widgets/headertext.dart';
import '../widgets/info.dart';
import '../widgets/searchfoodtextfield.dart';
import '../widgets/textdesign.dart';
import 'package:share_plus/share_plus.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  void sharePressed(String link) {
    Share.share(link);
  }

  TextEditingController _controller = TextEditingController();

  OpenseaController openseaController = Get.put(OpenseaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(),
              SearchFoodTextField(
                  controller: _controller,
                  postfunction: IconButton(
                      onPressed: () {
                        openseaController.recipeservice(_controller.text);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return openseaController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : openseaController.openseaModel!.hits!.isEmpty
                        ? const Info(
                            text: 'There is no result',
                          )
                        : ValueListenableBuilder(
                            valueListenable:
                                Hive.box('favourites').listenable(),
                            builder: (context, box, child) {
                              return SizedBox(
                                height: 450,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: openseaController
                                      .openseaModel?.hits!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = openseaController
                                        .openseaModel?.hits![index].recipe;
                                    final isfav = box.get(index) != null;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FoodDetailPage(
                                                      title:
                                                          data.label.toString(),
                                                      images:
                                                          data.image.toString(),
                                                      ingredients: data
                                                          .ingredients!
                                                          .toList(),
                                                      healtlabels: data
                                                          .healthLabels!
                                                          .toList(),
                                                    )));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 0.3,
                                            )),
                                        margin:
                                            const EdgeInsetsDirectional.only(
                                                end: 6),
                                        height: 430,
                                        width: 250,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: FadeInImage.memoryNetwork(
                                                placeholder: kTransparentImage,
                                                image: data!.image != null
                                                    ? data.image.toString()
                                                    : 'https://cdn3.iconfinder.com/data/icons/design-n-code/100/272127c4-8d19-4bd3-bd22-2b75ce94ccb4-512.png',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxHeight: 36),
                                                    onPressed: () async {
                                                      if (isfav) {
                                                        await box.delete(index);
                                                      } else {
                                                        await box.put(
                                                            index, data.label);
                                                      }
                                                    },
                                                    icon: Icon(
                                                      isfav
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border_outlined,
                                                      color: isfav
                                                          ? Colors.pink
                                                          : Colors.black,
                                                    )),
                                                IconButton(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxHeight: 36),
                                                    onPressed: () {
                                                      sharePressed(data.shareAs
                                                          .toString());
                                                    },
                                                    icon: const Icon(
                                                      Icons.share,
                                                    )),
                                              ],
                                            ),
                                            TextDesign(
                                              cal:
                                                  '${data.calories!.toStringAsFixed(0)} Calori',
                                              title: data.label,
                                              text: data.mealType.toString(),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
              })
            ],
          ),
        ),
      ),
    );
  }
}
