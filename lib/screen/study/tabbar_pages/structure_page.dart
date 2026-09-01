import 'package:flutter/material.dart';

class StructurePage extends StatelessWidget {
  final VoidCallback? onGoToDownloads;
  const StructurePage({super.key,
  required this.onGoToDownloads
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Structure & Syllabus',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 14),

        // Empty Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Clipboard Icon
              Icon(
                Icons.assignment_outlined,
                size: 30,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),

              // Message
              Text(
                'The semester-wise curriculum for this program hasn\'t been published here yet. Check the Downloads section for the latest syllabus document.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Go to Downloads
              GestureDetector(
                onTap: onGoToDownloads,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download_outlined,
                      size: 18,
                      color: Color(0xFFC62828),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Go to Downloads',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFC62828),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}