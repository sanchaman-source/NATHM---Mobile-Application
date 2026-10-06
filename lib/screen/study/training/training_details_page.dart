import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:natham_college/screen/study/model/training.dart';
import 'package:natham_college/screen/study/utils/training_image.dart';

class TrainingDetailsPage extends StatelessWidget {
  final Training training;
  const TrainingDetailsPage({super.key, required this.training});

  static const _maroon = Color(0xFF7A1B2E);

  String _norm(String s) => s.trim().toLowerCase();

  @override
  Widget build(BuildContext context) {
    final t = training;
    final imageUrl = resolveTrainingImage(t.image);

    final intro = t.introduction.trim();
    final showPurpose =
        t.purpose.trim().isNotEmpty && _norm(t.purpose) != _norm(intro);
    final showBackground =
        t.background.trim().isNotEmpty &&
        _norm(t.background) != _norm(intro) &&
        _norm(t.background) != _norm(t.purpose);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 220,
            backgroundColor: _maroon,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: imageUrl == null
                  ? _imagePlaceholder()
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => _imagePlaceholder(),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (t.category.isNotEmpty) _categoryChip(t.category),
                  if (t.category.isNotEmpty) const SizedBox(height: 10),
                  Text(
                    t.title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _infoRow(),
                  if (t.feeNote.trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      t.feeNote,
                      style: GoogleFonts.inter(
                        fontSize: 12.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                  _textSection('About this training', intro),
                  if (showPurpose) _textSection('Purpose', t.purpose),
                  if (showBackground) _textSection('Background', t.background),
                  _listSection('Objectives', t.objectives),
                  _textSection('Target group', t.targetGroup),
                  _listSection(
                    'Admission requirements',
                    t.admissionRequirements,
                  ),
                  _listSection('Subjects', t.subjects),
                  _listSection('Goals', t.goals),
                  _listSection('Expected outcomes', t.expectedOutcomes),
                  _textSection('Curriculum', t.curriculum),
                  _textSection('Methodology', t.methodology),
                  _textSection('Evaluation', t.evaluation),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: _maroon,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.mail_outline_rounded),
              label: Text(
                'Contact us to apply',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder() => Container(
    color: _maroon,
    alignment: Alignment.center,
    child: const Icon(Icons.school_rounded, size: 64, color: Colors.white54),
  );

  Widget _categoryChip(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: _maroon.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: _maroon,
      ),
    ),
  );

  Widget _infoRow() {
    final items = <Widget>[
      if (training.duration.isNotEmpty)
        _infoTile(Icons.schedule_rounded, 'Duration', training.duration),
      _infoTile(
        Icons.payments_outlined,
        'Fee',
        formatTrainingFee(training.fee),
      ),
      if ((training.campusName ?? '').isNotEmpty)
        _infoTile(Icons.location_city_rounded, 'Campus', training.campusName!),
      if ((training.programName ?? '').isNotEmpty)
        _infoTile(Icons.menu_book_rounded, 'Program', training.programName!),
    ];
    return Wrap(spacing: 10, runSpacing: 10, children: items);
  }

  Widget _infoTile(IconData icon, String label, String value) => Container(
    constraints: const BoxConstraints(minWidth: 140),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: _maroon),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 22, bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: _maroon,
      ),
    ),
  );

  // Khali string bhaye kei dekhaudaina
  Widget _textSection(String title, String body) {
    if (body.trim().isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        Text(
          body.trim(),
          style: GoogleFonts.inter(fontSize: 14, height: 1.55),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _listSection(String title, List<String> items) {
    final clean = items.where((e) => e.trim().isNotEmpty).toList();
    if (clean.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        ...clean.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 16,
                    color: _maroon.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    e.trim(),
                    style: GoogleFonts.inter(fontSize: 14, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
