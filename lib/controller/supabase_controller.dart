import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/main.dart';
import 'package:get/get.dart';
import '../model/resource_model.dart';

class SupabaseController extends GetxController {
  var resourcesList = <ResourceModel>[].obs;
  var filteredResourcesList = <ResourceModel>[].obs;
  var selectedChip = ''.obs; // Track the selected chip

  var isLoading = false.obs;
    var isLoadingList = false.obs;

  @override
  onInit() async {
    super.onInit();
    await getResources();
    filterResourcesByCategory("All");
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

  /// Filters resources based on the provided category.
  void filterResourcesByCategory(String category) {
    selectedChip.value = category; // Update selected chip

    if (category == 'All') {
          isLoadingList.value = true;

      filteredResourcesList.assignAll(resourcesList); // Show all resources
      isLoadingList.value = false;
    } else {
          isLoadingList.value = true;

      // Filter resources by selected category
      filteredResourcesList.assignAll(resourcesList
          .where((resource) => resource.category == category)
          .toList());
      isLoadingList.value = false;
    }
  }
}
