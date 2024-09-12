import 'package:flutter_resource_gallery/main.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:get/get.dart';
import '../model/resource_model.dart';

class SupabaseController extends GetxController {
  var resourcesList = <ResourceModel>[].obs;
  var filteredResourcesList = <ResourceModel>[].obs;
  var selectedChip = ''.obs; // Track the selected chip

  var isLoading = false.obs;
  var isLoadingList = false.obs;
  var isSubmitted = false.obs;
  var countResourcesList = <Map<String, dynamic>>[].obs;
  var _currentPage = 0;
 final int _limit = 10; // Number of items per page

  @override
  onInit() async {
    super.onInit();
    await getResources();
    filterResourcesByCategory("All");
    await getCountResources();
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

  Future<void> getResources({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 0; // Reset page count if refreshing the data
      resourcesList.clear(); // Clear previous data
    }
    
    isLoading.value = true;
    
    final response = await supabase
        .from('resources')
        .select()
        .range(_currentPage * _limit, (_currentPage + 1) * _limit - 1); // Pagination

    isLoading.value = false;

    if (response.isEmpty) {
      throw Exception('Failed to fetch resources');
    }

    resourcesList.addAll(response.map((e) => ResourceModel.fromJson(e)));
    _currentPage++; // Increase page count after successful fetch
    print("res: $resourcesList");
  }

  Future<void> getCountResources() async {
    for (var category in dropDownCategories) {
      final response = await supabase
          .from('resources').select()
          .eq('category', category)
          .single()
          .count();
      countResourcesList.assignAll(response.data['category']);
    }
    print("countres: $countResourcesList");
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

  /// Method to load more resources when reaching the end of the list
  Future<void> loadMoreResources() async {
    if (!isLoading.value) {
      await getResources();
    }
  }
}
