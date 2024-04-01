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
  var isSubmitted = false.obs;

  @override
  onInit() async {
    super.onInit();
    await getResources();
    filterResourcesByCategory("All");
  }

  Future<void> addResource(
      String title, String content, String category, String url) async {
    try {
      // Set loading to true to display the loader
      isSubmitted.value = true;

      // Add resource
      final response = await supabase.from('resources').insert({
        'title': title,
        'content': content,
        'category': category,
        'url': url,
      });

      // If resource added successfully, fetch resources again to refresh the list
      await getResources();
      filterResourcesByCategory('All');
    } catch (e) {
      throw Exception('Failed to add resource: $e');
    } finally {
      // Set loading to false to hide the loader
      isSubmitted.value = false;
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
  void filterResourcesByCategory(String category) async {
    selectedChip.value = category; // Update selected chip

    if (category == 'All') {
      isLoadingList.value = true;

      filteredResourcesList.assignAll(resourcesList); // Show all resources
      isLoadingList.value = false;
    } else {
      isLoadingList.value = true;
      await getResources();
      // Filter resources by selected category
      filteredResourcesList.assignAll(resourcesList
          .where((resource) => resource.category == category)
          .toList());
      isLoadingList.value = false;
    }
  }
}
