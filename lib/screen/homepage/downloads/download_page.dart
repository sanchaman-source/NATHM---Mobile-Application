import 'package:flutter/material.dart';
import 'package:natham_college/dummy_data/download_list_dummy_data.dart';
import 'package:natham_college/model/download_document_model.dart';
import 'package:natham_college/widgets/download_list_item.dart';
import 'package:get/get.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String searchQuery = '';
  String selectedCategory = 'ALL';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {"name": "ALL", "count": 13},
    {"name": "NOTICE", "count": 7},
    {"name": "EXAM", "count": 2},
    {"name": "ADMISSION", "count": 2},
    {"name": "FORM", "count": 1},
    {"name": "TRAINING NOTICE", "count": 1},
  ];

  List<DownloadDocument> get filteredDownloads {
    Iterable<DownloadDocument> result = dummyDownloads;

    if (selectedCategory != 'ALL') {
      result = result.where(
        (doc) => doc.category.toUpperCase() == selectedCategory,
      );
    }

    if (searchQuery.trim().isNotEmpty) {
      final query = searchQuery.toLowerCase();
      result = result.where(
        (doc) =>
            doc.title.toLowerCase().contains(query) ||
            doc.category.toLowerCase().contains(query),
      );
    }

    return result.toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Downloads',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                SizedBox(height: 10),

                SizedBox(height: 280, child: BannerCard()),

                SizedBox(height: 20),

                DocumentSearchFilterSection(
                  searchQuery: searchQuery,
                  searchController: _searchController,
                  onSearchChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  filteredCount: filteredDownloads.length,
                ),

                SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: filteredDownloads.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              "No documents found",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(filteredDownloads.length, (
                            index,
                          ) {
                            final isLast =
                                index == filteredDownloads.length - 1;
                            return Column(
                              children: [
                                DownloadListItem(
                                  document: filteredDownloads[index],
                                  onDownload: () {},
                                ),
                                if (!isLast)
                                  Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                              ],
                            );
                          }),
                        ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  final int filesAvailable = 14;
  final int documentCategories = 5;
  final String mostRecentlyPublished = "03 Sept 2026";
  final String freeText = "Free";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/nathmtwo.jpeg', fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: 0.55)),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 20, 0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.folder_outlined,
                          size: 12,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "RESOURCES",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "Downloads",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, top: 8),
              height: 4,
              width: 50,
              color: const Color(0xFFE53935),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Examination syllabus, application forms, governing laws, and academy publications — available to download.",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 11,
                  height: 1.45,
                ),
              ),
            ),

            SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.black.withValues(alpha: 0.65),
              child: Row(
                children: [
                  _buildStatItem(
                    value: "$filesAvailable",
                    label: "Files available",
                  ),
                  _divider(),
                  _buildStatItem(
                    value: "$documentCategories",
                    label: "Document categories",
                  ),
                  _divider(),
                  _buildStatItem(
                    value: mostRecentlyPublished,
                    label: "Most recently published",
                  ),
                  _divider(),
                  _buildStatItem(
                    value: freeText,
                    label: "To download and print",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem({required String value, required String label}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withValues(alpha: 0.25),
    );
  }
}

class DocumentSearchFilterSection extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final TextEditingController searchController;

  final List<Map<String, dynamic>> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final int filteredCount;

  const DocumentSearchFilterSection({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.searchController,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.filteredCount,
  });

  int get totalDocuments =>
      categories.firstWhere((c) => c["name"] == "ALL")["count"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            TextField(
              controller: searchController,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              onChanged: onSearchChanged,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Search Documents',
                hintStyle: const TextStyle(fontSize: 12),
                prefixIcon: const Icon(Icons.search),
                prefixIconConstraints: const BoxConstraints.tightFor(
                  width: 36,
                  height: 36,
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 36,
                          height: 36,
                        ),
                        onPressed: () {
                          searchController.clear();
                          onSearchChanged('');
                        },
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints.tightFor(
                  width: 36,
                  height: 36,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(189, 189, 189, 1),
                    width: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final bool isSelected = selectedCategory == category["name"];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => onCategorySelected(category["name"]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFC62828)
                              : const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "${category["name"]} ${category["count"]}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Showing $filteredCount of $totalDocuments documents",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13.5),
          ),
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}
