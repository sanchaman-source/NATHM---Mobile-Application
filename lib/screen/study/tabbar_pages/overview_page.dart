import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  final String courseLevel;
  final int courseSeat;
  final String? duration;
  const OverviewPage({
    super.key,
    required this.courseLevel,
    required this.courseSeat,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final bool isBachelor = courseLevel.toLowerCase() == 'bachelor';

    final String programLength =
        duration ?? (isBachelor ? '4 Years' : '2 Years');
    final String levelText = isBachelor ? 'Bachelor' : 'Master';

    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [

        Expanded(
          child: _buildCard(value: programLength, label: 'Program Length'),
        ),

        SizedBox(width: width * 0.01),

        Expanded(
          child: _buildCard(
            value: courseSeat.toString(),
            label: 'Seats Available',
          ),
        ),

        SizedBox(width: width * 0.01),

        Expanded(
          child: _buildCard(value: levelText, label: 'Program Level'),
        ),
      ],
    );
  }

  Widget _buildCard({required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 220, 220),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFFC62828),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.5, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
