import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:natham_college/screen/study/provider/training_provider.dart';
import 'package:natham_college/screen/study/training/training_details_page.dart';
import 'package:natham_college/screen/study/utils/training_card.dart';

class TrainingListPage extends ConsumerWidget {
  const TrainingListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(publicTrainingsProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        title: Text(
          'Training',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xFFE53935),
        onRefresh: () async {
          ref.invalidate(publicTrainingsProvider);
          await ref.read(publicTrainingsProvider.future);
        },
        child: async.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Color(0xFFE53935)),
          ),
          error: (e, _) => _message(
            icon: Icons.wifi_off_rounded,
            text:
                'Unable to load trainings.\nPlease check your internet connection and try again.',
            actionLabel: 'Retry',
            onAction: () => ref.invalidate(publicTrainingsProvider),
          ),
          data: (items) {
            if (items.isEmpty) {
              return _message(
                icon: Icons.school_outlined,
                text: 'No trainings open right now.\nPlease check back later.',
              );
            }
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final t = items[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TrainingCard(
                    training: t,
                    onTap: () {
                      Get.to(() => TrainingDetailsPage(training: t));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _message({
    required IconData icon,
    required String text,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 420,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 34, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (actionLabel != null) ...[
                    const SizedBox(height: 18),
                    OutlinedButton(
                      onPressed: onAction,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFE53935),
                        side: const BorderSide(color: Color(0xFFE53935)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        actionLabel,
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
