import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutNathmPage extends StatelessWidget {
  const AboutNathmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey.shade100,
              surfaceTintColor: Colors.grey.shade100,
              floating: true,
              snap: true,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: Text(
                'About NATHM',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade600,
                ),
              ),
              centerTitle: true,
            ),

            SliverPadding( padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
              children: [
                SizedBox(height: 10),

                AboutNathmCard(),

                SizedBox(height: 10),

                InstitutionalMottoCard(),

                SizedBox(height: 10),

                VisionMissionSection(),

                SizedBox(height: 10),

                AffiliationsGovernanceSection(),

                SizedBox(height: 10),

                OurCampusesSection(),

                SizedBox(height: 10),

                KeyObjectivesSection(),
              ],
            ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutNathmCard extends StatelessWidget {
  const AboutNathmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFC0392B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC0392B).withValues(alpha: 0.3),
            blurRadius: 12,
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Color(0xFFC0392B),
                  size: 18,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.white.withValues(alpha: 0.9),
                      size: 12,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Govt. of Nepal  •  Estd. 1972',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'About NATHM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Nepal's premier tourism and hospitality education institution since 1972",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 12,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _Tag(icon: Icons.menu_book_rounded, text: '50+ Years Legacy'),
              const SizedBox(width: 10),
              _Tag(icon: Icons.public, text: 'Global Alums'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Tag({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InstitutionalMottoCard extends StatelessWidget {
  const InstitutionalMottoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF5E6D3), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFC0392B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 18,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'INSTITUTIONAL MOTTO',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC0392B),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  '"Centre of Excellence"',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Leading human resource development in hospitality & tourism',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    height: 1.4,
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

class VisionMissionSection extends StatelessWidget {
  const VisionMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Header
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.visibility_outlined,
                  color: Color(0xFFC0392B),
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Vision & Mission',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Divider(color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 16),

          _InfoCard(
            icon: Icons.gps_fixed,
            title: 'Our Vision',
            description:
                'To establish NATHM as a world-class center of academic and professional excellence in tourism, mountaineering, and hospitality management education in South Asia.',
          ),

          const SizedBox(height: 12),

          // Our Mission Card
          _InfoCard(
            icon: Icons.flag_outlined,
            title: 'Our Mission',
            description:
                'To produce competent, highly skilled, and ethical managerial workforce for the national and international tourism and hospitality industry through industry-aligned curriculum and hands-on training.',
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: const Color(0xFFC0392B)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC0392B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class AffiliationsGovernanceSection extends StatelessWidget {
  const AffiliationsGovernanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Header
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.verified_user_outlined,
                  color: Color(0xFFC0392B),
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Affiliations & Governance',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _AffiliationCard(
            icon: Icons.school_rounded,
            title: 'Tribhuvan University (TU)',
            description:
                'Academic Affiliation for Bachelor & Master degree programs (BHM, BTTM, MHM).',
          ),

          const SizedBox(height: 12),

          // Ministry Card
          _AffiliationCard(
            icon: Icons.account_balance,
            title: 'Ministry of Culture, Tourism and Civil Aviation',
            description:
                'Under the auspices and apex stewardship of the Government of Nepal.',
          ),
        ],
      ),
    );
  }
}

class _AffiliationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AffiliationCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFC0392B), size: 16),
          ),
          const SizedBox(width: 12),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    height: 1.45,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OurCampusesSection extends StatelessWidget {
  const OurCampusesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Header
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFC0392B),
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Our Campuses',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '4 Locations',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC0392B),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _CampusCard(
            icon: Icons.location_on,
            title: 'Kathmandu (Main Campus)',
            subtitle:
                'Ravi Bhawan, Kalimati, Kathmandu\n(Headquarters & Central Hub)',
            isHQ: true,
          ),
          const SizedBox(height: 10),
          _CampusCard(
            icon: Icons.apartment,
            title: 'Birtamode Branch Campus',
            subtitle: 'Jhapa, Koshi Province (Eastern Regional Hub)',
          ),
          const SizedBox(height: 10),
          _CampusCard(
            icon: Icons.apartment,
            title: 'Banke Branch Campus',
            subtitle: 'Nepalgunj, Lumbini Province (Mid-Western\nRegional Hub)',
          ),
          const SizedBox(height: 10),
          _CampusCard(
            icon: Icons.apartment,
            title: 'Bardibas Branch Campus',
            subtitle: 'Mahottari, Madesh Province (Central-Eastern Hub)',
          ),
        ],
      ),
    );
  }
}

class _CampusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isHQ;

  const _CampusCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isHQ = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFC0392B), size: 16),
          ),
          const SizedBox(width: 12),

          // Text + HQ badge
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    if (isHQ)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC0392B),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'HQ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KeyObjectivesSection extends StatelessWidget {
  const KeyObjectivesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Header
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFFC0392B),
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Key Objectives',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _ObjectiveItem(
            number: '1',
            text:
                'Develop skilled, enterprising managerial personnel capable of leading the global tourism & hospitality industry.',
          ),

          const SizedBox(height: 14),

          _ObjectiveItem(
            number: '2',
            text:
                'Conduct applied research, consultancy, and industry outreach in tourism, mountain tourism, and culinary arts.',
          ),

          const SizedBox(height: 14),

          _ObjectiveItem(
            number: '3',
            text:
                'Promote authentic Nepalese hospitality standards and sustainable tourism practices nationwide.',
          ),
        ],
      ),
    );
  }
}

class _ObjectiveItem extends StatelessWidget {
  final String number;
  final String text;

  const _ObjectiveItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xFFC0392B),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Text
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade800,
              height: 1.45,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
