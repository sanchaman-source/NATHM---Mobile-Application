import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:natham_college/utils/smart_justify_text.dart';

class ScholarshipsPage extends StatelessWidget {
  const ScholarshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade100,
            surfaceTintColor: Colors.grey.shade100,
            title: Text(
              'Scholarships',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black.withValues(alpha: 0.92),
                height: 1.55,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: [
                  BannerHead(),

                  SizedBox(height: 20),

                  ScholarshipTypesSection(),

                   SizedBox(height: 20),

                   DocumentsSection(),

                  SizedBox(height: 20),

                  HowToApplySection()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerHead extends StatelessWidget {
  const BannerHead({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.55),
                  Colors.black.withValues(alpha: 0.75),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scholarships',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  'NATHM offers merit-based, need-based, and special category scholarships so that talent and financial circumstance never stand in the way of a hospitality career.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.92),
                  ),
                  textAlign: TextAlign.justify,
                ),

                const Spacer(),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _buildStatItem(
                        value: '100%',
                        label: 'Maximum tuition\nfee coverage',
                      ),
                      _buildDivider(),
                      _buildStatItem(
                        value: '3',
                        label: 'Scholarship\ncategories available',
                      ),
                      _buildDivider(),
                      _buildStatItem(
                        value: 'Aug 15',
                        label: 'Application\ndeadline, 2026',
                      ),
                      _buildDivider(),
                      _buildStatItem(
                        value: 'All',
                        label: 'Programs\neligible to apply',
                      ),
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

  Widget _buildStatItem({required String value, required String label}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 42,
      color: Colors.white.withValues(alpha: 0.25),
    );
  }
}

class ScholarshipTypesSection extends StatelessWidget {
  const ScholarshipTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WHAT'S AVAILABLE",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: const Color(0xFFB71C1C),
          ),
        ),
        const SizedBox(height: 10),

        Text(
          'Types of Scholarships',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF7A1F1F),
            height: 1.15,
          ),
        ),
        const SizedBox(height: 10),

        Container(
          width: 42,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 18),

        Text(
          'Every award is assessed by the scholarship committee against published criteria. Review each category below to identify where you fit before applying.',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
            height: 1.6,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 36),

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 900) {
              return Column(
                children: [
                  _ScholarshipCard(data: _meritData),
                  const SizedBox(height: 20),
                  _ScholarshipCard(data: _needData),
                  const SizedBox(height: 20),
                  _ScholarshipCard(data: _specialData),
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _ScholarshipCard(data: _meritData)),
                const SizedBox(width: 20),
                Expanded(child: _ScholarshipCard(data: _needData)),
                const SizedBox(width: 20),
                Expanded(child: _ScholarshipCard(data: _specialData)),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ScholarshipCardData {
  final String number;
  final IconData icon;
  final String title;
  final String highlight;
  final String description;
  final List<String> eligibility;

  const _ScholarshipCardData({
    required this.number,
    required this.icon,
    required this.title,
    required this.highlight,
    required this.description,
    required this.eligibility,
  });
}

const _meritData = _ScholarshipCardData(
  number: '01',
  icon: Icons.workspace_premium_rounded,
  title: 'Merit-Based Scholarship',
  highlight: 'UP TO 100% TUITION FEE',
  description:
      'Awarded to top-performing students based on academic results and entrance examination performance.',
  eligibility: [
    'Outstanding academic record in the qualifying examination',
    'High score in the NATHM entrance examination',
    'Academic performance maintained each semester to retain the award',
  ],
);

const _needData = _ScholarshipCardData(
  number: '02',
  icon: Icons.favorite_rounded,
  title: 'Need-Based Scholarship',
  highlight: 'PARTIAL TO FULL SUPPORT',
  description:
      'Available for students from economically disadvantaged backgrounds who demonstrate genuine financial need.',
  eligibility: [
    'Documented proof of family income',
    'Recommendation from the local authority where required',
    'Satisfactory academic standing throughout the program',
  ],
);

const _specialData = _ScholarshipCardData(
  number: '03',
  icon: Icons.groups_rounded,
  title: 'Special Category Scholarship',
  highlight: 'AS PER GOVERNMENT POLICY',
  description:
      'Reserved seats and fee support in line with the Government of Nepal\'s inclusion policies.',
  eligibility: [
    'Belongs to a group covered by government reservation provisions',
    'Valid supporting documentation for the claimed category',
    'Meets the minimum eligibility criteria for the chosen program',
  ],
);

class _ScholarshipCard extends StatelessWidget {
  final _ScholarshipCardData data;

  const _ScholarshipCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFB71C1C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(data.icon, color: Colors.white, size: 22),
              ),
              Text(
                data.number,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withValues(alpha: 0.08),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          Text(
            data.title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            data.highlight,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              color: const Color(0xFFC62828),
            ),
          ),
          const SizedBox(height: 14),

          SmartJustifyText(
            data.description,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF555555),
              height: 1.55,
            ),
          ),
          const SizedBox(height: 22),

          Container(height: 1, color: Colors.grey.shade200),
          const SizedBox(height: 18),

          Text(
            'ELIGIBILITY',
            style: GoogleFonts.poppins(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 12),

          ...data.eligibility.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC62828),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF444444),
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}



class DocumentsSection extends StatelessWidget {
  const DocumentsSection({super.key});

  final List<String> documents = const [
    'Completed scholarship application form',
    'Academic transcripts and character certificate',
    'Citizenship certificate or birth certificate copy',
    'Income verification for need-based applications',
    'Category documentation where a reserved quota is claimed',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BEFORE YOU APPLY',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: const Color(0xFFB71C1C),
          ),
        ),
        const SizedBox(height: 10),
    
        Text(
          "Documents You'll Need",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF7A1F1F),
            height: 1.15,
          ),
        ),
        const SizedBox(height: 10),
    
        Container(
          width: 42,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 18),
    
        Text(
          'Incomplete applications are the most common reason a file is set aside. Prepare these documents before you submit so your application can be reviewed in the first round.',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
            height: 1.6,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 32),
    
        ...List.generate(documents.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 212, 164, 164),
                      width: 1.4,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
    
                Expanded(
                  child: Text(
                    documents[index],
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF222222),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}



class HowToApplySection extends StatelessWidget {
  const HowToApplySection({super.key});

  final List<StepData> steps = const [
    StepData(
      number: '1',
      icon: Icons.description_outlined,
      title: 'Obtain the Form',
      description: 'Collect the scholarship application form from the scholarship office.',
    ),
    StepData(
      number: '2',
      icon: Icons.upload_file_outlined,
      title: 'Attach Documents',
      description: 'Include transcripts, income proof, and category documents as applicable.',
    ),
    StepData(
      number: '3',
      icon: Icons.task_alt_outlined,
      title: 'Submit for Review',
      description: 'Submit before the deadline; a committee reviews all applications.',
    ),
    StepData(
      number: '4',
      icon: Icons.mail_outline_rounded,
      title: 'Receive Decision',
      description: 'Selected candidates are notified and the award is applied to their fees.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'THE PROCESS',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: const Color(0xFFB71C1C),
          ),
        ),
        const SizedBox(height: 12),
    
        Text(
          'How to Apply',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF7A1F1F),
          ),
        ),
        const SizedBox(height: 10),
    
        Container(
          width: 42,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
    
        Text(
          'Four steps from collecting your form to receiving a decision.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 48),
    
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;
    
            if (isMobile) {
              return Column(
                children: steps.map((step) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _StepCard(data: step),
                  );
                }).toList(),
              );
            }
    
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < steps.length; i++) ...[
                  Expanded(child: _StepCard(data: steps[i])),
                  if (i < steps.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 42),
                      child: SizedBox(
                        width: 28,
                        child: CustomPaint(
                          painter: _DashedLinePainter(),
                        ),
                      ),
                    ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class StepData {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const StepData({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _StepCard extends StatelessWidget {
  final StepData data;

  const _StepCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon + number badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFB71C1C),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  data.icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFB71C1C),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    data.number,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB71C1C),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 10),

          Text(
            data.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF666666),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}