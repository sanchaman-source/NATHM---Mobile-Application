import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natham_college/screen/study/quick_fact_card.dart';
import 'package:natham_college/screen/study/tabbar_pages/apply_page.dart';
import 'package:natham_college/screen/study/tabbar_pages/entry_page.dart';
import 'package:natham_college/screen/study/tabbar_pages/fee_page.dart';
import 'package:natham_college/screen/study/tabbar_pages/overview_page.dart';
import 'package:natham_college/screen/study/tabbar_pages/structure_page.dart';

class CourseDetailPage extends StatefulWidget {
  final String imagePath;
  final String courseLevel;
  final String courseTitle;
  final String courseDiscipline;
  final int courseSeat;
  final String campus;

  const CourseDetailPage({
    super.key,
    required this.imagePath,
    required this.courseLevel,
    required this.courseTitle,
    required this.courseDiscipline,
    required this.courseSeat,
    required this.campus,
  });

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;
  bool _isTabChanging = false;

  final List<String> tabs = ['Overview', 'Structure', 'Entry', 'Fees', 'Apply'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _pageController = PageController();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) return;
      if (_isTabChanging) return;

      _isTabChanging = true;
      _pageController
          .animateToPage(
            _tabController.index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .then((_) => _isTabChanging = false);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

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

        title: Text('Course Details', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),),
        centerTitle: true,
        bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: Container(
          height: 1,
          color: Colors.grey.shade400,
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [

                SizedBox(height: height * 0.02),

                BannerCard(
                  imagePath: widget.imagePath,
                  courseLevel: widget.courseLevel,
                  courseTitle: widget.courseTitle,
                  courseSeat: widget.courseSeat,
                  courseDiscipline: widget.courseDiscipline,
                  campus: widget.campus,
                ),

                SizedBox(height: height * 0.02),

                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  dividerHeight: 0,
                  indicatorPadding: EdgeInsets.only(bottom: 6),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: Color(0xFFC62828),
                    ),
                    insets: EdgeInsets.only(bottom: 0),
                  ),
                  labelColor: const Color(0xFFC62828),
                  unselectedLabelColor: Colors.grey.shade600,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                ),

                ExpandablePageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    if (_isTabChanging) return;
                    _tabController.animateTo(index);
                  },
                  children:  [
                    OverviewPage(courseLevel: widget.courseLevel,
                    courseSeat: widget.courseSeat,
                    ),
                    StructurePage(onGoToDownloads: () {
                      
                    }),
                    EntryPage(courseLevel: widget.courseLevel),
                    FeePage(),
                    ApplyPage(onStartApplication: () {
                      
                    }),
                  ],
                ),


                SizedBox(height: height * 0.02),

                QuickFactsCard(duration: '4 Years', seats: widget.courseSeat, category: widget.courseDiscipline, level: widget.courseLevel, campus: widget.campus,
                onApply: () {
                  
                },
                ), 

                SizedBox(height: height * 0.02),

                HaveAQuestionCard()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  final String imagePath;
  final String courseLevel;
  final String courseTitle;
  final String courseDiscipline;
  final int courseSeat;
  final String campus;

  const BannerCard({
    super.key,
    required this.imagePath,
    required this.courseLevel,
    required this.courseTitle,
    required this.courseDiscipline,
    required this.courseSeat,
    required this.campus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(imagePath, fit: BoxFit.cover),

          // Dark Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.35),
                  Colors.black.withValues(alpha: 0.55),
                  Colors.black.withValues(alpha: 0.78),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Badge
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.school_outlined,
                          color: Colors.white,
                          size: 13,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          courseLevel.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 2),

                // Title + Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Red underline
                      Container(
                        width: 48,
                        height: 3.5,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE53935),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'A bachelor program in $courseDiscipline at $campus.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 3),

                // Bottom Info Row
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                  ),
                  child: Row(
                    children: [
                      _buildInfoItem(
                        value: '$courseSeat',
                        label: 'Seats available',
                      ),
                      _buildDivider(),
                      _buildInfoItem(
                        value: courseDiscipline.replaceAll(' ', '\n'),
                        label: 'Discipline',
                        isMultiLine: true,
                      ),
                      _buildDivider(),
                      _buildInfoItem(value: campus, label: 'Campus'),
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

  Widget _buildInfoItem({
    required String value,
    required String label,
    bool isMultiLine = false,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMultiLine ? 9 : 9,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 42,
      width: 1,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }
}




class HaveAQuestionCard extends StatelessWidget {
  final VoidCallback? onContactAdmissions;
  final VoidCallback? onAskQuestion;

  const HaveAQuestionCard({
    super.key,
    this.onContactAdmissions,
    this.onAskQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
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
          // Title
          const Text(
            'Have a Question?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle
          Text(
            'Our admissions team can help with entry\nrequirements, fees, and the application process.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade600,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 22),

          // Contact Admissions Button (filled)
         SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC62828),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.phone_outlined, size: 15),
                   
                  SizedBox(width: 6),

                  Text(
                    'Contact Admission',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                 
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Ask a Question Button (outlined)
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton.icon(
              onPressed: onAskQuestion,
              icon: const Icon(Icons.chat_bubble_outline, size: 15, color: Colors.black,),
              label: const Text(
                'Ask a Question',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey.shade600, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}