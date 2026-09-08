import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:natham_college/dummy_data/dummy_banner_data.dart';
import 'package:natham_college/dummy_data/notice_list_dummy_data.dart';
import 'package:natham_college/model/banner_model.dart';
import 'package:natham_college/model/course_card_model.dart';
import 'package:natham_college/model/notice_list_model.dart';
import 'package:natham_college/screen/homepage/apply/apply_to_nathm_page.dart';
import 'package:natham_college/screen/homepage/downloads/download_page.dart';
import 'package:natham_college/screen/notices/notice_page.dart';
import 'package:natham_college/screen/study/course_detail_page.dart';
import 'package:natham_college/screen/study/course_page.dart';
import 'package:natham_college/screen/study/study_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/images/ngvlogo.png', height: 40),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset('assets/images/logonm.png', height: 40),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),

                AutoBannerCarousel(),

                SizedBox(height: height * 0.02),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: stats
                        .map((stat) => StatCard(stat: stat))
                        .toList(),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text(
                  'Quick Links',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2B4C),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _QuickActionItem(
                        icon: Icons.edit_note,
                        label: 'Apply Now',
                        onTapFunction: () {
                          Get.to(() => ApplyToNathmPage());
                        },
                      ),
                      _QuickActionItem(
                        icon: Icons.school_outlined,
                        label: 'Programs',
                        onTapFunction: () {},
                      ),
                      _QuickActionItem(
                        icon: Icons.download_outlined,
                        label: 'Downloads',
                        onTapFunction: () {
                          Get.to(() => DownloadPage());
                        },
                      ),
                      _QuickActionItem(
                        icon: Icons.headset_mic_outlined,
                        label: 'Contact',
                        onTapFunction: () {},
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                NoticePreviewSection(
                  notices: allNotices,
                  onViewAll: () {
                    Get.to(() => NoticesPage());
                  },
                ),

                SizedBox(height: 20),
                FeaturedCoursesSection(
                  courses: dummyCourses,
                  onViewAll: () {
                    Get.to(() => CoursePage());
                  },
                  onCourseTap: (course) {
                    Get.to(
                      () => CourseDetailPage(
                        imagePath: course.imagePath,
                        courseLevel: course.level,
                        courseTitle: course.title,
                        courseDiscipline: course.discipline,
                        courseSeat: course.seats,
                        campus: course.institution,
                      ),
                    );
                  },
                ),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            height: 220,
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
                    'assets/images/nathm.jpg',
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
                        // Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5C518),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'About Nathm',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                            ),
                          ),
                        ),
                        const Spacer(),
                        // Title
                        const Text(
                          'Nepal Academy of Tourism, Hotel and\nMountaineering',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Subtitle
                        Text(
                          'Pioneering hospitality and tourism education in Nepal since 1972',
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
          ),
        ),
        // Dot Indicator
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final StatModel stat;

  const StatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: const Border(
            top: BorderSide(
              color: Color(0xFFC9A227),
              width: 3,
            ), // golden top border
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stat.value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A2B4C), // dark navy
              ),
            ),
            const SizedBox(height: 4),
            Text(
              stat.label,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTapFunction;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapFunction,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 235, 204),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFC9A227),
              size: 24,
            ), // golden icon
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A2B4C),
          ),
        ),
      ],
    );
  }
}

class NoticePreviewSection extends StatelessWidget {
  final List<Notice> notices;
  final VoidCallback onViewAll;
  final int maxItemsToShow;

  const NoticePreviewSection({
    super.key,
    required this.notices,
    required this.onViewAll,
    this.maxItemsToShow = 3,
  });

  @override
  Widget build(BuildContext context) {
    final previewList = notices.take(maxItemsToShow).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Latest Notices",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: onViewAll,
                child: const Text("View All", style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (previewList.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "No notices yet",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else
          Column(
            children: previewList
                .map((notice) => _HomeNoticeCard(notice: notice))
                .toList(),
          ),
      ],
    );
  }
}

class _HomeNoticeCard extends StatelessWidget {
  final Notice notice;
  const _HomeNoticeCard({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          if (notice.isLatest)
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notice.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  notice.category,
                  style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            "${notice.date.day}/${notice.date.month}",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class FeaturedCoursesSection extends StatelessWidget {
  final List<Course> courses;
  final VoidCallback onViewAll;
  final void Function(Course course) onCourseTap;
  final int maxItemsToShow;

  const FeaturedCoursesSection({
    super.key,
    required this.courses,
    required this.onViewAll,
    required this.onCourseTap,
    this.maxItemsToShow = 4,
  });

  @override
  Widget build(BuildContext context) {
    final previewList = courses.take(maxItemsToShow).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular Courses",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: onViewAll, child: const Text("View All")),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 190,
          child: previewList.isEmpty
              ? const Center(
                  child: Text(
                    "No courses available",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: previewList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final course = previewList[index];
                    return GestureDetector(
                      onTap: () => onCourseTap(course),
                      child: _CourseCard(course: course),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _CourseCard extends StatelessWidget {
  final Course course;
  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            width: double.infinity,
            child: Image.asset(course.imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "${course.level} • ${course.duration}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.5, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
