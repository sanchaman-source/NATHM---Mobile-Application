import 'package:flutter/material.dart';

class ApplyPage extends StatelessWidget {
  final VoidCallback? onStartApplication;


  const ApplyPage({super.key,
  required this.onStartApplication
  });

  @override
  Widget build(BuildContext context) {

    final steps = [
      {
        'number': '1',
        'icon': Icons.description_outlined,
        'title': 'Submit Your Application',
        'description':
            'Fill out the online admission form with your personal and academic details.',
      },
      {
        'number': '2',
        'icon': Icons.upload_outlined,
        'title': 'Upload Documents',
        'description':
            'Provide transcripts, citizenship/ID, and passport-size photos as requested.',
      },
      {
        'number': '3',
        'icon': Icons.check_circle_outline,
        'title': 'Entrance / Interview',
        'description':
            'Sit for the entrance exam or interview where applicable for the program.',
      },
      {
        'number': '4',
        'icon': Icons.mail_outline,
        'title': 'Confirm Your Seat',
        'description':
            'Clear the merit list, complete fee payment, and confirm enrollment.',
      },
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'How to Apply',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),

          // Steps (Vertical for mobile)
          ...List.generate(steps.length, (index) {
            final step = steps[index];
            final isLast = index == steps.length - 1;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Circle + Line
                  Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC62828),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            step['icon'] as IconData,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),

                      // Connecting line
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            color: const Color(0xFFC62828).withValues(alpha: 0.25),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 10),

                  // Right: Content
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step['title'] as String,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            step['description'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 28),

          // Start Application Button
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: onStartApplication,
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
                  Text(
                    'Start Application',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios_outlined, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
