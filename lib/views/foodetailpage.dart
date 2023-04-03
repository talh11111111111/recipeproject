import 'package:flutter/material.dart';

import '../models/recipeclass.dart';

class FoodDetailPage extends StatelessWidget {
  final String title;
  final String images;
  final List<Ingredients> ingredients;
  final List<String> healtlabels;
  const FoodDetailPage(
      {super.key,
      required this.title,
      required this.images,
      required this.ingredients,
      required this.healtlabels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image.network(
                    images.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    title.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'İngredients',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ingredients
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(e.text.toString()),
                            ))
                        .toList(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'Health Labels',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: healtlabels
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
