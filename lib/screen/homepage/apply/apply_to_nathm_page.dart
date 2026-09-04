import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natham_college/screen/homepage/apply/career_form_page.dart';
import 'package:natham_college/screen/homepage/apply/track_your_application_page.dart';

class ApplyToNathmPage extends StatefulWidget {
  const ApplyToNathmPage({super.key});

  @override
  State<ApplyToNathmPage> createState() => _ApplyToNathmPageState();
}

class _ApplyToNathmPageState extends State<ApplyToNathmPage> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Apply to NATHM',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                ApplyToNathmHeader(),

                SizedBox(height: 15),

                ApplicationCards(),

                SizedBox(height: 15),

                TrackAndHelpCards(),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplyToNathmHeader extends StatelessWidget {
  const ApplyToNathmHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFF8B0000),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shield_outlined,
                  size: 12,
                  color: Colors.white.withValues(alpha: 0.95),
                ),
                const SizedBox(width: 6),
                Text(
                  'ONLINE APPLICATIONS',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.95),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Main Title
          const Text(
            'Apply to NATHM',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          // Subtitle
          Text(
            'Choose an application type and complete the correct form online.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationCards extends StatelessWidget {
  const ApplicationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(
          icon: Icons.school_rounded,
          iconBgColor: const Color(0xFF8B0000),
          iconColor: Colors.white,
          title: 'Academic courses',
          description:
              'Apply online, review your details, pay with eSewa, and track by Application No.',
          features: const [
            '7-step bilingual form',
            'eSewa payment',
            'Application tracking',
          ],
          hasBorder: true,
          onTap: () {
            Get.to(() => TrackYourApplicationPage());
          },
        ),

        const SizedBox(height: 16),

        _buildCard(
          icon: Icons.auto_awesome,
          iconBgColor: const Color(0xFFFFEBEE),
          iconColor: const Color(0xFFC62828),
          title: 'Training Form',
          description:
              'Register for professional hospitality, tourism, and guide training programs.',
          features: const [
            'Training select',
            'Work experience',
            'Auto application no.',
          ],
          onTap: () {
            // Navigate to Training form
          },
        ),

        const SizedBox(height: 16),

        _buildCard(
          icon: Icons.work_outline_rounded,
          iconBgColor: const Color(0xFFFFEBEE),
          iconColor: const Color(0xFFC62828),
          title: 'Career Form',
          description:
              'View current openings and submit applications for available positions.',
          features: const ['Open vacancies', 'Online application', 'HR review'],
          onTap: () {
            Get.to(() => CareerFormPage());
          },
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String description,
    required List<String> features,
    required VoidCallback onTap,
    bool hasBorder = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: hasBorder
              ? Border.all(color: const Color(0xFF8B0000), width: 1.5)
              : Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            // Click here to apply
            Row(
              children: [
                Text(
                  'CLICK HERE TO APPLY',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFB71C1C),
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Color(0xFFB71C1C),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 16),

            ...features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 18,
                      color: const Color(0xFFC62828),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      feature,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class TrackAndHelpCards extends StatelessWidget {
  const TrackAndHelpCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(
          icon: Icons.search,
          title: 'Already applied?',
          subtitle: 'Track your admission application using Application No.',
          buttonText: 'TRACK APPLICATION',
          isFilledButton: true,
          onPressed: () {
            Get.to(() => TrackYourApplicationPage());
          },
        ),

        const SizedBox(height: 16),

        _buildCard(
          icon: Icons.phone_outlined,
          title: 'Need help?',
          subtitle:
              'Contact NATHM for documents, eligibility, and fee support.',
          buttonText: 'CONTACT NATHM',
          isFilledButton: false,
          onPressed: () {
            // Navigate to Contact / Help
          },
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required bool isFilledButton,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + Title + Subtitle
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon box
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFFC62828), size: 22),
              ),
              const SizedBox(width: 14),

              // Title + Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey.shade600,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: isFilledButton
                ? ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  )
                : OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
