import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:natham_college/screen/study/model/training.dart';
import 'training_image.dart';

class TrainingCard extends StatelessWidget {
  final Training training;
  final VoidCallback onTap;

  const TrainingCard({
    super.key,
    required this.training,
    required this.onTap,
  });

  static const _accent = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    final imageUrl = resolveTrainingImage(training.image);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: imageUrl == null
                          ? _placeholder()
                          : Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return _placeholder(loading: true);
                              },
                              errorBuilder: (_, __, ___) => _placeholder(),
                            ),
                    ),
                  ),

                  // Soft gradient at bottom of image
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.25),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Category chip on top-left of image
                  if (training.category.isNotEmpty)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          training.category,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: _accent,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      training.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                        height: 1.35,
                        color: Colors.grey.shade900,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Duration + Fee
                    Row(
                      children: [
                        if (training.duration.isNotEmpty)
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.schedule_rounded,
                                    size: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    training.duration,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Fee badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: _accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            formatTrainingFee(training.fee),
                            style: GoogleFonts.poppins(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: _accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder({bool loading = false}) {
    return Container(
      color: _accent.withValues(alpha: 0.07),
      alignment: Alignment.center,
      child: loading
          ? const SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                color: _accent,
              ),
            )
          : Icon(
              Icons.school_rounded,
              size: 42,
              color: _accent.withValues(alpha: 0.5),
            ),
    );
  }
}