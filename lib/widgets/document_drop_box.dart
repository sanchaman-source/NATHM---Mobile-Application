import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentDropBox extends StatelessWidget {
  final String title;
  final String hint;
  final File? file;
  final String? errorText;
  final ValueChanged<File?> onFileSelected;

  const DocumentDropBox({
    super.key,
    required this.title,
    required this.hint,
    required this.file,
    required this.onFileSelected,
    this.errorText,
  });

  Future<void> _showPickerSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(ctx);
                final picked = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (picked != null) onFileSelected(File(picked.path));
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined),
              title: const Text('Choose from Files'),
              onTap: () async {
                Navigator.pop(ctx);
                final result = await FilePicker.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
                );
                if (result != null && result.isNotEmpty) {
                  onFileSelected(File(result.first.path!));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isImage =
        file != null &&
        [
          '.jpg',
          '.jpeg',
          '.png',
        ].any((ext) => file!.path.toLowerCase().endsWith(ext));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _showPickerSheet(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: errorText != null? Colors.red.shade300: Colors.grey.shade400,
              strokeWidth: 1.5,
              radius: Radius.circular(12),
              dashPattern: [6, 4],
            ),
            child: Container(
              width: double.infinity,
              padding: file == null
                  ? const EdgeInsets.all(16)
                  : EdgeInsets.zero,
              child: file == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Colors.grey.shade500,
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$hint · 0/1 uploaded',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                    height: 150,
                    child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: isImage
                                ? Image.file(file!, fit: BoxFit.cover)
                                : Container(
                                    alignment: Alignment.center,
                                    color: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.picture_as_pdf_outlined,
                                      size: 32,
                                    ),
                                  ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => onFileSelected(null),
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  Icons.close,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 6, left: 4),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red.shade400, fontSize: 11),
            ),
          ),
      ],
    );
  }
}

class DocumentDropBoxField extends FormField<File> {
  DocumentDropBoxField({
    super.key,
    required String title,
    required String hint,
    required File? initialFile,
    required ValueChanged<File?> onFileSelected,
  }) : super(
         initialValue: initialFile,
         validator: (file) =>
             file == null ? 'Please upload this document' : null,
         builder: (FormFieldState<File> state) {
           return DocumentDropBox(
             title: title,
             hint: hint,
             file: state.value,
             errorText: state.errorText,
             onFileSelected: (f) {
               state.didChange(f);
               onFileSelected(f);
             },
           );
         },
       );
}
