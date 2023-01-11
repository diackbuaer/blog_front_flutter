import 'dart:convert';

import 'package:api_news/constants/constants.dart';
import 'package:api_news/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  // final posts = [].obs;
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();
  // final token = box.read('token');

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${baseUrl}feeds'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in json.decode(response.body)['feeds']) {
          posts.value.add(PostModel.fromJson(item));
        }
        // print(json.decode(response.body));
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future createPost({
    required String body,
  }) async {
    try {
      var data = {'body': body};

      var response = await http.post(Uri.parse('${baseUrl}feed/store'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          },
          body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
