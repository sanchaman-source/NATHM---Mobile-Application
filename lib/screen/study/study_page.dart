import 'package:flutter/material.dart';
import 'package:natham_college/screen/study/course_page.dart';
import 'package:get/get.dart';

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        title: Text(
          'Study',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade400, height: 1),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.01),

              ExploreYourPathSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreYourPathSection extends StatelessWidget {
  const ExploreYourPathSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F9FA),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore Your Path',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Courses, training, and opportunities to launch\nyour career in hospitality & tourism.',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _CategoryCard(
                  icon: Icons.school_rounded,
                  title: 'Courses',
                  onTap: () {
                    Get.to(
                      () => CoursePage(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _CategoryCard(
                  icon: Icons.workspace_premium_rounded,
                  title: 'Training',
                  onTap: () {
                   
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _CategoryCard(
                  icon: Icons.military_tech_rounded,
                  title: 'Scholarships',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _CategoryCard(
                  icon: Icons.handshake_rounded,
                  title: 'Fellowships',
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Internships - Centered
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.42,
              child: _CategoryCard(
                icon: Icons.work_rounded,
                title: 'Internships',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: const Color(0xFFF5A623).withValues(alpha: 0.2),
        highlightColor: const Color(0xFFF5A623).withValues(alpha: 0.1),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5A623),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 22, color: const Color(0xFF5D4037)),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
