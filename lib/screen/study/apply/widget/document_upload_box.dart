import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class DocumentUploadBox extends StatefulWidget {
  const DocumentUploadBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isSmall = false,
    this.allowPdf = false,
    this.maxSizeMB = 10,
    this.onChanged,
    this.validator,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSmall;

 
  final bool allowPdf;
  final double maxSizeMB;
  final ValueChanged<File?>? onChanged; 
  final String? Function(File?)? validator;

  @override
  State<DocumentUploadBox> createState() => _DocumentUploadBoxState();
}

class _DocumentUploadBoxState extends State<DocumentUploadBox> {
  File? _pickedFile;
  String? _fileName;

  Future<void> _openPickerSheet() async {
    final result = await showModalBottomSheet<_PickChoice>(
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
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                    'Upload ${widget.title.replaceAll('Drop ', '').replaceAll(' here *', '')}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('Choose from Gallery'),
                    onTap: () => Navigator.pop(ctx, _PickChoice.gallery),
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: const Text('Take a Photo'),
                    onTap: () => Navigator.pop(ctx, _PickChoice.camera),
                  ),
                  if (widget.allowPdf)
                    ListTile(
                      leading: const Icon(Icons.insert_drive_file_outlined),
                      title: const Text('Choose PDF File'),
                      onTap: () => Navigator.pop(ctx, _PickChoice.pdf),
                    ),
                ],
              ),
            );
          },
        );
      },
    );

    if (result == null) return;

    File? file;
    String? name;

    if (result == _PickChoice.gallery || result == _PickChoice.camera) {
      final XFile? xfile = await ImagePicker().pickImage(
        source: result == _PickChoice.gallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 85,
      );
      if (xfile == null) return;
      file = File(xfile.path);
      name = xfile.name;
    } else {
      final res = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['pdf', 'jpg', 'jpeg', 'png'],
      );
      if (res == null || res.single.path == null) return;
      file = File(res.single.path!);
      name = res.single.name;
    }

    final sizeInMB = await file.length() / (1024 * 1024);
    if (sizeInMB > widget.maxSizeMB) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File must be under ${widget.maxSizeMB.toInt()} MB')),
        );
      }
      return;
    }

    setState(() {
      _pickedFile = file;
      _fileName = name;
    });
    widget.onChanged?.call(file);
  }

  void _removeFile() {
    setState(() {
      _pickedFile = null;
      _fileName = null;
    });
    widget.onChanged?.call(null);
  }

  bool get _isPdf => _fileName?.toLowerCase().endsWith('.pdf') ?? false;

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      validator: widget.validator,
      builder: (state) {
        if (state.value != _pickedFile) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            state.didChange(_pickedFile);
          });
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  height: widget.isSmall ? 130 : 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _pickedFile == null
                      ? _buildEmptyState()
                      : _buildPreview(),
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

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.isSmall ? 14 : 20,
        horizontal: 12,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: widget.isSmall ? 26 : 34,
              color: const Color(0xFF9CA3AF),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.isSmall ? 14 : 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF4B5563),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isPdf
            ? Container(
                color: const Color(0xFFF3F4F6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.picture_as_pdf, size: 34, color: Colors.redAccent),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        _fileName ?? 'document.pdf',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF4B5563)),
                      ),
                    ),
                  ],
                ),
              )
            : Image.file(_pickedFile!, fit: BoxFit.cover),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: _removeFile,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

enum _PickChoice { gallery, camera, pdf }