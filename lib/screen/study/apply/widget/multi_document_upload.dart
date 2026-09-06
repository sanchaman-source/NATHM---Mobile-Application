import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedDoc {
  PickedDoc({required this.file, required this.name});
  final File file;
  final String name;
  bool get isPdf => name.toLowerCase().endsWith('.pdf');
}

class MultiDocumentUploadBox extends StatefulWidget {
  const MultiDocumentUploadBox({
    super.key,
    required this.minFiles,
    required this.maxFiles,
    this.hintLabel = 'transcript, certificate, etc.',
    this.maxSizeMB = 10,
    this.initialFiles,
    this.onChanged,
    this.validator,
  });

  final int minFiles;
  final int maxFiles;
  final String hintLabel;
  final double maxSizeMB;
  final List<File>? initialFiles;

  final ValueChanged<List<File>>? onChanged;
  final String? Function(List<File>?)? validator;

  @override
  State<MultiDocumentUploadBox> createState() => _MultiDocumentUploadBoxState();
}

class _MultiDocumentUploadBoxState extends State<MultiDocumentUploadBox> {
  final List<PickedDoc> _docs = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialFiles != null && widget.initialFiles!.isNotEmpty) {
      for (final file in widget.initialFiles!) {
        _docs.add(PickedDoc(file: file, name: file.path.split('/').last));
      }
    }
  }

  int get _remaining => widget.maxFiles - _docs.length;

  Future<void> _openPickerSheet() async {
    if (_remaining <= 0) return;

    final choice = await showModalBottomSheet<_PickChoice>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Text(
                    'Add documents (up to $_remaining more)',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('Choose from Gallery'),
                    subtitle: const Text('Select multiple images at once'),
                    onTap: () => Navigator.pop(ctx, _PickChoice.gallery),
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: const Text('Take a Photo'),
                    onTap: () => Navigator.pop(ctx, _PickChoice.camera),
                  ),
                  ListTile(
                    leading: const Icon(Icons.insert_drive_file_outlined),
                    title: const Text('Choose PDF / Image Files'),
                    onTap: () => Navigator.pop(ctx, _PickChoice.filePicker),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (choice == null) return;

    final List<PickedDoc> newlyPicked = [];

    if (choice == _PickChoice.gallery) {
      final List<XFile> images = await ImagePicker().pickMultiImage(
        imageQuality: 85,
      );
      for (final x in images) {
        newlyPicked.add(PickedDoc(file: File(x.path), name: x.name));
      }
    } else if (choice == _PickChoice.camera) {
      final XFile? x = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      if (x != null)
        newlyPicked.add(PickedDoc(file: File(x.path), name: x.name));
    } else {
      final List<PlatformFile>? res = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['pdf', 'jpg', 'jpeg', 'png'],
      );
      if (res != null) {
        for (final f in res) {
          if (f.path != null)
            newlyPicked.add(PickedDoc(file: File(f.path!), name: f.name));
        }
      }
    }

    if (newlyPicked.isEmpty) return;

    final List<PickedDoc> accepted = [];
    final List<String> rejected = [];

    for (final doc in newlyPicked) {
      final sizeMB = await doc.file.length() / (1024 * 1024);
      if (sizeMB > widget.maxSizeMB) {
        rejected.add('${doc.name} (too large)');
        continue;
      }
      accepted.add(doc);
    }

    setState(() {
      for (final doc in accepted) {
        if (_docs.length >= widget.maxFiles) {
          rejected.add('${doc.name} (limit reached)');
          continue;
        }
        _docs.add(doc);
      }
    });

    widget.onChanged?.call(_docs.map((d) => d.file).toList());

    if (rejected.isNotEmpty && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Skipped: ${rejected.join(', ')}')),
      );
    }
  }

  void _removeAt(int index) {
    setState(() => _docs.removeAt(index));
    widget.onChanged?.call(_docs.map((d) => d.file).toList());
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<File>>(
      validator: widget.validator,
      initialValue: const [],
      builder: (state) {
        final files = _docs.map((d) => d.file).toList();
        if ((state.value?.length ?? 0) != files.length) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            state.didChange(files);
          });
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_docs.isNotEmpty) ...[
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(_docs.length, (i) => _buildThumb(i)),
              ),
              const SizedBox(height: 12),
            ],
            if (_remaining > 0)
              GestureDetector(
                onTap: _openPickerSheet,
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: const Radius.circular(10),
                    dashPattern: const [6, 4],
                    color: state.hasError
                        ? Colors.redAccent
                        : const Color(0xFFD1D5DB),
                    strokeWidth: 1.4,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 26,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          size: 30,
                          color: Color(0xFF9CA3AF),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Drop at least ${widget.minFiles} documents here * (max ${widget.maxFiles}) — ${widget.hintLabel}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4B5563),
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'PDF, JPG, JPEG, and PNG • maximum ${widget.maxSizeMB.toInt()} MB each • '
                          '${_docs.length}/${widget.maxFiles} uploaded (minimum ${widget.minFiles})',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF9CA3AF),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildThumb(int index) {
    final doc = _docs[index];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            color: const Color(0xFFF3F4F6),
          ),
          child: doc.isPdf
              ? const Center(
                  child: Icon(
                    Icons.picture_as_pdf,
                    color: Colors.redAccent,
                    size: 26,
                  ),
                )
              : Image.file(doc.file, fit: BoxFit.cover),
        ),
        Positioned(
          top: -6,
          right: -6,
          child: GestureDetector(
            onTap: () => _removeAt(index),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

enum _PickChoice { gallery, camera, filePicker }
