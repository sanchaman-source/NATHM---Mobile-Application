import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  final String courseLevel;
  const EntryPage({super.key, required this.courseLevel});

  @override
  Widget build(BuildContext context) {
    final bool isBachelor = courseLevel.toLowerCase() == 'bachelor';

    final List<String> requirements = isBachelor
        ? [
            'Completion of Grade 12 (10+2) or equivalent from a recognized board',
            'Minimum aggregate marks as set by the current admission notice',
            'English language proficiency as per institute policy',
          ]
        : [
            'Completion of Bachelor\'s degree or equivalent from a recognized university',
            'Minimum CGPA / percentage as set by the current admission notice',
            'English language proficiency as per institute policy',
          ];

    final String note = isBachelor
        ? 'Exact eligibility criteria are confirmed in the official admission notice for each intake.'
        : 'Exact eligibility criteria (including relevant work experience if required) are confirmed in the official admission notice for each intake.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Entry Requirements',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 14),

        // Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Requirements list
              ...requirements.map((text) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Red check icon
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: Color(0xFFC62828),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 4),

              // Note
              Text(
                note,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.grey.shade500,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
