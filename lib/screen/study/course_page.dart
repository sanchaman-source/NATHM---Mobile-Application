import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:natham_college/model/course_card_model.dart';
import 'package:natham_college/screen/study/course_detail_page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Courses & Programs',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade400, height: 1),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                SizedBox(height: height * 0.01),

                AutoBannerCarousel(),

                SizedBox(height: height * 0.02),

                CoursesAndProgramsPage(),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutoBannerCarousel extends StatefulWidget {
  const AutoBannerCarousel({super.key});

  @override
  State<AutoBannerCarousel> createState() => _AutoBannerCarouselState();
}

class _AutoBannerCarouselState extends State<AutoBannerCarousel> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  // Dummy data — image chai paxi assets bata real haru sanga replace garne
  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/mn.jpg',
      'tag': 'Mountaineering',
      'title': 'Adventure & Mountaineering',
      'subtitle': 'Nepal\'s premier mountaineering & adventure training',
    },
    {
      'image': 'assets/images/trek.jpg',
      'tag': 'Tourism',
      'title': 'Explore Careers in Tourism',
      'subtitle': 'Building future leaders in travel & tourism management',
    },
    {
      'image': 'assets/images/hm.jpg',
      'tag': 'Hotel Management',
      'title': 'Excellence in Hospitality',
      'subtitle': 'World-class training in hotel & hospitality management',
    },
    {
      'image': 'assets/images/mslu.jpg',
      'tag': 'Tourism',
      'title': 'Explore Careers in Tourism',
      'subtitle': 'Building future leaders in travel & tourism management',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!_pageController.hasClients) return;

      int nextPage = _currentPage + 1;
      if (nextPage >= _slides.length) {
        nextPage = 0;
      }

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _slides.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final slide = _slides[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Image
                        Image.asset(
                          slide['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey[300]),
                        ),

                        // Dark Gradient Overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.65),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),

                        // Content
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Badge / Tag
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5C518),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  slide['tag']!,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // Title
                              Text(
                                slide['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Subtitle
                              Text(
                                slide['subtitle']!,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Dot Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_slides.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? const Color(0xFF0F172A)
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class CoursesAndProgramsPage extends StatefulWidget {
  const CoursesAndProgramsPage({super.key});

  @override
  State<CoursesAndProgramsPage> createState() => _CoursesAndProgramsPageState();
}

class _CoursesAndProgramsPageState extends State<CoursesAndProgramsPage> {
  List<Course> allCourses = dummyCourses;

  final List<String> academicLevels = [
    'All',
    'Bachelor',
    'Master',
    'Diploma',
    'Certificate',
  ];

  final List<String> disciplines = [
    'All',
    'Hotel Management',
    'Tourism',
    'Culinary',
    'Mountaineering',
  ];

  String selectedLevel = 'All';
  String selectedDiscipline = 'All';
  String searchQuery = '';

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Course> get filteredCourses {
    return allCourses.where((course) {
      final matchesLevel =
          selectedLevel == 'All' ||
          course.level.toLowerCase() == selectedLevel.toLowerCase();

      final matchesDiscipline =
          selectedDiscipline == 'All' ||
          course.discipline.toLowerCase() == selectedDiscipline.toLowerCase();

      final matchesSearch =
          searchQuery.isEmpty ||
          course.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          course.discipline.toLowerCase().contains(searchQuery.toLowerCase());

      return matchesLevel && matchesDiscipline && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredCourses;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Explore our comprehensive range of programs in hospitality, tourism, and adventure.',
          style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _StatCard(value: '0', label: 'Programs Offered'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatCard(value: '4', label: 'Levels'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatCard(value: '4', label: 'Disciplines'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatCard(value: '52', label: 'Yrs Experience'),
            ),
          ],
        ),
        const SizedBox(height: 14),

        TextField(
          controller: _searchController,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            hintText: 'Search Courses...',
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
                      _searchController.clear();

                      setState(() {
                        searchQuery = '';
                      });
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

        SizedBox(height: 10),

        const Text(
          'ACADEMIC LEVEL',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: academicLevels.map((level) {
              final isSelected = selectedLevel == level;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = level;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isSelected
                            ? Colors.blue
                            : const Color(0xFFE5E7EB),
                      ),
                    ),
                    child: Text(
                      level,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF374151),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 18),

        const Text(
          'DISCIPLINES',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 6,
          runSpacing: 10,
          children: disciplines.map((discipline) {
            final isSelected = selectedDiscipline == discipline;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDiscipline = discipline;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF5A623) : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFF5A623),
                    width: 1.2,
                  ),
                ),
                child: Text(
                  discipline,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFFD97706),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        SizedBox(height: 10),

        results.isEmpty
            ? _buildEmptyState()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.44,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final course = results[index];
                  return CourseCard(
                    course: course,
                    onTap: () {
                      // Course detail page ma navigate garne
                    },
                  );
                },
              ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 50, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'No matching courses found',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Center(child: const SizedBox(height: 4)),
          Text(
            'Try adjusting your filters or search',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 9, color: Color(0xFF6B7280)),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback? onTap;

  const CourseCard({super.key, required this.course, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Image + Badge =====
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  course.imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // Level Badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    course.level,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB45309),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== Content =====
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Duration + Seats
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 11, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      course.duration,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.people_outline,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${course.seats} SEATS',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Discipline — Institution
                Text(
                  '${course.discipline} — ${course.institution}',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF800000),
                  ),
                ),
                const SizedBox(height: 6),

                // Title
                Text(
                  course.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),

                // Short Description (optional)
                if (course.shortDescription.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    course.shortDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 8, color: Colors.grey.shade600),
                  ),
                ],

                const SizedBox(height: 14),

                // View Details Button
                OutlinedButton(
                  onPressed: () {
                    Get.to(
                      () => CourseDetailPage(
                        imagePath: course.imagePath,
                        courseLevel: course.level,
                        courseTitle: course.title,
                        courseDiscipline: course.discipline,
                        courseSeat: course.seats,
                        campus: course.institution,
                      ),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Details',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
