import 'package:flutter/material.dart';


class QuickFactsCard extends StatelessWidget {
  final String duration;
  final int seats;
  final String category;      
  final String level;         
  final String campus;
  final VoidCallback? onApply;

  const QuickFactsCard({
    super.key,
    required this.duration,
    required this.seats,
    required this.category,
    required this.level,
    required this.campus,
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
          Text(
            'QUICK FACTS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildFactItem(
                  icon: Icons.access_time_rounded,
                  label: 'Duration',
                  value: duration,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFactItem(
                  icon: Icons.people_outline_rounded,
                  label: 'Available Seats',
                  value: seats.toString(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildFactItem(
                  icon: Icons.school_outlined,
                  label: 'Category',
                  value: category,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFactItem(
                  icon: Icons.layers_outlined,
                  label: 'Level',
                  value: level,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildFactItem(
                  icon: Icons.location_city_outlined,
                  label: 'Campus',
                  value: campus,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: onApply,
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
                    'Apply Now',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 15, color: const Color(0xFFC62828)),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}