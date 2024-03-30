import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/main.dart';
import 'package:get/get.dart';
import '../model/resource_model.dart';

class SupabaseController extends GetxController {
  var resourcesList = <ResourceModel>[].obs;
  var isLoading = false.obs;
  @override
  onInit() async {
    super.onInit();
    await getResources();
  }

  Future<void> addResource(String title, String content, String category,
      String url, String imageUrl) async {
    final response = await supabase.from('resources').insert({
      'title': title,
      'content': content,
      'category': category,
      'url': url,
      'image_url': imageUrl,
    });

    if (response.error != null) {
      throw Exception('Failed to add resource: ${response.error!.message}');
    }
  }

  Future<void> getResources() async {
    isLoading.value = true;
    final response = await supabase.from('resources').select();
    isLoading.value = false;

    print(response);
    if (response.isEmpty) {
      throw Exception('Failed to fetch resources');
    }
    resourcesList.assignAll(response.map((e) => ResourceModel.fromJson(e)));

    print("res:$resourcesList");
  }
}
