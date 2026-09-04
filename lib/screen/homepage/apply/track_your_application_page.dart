import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natham_college/widgets/application_form.dart';

class TrackYourApplicationPage extends StatefulWidget {
  const TrackYourApplicationPage({super.key});

  @override
  State<TrackYourApplicationPage> createState() =>
      _TrackYourApplicationPageState();
}

class _TrackYourApplicationPageState extends State<TrackYourApplicationPage> {
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
        title: Text(
          'Track Your Application',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

                HeaderBannerCard(),

                SizedBox(height: 15),

                TrackApplicationCard(),

                SizedBox(height: 15),

                DownloadAdmitCardCard(),

                SizedBox(height: 10),

                ApplicationFormWidget(
                  topSection: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10.0),
                    child: ApplicationFormHeader(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderBannerCard extends StatelessWidget {
  const HeaderBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),

          Container(color: Colors.black.withValues(alpha: 0.55)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        size: 14,
                        color: Colors.white.withValues(alpha: 0.95),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'ADMISSIONS',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.95),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Apply for Admission',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
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
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Complete the application, review your details, and enter payment information before final submission.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const Spacer(),

              Container(
                width: double.infinity,
                color: Colors.black.withValues(alpha: 0.72),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    _statItem(value: '7', label: 'Steps to complete'),
                    _verticalDivider(),
                    _statItem(value: '10—15', label: 'Minutes to finish'),
                    _verticalDivider(),
                    _statItem(value: 'Bilingual', label: 'English and Nepali'),
                    _verticalDivider(),
                    _statItem(value: 'Review', label: 'Check before payment'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem({required String value, required String label}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 48,
      color: Colors.white.withValues(alpha: 0.25),
    );
  }
}

class TrackApplicationCard extends StatelessWidget {
  const TrackApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
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
          const Text(
            'TRACK YOUR APPLICATION',
            style: TextStyle(
              color: Color(0xFFC62828),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),

          // Title
          const Text(
            'Check admission status',
            style: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            'Enter your Application No to view the current admission status and payment confirmation.',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 10,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // Application No TextField
          TextField(
            decoration: InputDecoration(
              hintText: 'Application No, e.g. ADM-2026-CJMJNF',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFC62828),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // TRACK Button (full width)
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 16, color: Colors.white),
              label: const Text(
                'TRACK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB71C1C),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadAdmitCardCard extends StatelessWidget {
  const DownloadAdmitCardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
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
          // INTERVIEW ADMIT CARD
          const Text(
            'INTERVIEW ADMIT CARD',
            style: TextStyle(
              color: Color(0xFFC62828),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),

          // Title
          const Text(
            'Download your admit card',
            style: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            'Enter your Application No to download your interview admit card. It becomes available only after the academy has issued it for your group.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
          ),
          const SizedBox(height: 20),

          // Application No TextField
          TextField(
            decoration: InputDecoration(
              hintText: 'Application No, e.g. ADM-2026-CJMJNF',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFC62828),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // DOWNLOAD Button (full width)
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.description_outlined,
                size: 16,
                color: Colors.white,
              ),
              label: const Text(
                'DOWNLOAD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB06A6A),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationFormHeader extends StatelessWidget {
  final String eyebrow;
  final String title;

  const ApplicationFormHeader({
    super.key,
    this.eyebrow = 'APPLICATION FORM',
    this.title = 'Admission Application',
  });

  static const _accent = Color(0xFF8B1E2D);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: _accent,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 40, height: 3, color: _accent),
      ],
    );
  }
}
