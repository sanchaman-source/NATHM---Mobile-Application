import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:natham_college/model/application_form_model.dart';
import 'package:natham_college/screen/study/apply/model/other_qualification.dart';
import 'package:natham_college/screen/study/apply/widget/multi_document_upload.dart';

class UploadedDoc {
  final String name;
  final String path;
  final int size;

  const UploadedDoc({
    required this.name,
    required this.path,
    required this.size,
  });

  String get extension =>
      name.contains('.') ? name.split('.').last.toLowerCase() : '';
}

class AcademicStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  final ValueChanged<bool> onFormChanges;

  const AcademicStep({
    super.key,
    required this.formKey,
    required this.data,
    required this.onFormChanges,
  });

  @override
  State<AcademicStep> createState() => _AcademicStepState();
}

class _AcademicStepState extends State<AcademicStep> {
  static const int _maxDocs = 5;
  static const int _minDocs = 3;
  static const int _maxSizeBytes = 10 * 1024 * 1024;
  static const List<String> _allowedExt = ['pdf', 'jpg', 'jpeg', 'png'];

  late final TextEditingController _school = TextEditingController(
    text: widget.data.seeSchool,
  );
  late final TextEditingController _board = TextEditingController(
    text: widget.data.seeBoard,
  );
  late final TextEditingController _yearBS = TextEditingController(
    text: widget.data.seeYearBS,
  );
  late final TextEditingController _gpa = TextEditingController(
    text: widget.data.seeGpa?.toString() ?? '',
  );
  late final TextEditingController _percentage = TextEditingController(
    text: widget.data.seePercentage?.toString() ?? '',
  );

  final _documentsFieldKey = GlobalKey<FormFieldState<List<UploadedDoc>>>();
  late List<UploadedDoc> _documents = List.of(widget.data.seeDocuments);

  bool get _isFormCompleted {
    final hasGpaOrPercentage =
        _gpa.text.trim().isNotEmpty || _percentage.text.trim().isNotEmpty;

    return _school.text.trim().isNotEmpty &&
        _board.text.trim().isNotEmpty &&
        _yearBS.text.trim().isNotEmpty &&
        hasGpaOrPercentage &&
        _documents.length >= _minDocs;
  }

  bool get _class12FormCompleted {
    final hasGpaOrPercentage =
        _gpa.text.trim().isNotEmpty || _percentage.text.trim().isNotEmpty;

    final class12Ok =
        (widget.data.class12College?.trim().isNotEmpty ?? false) &&
        (widget.data.class12BoardUniversity?.trim().isNotEmpty ?? false) &&
        (widget.data.class12YearCompletionBS?.trim().isNotEmpty ?? false) &&
        ((widget.data.class12Gpa != null) ||
            (widget.data.class12Percentage != null)) &&
        (widget.data.class12Documents?.length ?? 0) >= 4;

    return _school.text.trim().isNotEmpty &&
        _board.text.trim().isNotEmpty &&
        _yearBS.text.trim().isNotEmpty &&
        hasGpaOrPercentage &&
        _documents.length >= _minDocs &&
        class12Ok;
  }

  void _notifyFormChanges() {
    widget.onFormChanges(_isFormCompleted);
  }

  String? _requiredValidator(String? v) {
    return v == null || v.trim().isEmpty ? 'This field is Required' : null;
  }

  String? _gpaValidator(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      if (_percentage.text.trim().isEmpty) {
        return 'This field is required';
      }
      return null;
    }

    final gpa = double.tryParse(text);
    if (gpa == null) {
      return 'GPA must be a valid number';
    }
    if (gpa < 0 || gpa > 4) {
      return 'GPA must be between 0 and 4';
    }

    return null;
  }

  String? _percentageValidator(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      if (_gpa.text.trim().isEmpty) {
        return 'This field is required';
      }
      return null;
    }

    final percentage = double.tryParse(text);
    if (percentage == null) {
      return 'Percentage must be a valid number';
    }
    if (percentage < 0 || percentage > 100) {
      return 'Percentage must be between 0 and 100';
    }

    return null;
  }

  @override
  void dispose() {
    _school.dispose();
    _board.dispose();
    _yearBS.dispose();
    _gpa.dispose();
    _percentage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '4. Academic Details, Documents & CMAT',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),

          _buildSectionCard(
            title: 'Class 10 (SEE)',
            isRequired: true,
            children: [
              _buildLabel('SCHOOL/COLLEGE (EN)', isRequired: true),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _school,
                validator: _requiredValidator,
                onChanged: (v) {
                  widget.data.seeSchool = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
              _buildLabel('BOARD', isRequired: true),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _board,
                validator: _requiredValidator,
                onChanged: (v) {
                  widget.data.seeBoard = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 16),

              const Text(
                'GPA or Percentage — one is required *',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE53935),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          'YEAR OF COMPLETION (BS)',
                          isRequired: true,
                        ),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _yearBS,
                          hint: 'B.S. year',
                          keyboardType: TextInputType.number,
                          validator: _requiredValidator,
                          onChanged: (v) {
                            widget.data.seeYearBS = v;
                            _notifyFormChanges();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('GPA ONLY'),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _gpa,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: _gpaValidator,
                          onChanged: (v) {
                            widget.data.seeGpa = double.tryParse(v);
                            setState(() {}); // re-check the paired validator
                            _notifyFormChanges();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              _buildLabel('PERCENTAGE ONLY'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _percentage,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: _percentageValidator,
                onChanged: (v) {
                  widget.data.seePercentage = double.tryParse(v);
                  setState(() {}); // re-check the paired validator
                  _notifyFormChanges();
                },
              ),

              const SizedBox(height: 20),

              _buildDocumentDropzone(),

              SizedBox(height: 20),

              Class12AcademicForm(
                data: widget.data,
                onChanged: () {
                  setState(() {});
                  _notifyFormChanges();
                },
              ),

              SizedBox(height: 20),

              OtherQualificationsSection(
                data: widget.data,
                onChanged: () {
                  setState(() {});
                  _notifyFormChanges();
                },
              ),

              const SizedBox(height: 20),

              CmatSection(
                data: widget.data,
                onChanged: () {
                  setState(() {});
                  _notifyFormChanges();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentDropzone() {
    return FormField<List<UploadedDoc>>(
      key: _documentsFieldKey,
      initialValue: _documents,
      validator: (value) {
        if ((value ?? []).length < _minDocs) {
          return 'Please upload at least $_minDocs documents';
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _openUploadSheet(field),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: field.hasError
                        ? const Color(0xFFE53935)
                        : const Color(0xFFCBD5E1),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.cloud_upload_outlined,
                      size: 32,
                      color: Color(0xFF94A3B8),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Drop at least $_minDocs documents here ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF1976D2),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(
                            text: '*',
                            style: TextStyle(color: Color(0xFFE53935)),
                          ),
                          TextSpan(
                            text:
                                ' (max $_maxDocs) — marksheet, certificate, etc.',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF1976D2),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'PDF, JPG, JPEG, and PNG · maximum 10 MB each · '
                      '${_documents.length}/$_maxDocs uploaded (minimum $_minDocs)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_documents.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _documents
                    .map(
                      (f) => Chip(
                        label: Text(
                          f.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),
                        onDeleted: () {
                          setState(() => _documents.remove(f));
                          widget.data.seeDocuments = _documents;
                          field.didChange(_documents);
                          _notifyFormChanges();
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
            if (field.hasError) ...[
              const SizedBox(height: 6),
              Text(
                field.errorText!,
                style: const TextStyle(fontSize: 11, color: Color(0xFFE53935)),
              ),
            ],
          ],
        );
      },
    );
  }

  void _openUploadSheet(FormFieldState<List<UploadedDoc>> field) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Upload document',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('Choose from Gallery'),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _pickFromGallery(field);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.insert_drive_file_outlined),
                    title: const Text('Choose File (PDF, images)'),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _pickFiles(field);
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _pickFromGallery(FormFieldState<List<UploadedDoc>> field) async {
    final remaining = _maxDocs - _documents.length;
    if (remaining <= 0) return;
    final picked = await ImagePicker().pickMultiImage();
    for (final p in picked.take(remaining)) {
      final size = await File(p.path).length();
      _addFile(UploadedDoc(name: p.name, path: p.path, size: size), field);
    }
  }

  Future<void> _pickFiles(FormFieldState<List<UploadedDoc>> field) async {
    final remaining = _maxDocs - _documents.length;
    if (remaining <= 0) return;
    final List<PlatformFile> result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: _allowedExt,
    );
    for (final f in result.take(remaining)) {
      if (f.path == null) continue;
      final size = f.lengthSync() ?? await f.length();
      _addFile(UploadedDoc(name: f.name, path: f.path!, size: size), field);
    }
  }

  void _addFile(UploadedDoc file, FormFieldState<List<UploadedDoc>> field) {
    if (!_allowedExt.contains(file.extension)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Only PDF, JPG, JPEG, PNG allowed')),
      );
      return;
    }
    if (file.size > _maxSizeBytes) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${file.name} exceeds 10 MB')));
      return;
    }
    if (_documents.length >= _maxDocs) return;

    setState(() => _documents.add(file));
    widget.data.seeDocuments = _documents;
    field.didChange(_documents);
    _notifyFormChanges();
  }

  Widget _buildSectionCard({
    required String title,
    bool isRequired = false,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
              children: [
                if (isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Color(0xFFE53935)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4A4A4A),
        ),
        children: [
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFB0B7C0)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 11),
      ),
    );
  }
}

class Class12AcademicForm extends StatefulWidget {
  const Class12AcademicForm({
    super.key,
    required this.data,
    required this.onChanged,
  });

  final ApplicationFormData data;
  final VoidCallback onChanged;

  @override
  State<Class12AcademicForm> createState() => _Class12AcademicFormState();
}

class _Class12AcademicFormState extends State<Class12AcademicForm> {
  late final TextEditingController _collegeController;
  late final TextEditingController _boardController;
  late final TextEditingController _yearController;
  late final TextEditingController _gpaController;
  late final TextEditingController _percentageController;

  @override
  void initState() {
    super.initState();
    _collegeController = TextEditingController(
      text: widget.data.class12College ?? '',
    );
    _boardController = TextEditingController(
      text: widget.data.class12BoardUniversity ?? '',
    );
    _yearController = TextEditingController(
      text: widget.data.class12YearCompletionBS ?? '',
    );
    _gpaController = TextEditingController(
      text: widget.data.class12Gpa?.toString() ?? '',
    );
    _percentageController = TextEditingController(
      text: widget.data.class12Percentage?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _collegeController.dispose();
    _boardController.dispose();
    _yearController.dispose();
    _gpaController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  void _revalidateGpaPercentage() => widget.onChanged();

  InputDecoration _inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
    );
  }

  Widget _label(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
          letterSpacing: 0.3,
        ),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ]
            : [],
      ),
    );
  }

  String? _gpaValidator(String? value) {
    final gpaEmpty = value == null || value.trim().isEmpty;
    final percentEmpty = _percentageController.text.trim().isEmpty;

    if (gpaEmpty && percentEmpty) {
      return 'GPA or Percentage required';
    }

    if (!gpaEmpty) {
      final gpa = double.tryParse(value!.trim());
      if (gpa == null) {
        return 'GPA must be a valid number';
      }
      if (gpa < 0 || gpa > 4) {
        return 'GPA must be between 0 and 4';
      }
    }

    return null;
  }

  String? _percentageValidator(String? value) {
    final percentEmpty = value == null || value.trim().isEmpty;
    final gpaEmpty = _gpaController.text.trim().isEmpty;

    if (percentEmpty && gpaEmpty) {
      return 'GPA or Percentage required';
    }

    if (!percentEmpty) {
      final percentage = double.tryParse(value!.trim());
      if (percentage == null) {
        return 'Percentage must be a valid number';
      }
      if (percentage < 0 || percentage > 100) {
        return 'Percentage must be between 0 and 100';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Class 12 (+2 / Proficiency Certificate)',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),

          _label('COLLEGE (EN)', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _collegeController,
            decoration: _inputDecoration(),
            textCapitalization: TextCapitalization.words,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'This field is Required' : null,
            onChanged: (v) {
              widget.data.class12College = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 10),

          _label('BOARD/UNIVERSITY', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _boardController,
            decoration: _inputDecoration(),
            textCapitalization: TextCapitalization.words,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'This field is Required' : null,
            onChanged: (v) {
              widget.data.class12BoardUniversity = v;
              widget.onChanged();
            },
          ),

          const SizedBox(height: 18),

          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: 'GPA or Percentage ',
                  style: TextStyle(color: Color(0xFF374151)),
                ),
                TextSpan(
                  text: '— one is required ',
                  style: TextStyle(color: Colors.redAccent),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          _label('YEAR OF COMPLETION (BS)', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _yearController,
            decoration: _inputDecoration(hintText: 'B.S. year'),
            keyboardType: TextInputType.number,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'This field is Required' : null,
            onChanged: (v) {
              widget.data.class12YearCompletionBS = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 10),
          _label('GPA ONLY'),
          const SizedBox(height: 6),
          TextFormField(
            controller: _gpaController,
            decoration: _inputDecoration(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _gpaValidator, // Use separate validator
            onChanged: (v) {
              widget.data.class12Gpa = v;
              _revalidateGpaPercentage();
            },
          ),
          const SizedBox(height: 10),

          _label('PERCENTAGE ONLY'),
          const SizedBox(height: 6),
          TextFormField(
            controller: _percentageController,
            decoration: _inputDecoration(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _percentageValidator, // Use separate validator
            onChanged: (v) {
              widget.data.class12Percentage = v;
              _revalidateGpaPercentage();
            },
          ),

          const SizedBox(height: 18),
          MultiDocumentUploadBox(
            minFiles: 4,
            maxFiles: 5,
            hintLabel: 'transcript, certificate, etc.',
            maxSizeMB: 10,
            initialFiles: widget.data.class12Documents
                .map((doc) => File(doc.path))
                .toList(), // ← NEW
            onChanged: (files) {
              widget.data.class12Documents = files.map((file) {
                return UploadedDoc(
                  name: file.path.split('/').last,
                  path: file.path,
                  size: file.lengthSync(),
                );
              }).toList();
              widget.onChanged();
            },
            validator: (files) => (files == null || files.length < 4)
                ? 'Please upload at least 4 documents'
                : null,
          ),
        ],
      ),
    );
  }
}

class OtherQualificationsSection extends StatefulWidget {
  final ApplicationFormData data;
  final VoidCallback onChanged;

  const OtherQualificationsSection({
    super.key,
    required this.data,
    required this.onChanged,
  });

  @override
  State<OtherQualificationsSection> createState() =>
      _OtherQualificationsSectionState();
}

class _OtherQualificationsSectionState
    extends State<OtherQualificationsSection> {
  void _addQualification() {
    setState(() {
      widget.data.otherQualifications.add(OtherQualification());
    });
    widget.onChanged();
  }

  void _removeQualification(int index) {
    setState(() {
      widget.data.otherQualifications.removeAt(index);
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.data.otherQualifications;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header + Add button
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Other Qualifications (Bachelor / Master / Diploma)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              TextButton(
                onPressed: _addQualification,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFE8F0FE),
                  foregroundColor: const Color(0xFF1A73E8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Add'),
              ),
            ],
          ),

          if (list.isEmpty) ...[
            const SizedBox(height: 8),
            const Text(
              'Click "Add" to include additional qualifications.',
              style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
            ),
          ],

          ...List.generate(list.length, (index) {
            return _QualificationCard(
              key: ValueKey(index),
              qualification: list[index],
              onRemove: () => _removeQualification(index),
              onChanged: widget.onChanged,
            );
          }),

          const SizedBox(height: 16),

          MultiDocumentUploadBox(
            minFiles: list.isEmpty ? 0 : 1,
            maxFiles: 5,
            hintLabel: 'other qualifications',
            maxSizeMB: 10,
            initialFiles: widget.data.otherQualificationDocuments
                .map((doc) => File(doc.path))
                .toList(), // ← NEW
            onChanged: (files) {
              widget.data.otherQualificationDocuments = files.map((file) {
                return UploadedDoc(
                  name: file.path.split('/').last,
                  path: file.path,
                  size: file.lengthSync(),
                );
              }).toList();
              widget.onChanged();
            },
            validator: (files) {
              if (list.isNotEmpty && (files == null || files.isEmpty)) {
                return 'Please upload at least 1 document when qualifications are added';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class _QualificationCard extends StatefulWidget {
  final OtherQualification qualification;
  final VoidCallback onRemove;
  final VoidCallback onChanged;

  const _QualificationCard({
    super.key,
    required this.qualification,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  State<_QualificationCard> createState() => _QualificationCardState();
}

class _QualificationCardState extends State<_QualificationCard> {
  late final TextEditingController _collegeCtrl;
  late final TextEditingController _boardCtrl;
  late final TextEditingController _qualificationCtrl;
  late final TextEditingController _facultyCtrl;
  late final TextEditingController _yearCtrl;
  late final TextEditingController _gpaCtrl;
  late final TextEditingController _percentageCtrl;

  @override
  void initState() {
    super.initState();
    final q = widget.qualification;
    _collegeCtrl = TextEditingController(text: q.college);
    _boardCtrl = TextEditingController(text: q.boardUniversity);
    _qualificationCtrl = TextEditingController(text: q.qualification);
    _facultyCtrl = TextEditingController(text: q.faculty);
    _yearCtrl = TextEditingController(text: q.completionYearBS);
    _gpaCtrl = TextEditingController(text: q.gpa?.toString() ?? '');
    _percentageCtrl = TextEditingController(
      text: q.percentage?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _collegeCtrl.dispose();
    _boardCtrl.dispose();
    _qualificationCtrl.dispose();
    _facultyCtrl.dispose();
    _yearCtrl.dispose();
    _gpaCtrl.dispose();
    _percentageCtrl.dispose();
    super.dispose();
  }

  InputDecoration _decoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      isDense: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
      ),
    );
  }

  Widget _label(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ]
            : [],
      ),
    );
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'This field is Required' : null;

  String? _gpaOrPercentageValidator(String? _) {
    if (_gpaCtrl.text.trim().isEmpty && _percentageCtrl.text.trim().isEmpty) {
      return 'GPA or Percentage required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Remove button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.onRemove,
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('× Remove'),
            ),
          ),
          const SizedBox(height: 8),

          // COLLEGE
          _label('COLLEGE (EN)', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _collegeCtrl,
            decoration: _decoration(),
            textCapitalization: TextCapitalization.words,
            validator: _required,
            onChanged: (v) {
              widget.qualification.college = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 14),

          _label('BOARD/UNIVERSITY', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _boardCtrl,
            decoration: _decoration(),
            textCapitalization: TextCapitalization.words,
            validator: _required,
            onChanged: (v) {
              widget.qualification.boardUniversity = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 10),

          _label('QUALIFICATION', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _qualificationCtrl,
            decoration: _decoration(),
            textCapitalization: TextCapitalization.words,
            validator: _required,
            onChanged: (v) {
              widget.qualification.qualification = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 14),

          _label('FACULTY'), // optional
          const SizedBox(height: 6),
          TextFormField(
            controller: _facultyCtrl,
            decoration: _decoration(),
            textCapitalization: TextCapitalization.words,
            onChanged: (v) {
              widget.qualification.faculty = v;
              widget.onChanged();
            },
          ),
          const SizedBox(height: 10),
          _label('COMPLETION YEAR (BS)', required: true),
          const SizedBox(height: 6),
          TextFormField(
            controller: _yearCtrl,
            decoration: _decoration(hint: 'B.S. year'),
            keyboardType: TextInputType.number,
            validator: _required,
            onChanged: (v) {
              widget.qualification.completionYearBS = v;
              widget.onChanged();
            },
          ),

          const SizedBox(height: 12),
          _label('GPA ONLY (ONE RESULT REQUIRED)'),
          const SizedBox(height: 6),
          TextFormField(
            controller: _gpaCtrl,
            decoration: _decoration(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _gpaOrPercentageValidator,
            onChanged: (v) {
              widget.qualification.gpa = v.isEmpty ? null : v;
              setState(() {}); // revalidate the pair
              widget.onChanged();
            },
          ),
          const SizedBox(height: 10),
          _label('PERCENTAGE ONLY (ONE RESULT REQUIRED)'),
          const SizedBox(height: 6),
          TextFormField(
            controller: _percentageCtrl,
            decoration: _decoration(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _gpaOrPercentageValidator,
            onChanged: (v) {
              widget.qualification.percentage = v.isEmpty ? null : v;
              setState(() {}); // revalidate the pair
              widget.onChanged();
            },
          ),
        ],
      ),
    );
  }
}

class CmatSection extends StatefulWidget {
  final ApplicationFormData data;
  final VoidCallback onChanged;

  const CmatSection({super.key, required this.data, required this.onChanged});

  @override
  State<CmatSection> createState() => _CmatSectionState();
}

class _CmatSectionState extends State<CmatSection> {
  late final TextEditingController _rollNoCtrl;
  late final TextEditingController _scoreCtrl;

  @override
  void initState() {
    super.initState();
    _rollNoCtrl = TextEditingController(text: widget.data.cmatRollNo ?? '');
    _scoreCtrl = TextEditingController(text: widget.data.cmatScore ?? '');
  }

  @override
  void dispose() {
    _rollNoCtrl.dispose();
    _scoreCtrl.dispose();
    super.dispose();
  }

  InputDecoration _decoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
      ),
    );
  }

  Widget _label(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ]
            : [],
      ),
    );
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'This field is Required' : null;

  String? _cmatScoreValidator(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      if (_scoreCtrl.text.trim().isEmpty) {
        return 'This field is Required';
      }
      return null;
    }

    final cmatScore = double.tryParse(text);
    if (cmatScore == null) {
      return 'CMAT score must be a valid number';
    }
    if (cmatScore < 0 || cmatScore > 100) {
      return 'Enter a CMAT score between 0 and 100';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CMAT (Central Management Admission Test)',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),

          // Roll No + Score
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('CMAT ROLL NO.', required: true),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _rollNoCtrl,
                      decoration: _decoration(),
                      validator: _required,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (v) {
                        widget.data.cmatRollNo = v;
                        widget.onChanged();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('CMAT SCORE', required: true),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _scoreCtrl,
                      decoration: _decoration(),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: _cmatScoreValidator,
                      onChanged: (v) {
                        widget.data.cmatScore = v;
                        widget.onChanged();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          MultiDocumentUploadBox(
            minFiles: 1,
            maxFiles: 1,
            hintLabel: 'CMAT scorecard image',
            maxSizeMB: 10,
            initialFiles: widget.data.cmatDocuments
                .map((doc) => File(doc.path))
                .toList(), // ← NEW
            onChanged: (files) {
              widget.data.cmatDocuments = files.map((file) {
                return UploadedDoc(
                  name: file.path.split('/').last,
                  path: file.path,
                  size: file.lengthSync(),
                );
              }).toList();
              widget.onChanged();
            },
            validator: (files) {
              if (files == null || files.isEmpty) {
                return 'Please upload CMAT scorecard (minimum 1)';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
