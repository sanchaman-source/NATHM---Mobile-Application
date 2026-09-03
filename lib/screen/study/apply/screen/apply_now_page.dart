import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natham_college/widgets/application_form.dart';

class ApplyNowPage extends StatefulWidget {
  final String? imagePath;
  final String? courseLevel;
  final String? courseTitle;
  final String? courseDiscipline;
  final int? courseSeat;
  final String? campus;

  const ApplyNowPage({
    super.key,
    this.imagePath,
    this.courseLevel,
    this.courseTitle,
    this.courseDiscipline,
    this.courseSeat,
    this.campus,
  });

  @override
  State<ApplyNowPage> createState() => _ApplyNowPageState();
}

class _ApplyNowPageState extends State<ApplyNowPage> {
  int currentStep = 1;
  final steps = const [
    StepData('Personal'),
    StepData('Address'),
    StepData('Guardian'),
    StepData('Academics'),
    StepData('Declaration'),
    StepData('Review'),
    StepData('Payment'),
  ];

  bool get _hasCourseContext => widget.courseTitle != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          'Admission Application',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: ApplicationFormWidget(
        preSelectedCourse: widget.courseTitle,
        topSection: _hasCourseContext
            ? 
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BannerCard(
                imagePath: widget.imagePath ?? '',
                courseLevel: widget.courseLevel ?? '',
                courseTitle: widget.courseTitle ?? '',
                courseDiscipline: widget.courseDiscipline ?? '',
                courseSeat: widget.courseSeat ?? 0,
                campus: widget.campus ?? '',
              ),
            )
            : null,
        onSubmitted: () {
          Get.back();
        },
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
                        'Apply for ${courseLevel.toLowerCase()} of ${courseDiscipline.toLowerCase()}',
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

                      SizedBox(height: 5),
                      Text(
                        'Complete the form below to submit your application for this program.',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 3),

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
                      _buildInfoItem(value: '4', label: 'Duration'),
                      _buildDivider(),
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

class StepData {
  final String label;
  const StepData(this.label);
}

class ApplicationStepperHeader extends StatelessWidget {
  final int currentStep;
  final List<StepData> steps;

  static const Color accent = Color(0xFF8B1E2D);

  const ApplicationStepperHeader({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / steps.length;
    final currentLabel = steps[currentStep - 1].label;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Step $currentStep of ${steps.length}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: '  —  '),
                    TextSpan(
                      text: currentLabel,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                '${(progress * 100).round()}% COMPLETE',
                style: const TextStyle(
                  color: accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 3,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(accent),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                final stepNumber = index + 1;
                final isActive = stepNumber == currentStep;
                final isCompleted = stepNumber < currentStep;

                return Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: (isActive || isCompleted)
                            ? accent
                            : Colors.grey[300],
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 13,
                                color: Colors.white,
                              )
                            : Text(
                                '$stepNumber',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.white
                                      : Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        steps[index].label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isActive
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isActive ? accent : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
