// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:recipeproject/models/recipeclass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenseaController extends GetxController {
  var isLoading = false.obs;
  RecipeClass? openseaModel;
  var appid = 'c88db88c';
  var appKey = 'a979440264003b4df1966113ba975724';

  @override
  Future<void> onInit() async {
    super.onInit();
    recipeservice('');
  }

  recipeservice(String foodname) async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          'https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=$foodname&app_id=$appid&app_key=$appKey&&health=celery-free&imageSize=LARGE&field=uri&field=label&field=image&field=images&field=source&field=shareAs&field=yield&field=healthLabels&field=ingredients&field=calories&field=totalTime&field=mealType'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        openseaModel = RecipeClass.fromJson(result);
        update();
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
