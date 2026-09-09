import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natham_college/model/application_form_model.dart';

class GuardianStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  final ValueChanged<bool> onFormChanges;

  const GuardianStep({
    super.key,
    required this.formKey,
    required this.data,
    required this.onFormChanges,
  });

  @override
  State<GuardianStep> createState() => _GuardianStepState();
}

class _GuardianStepState extends State<GuardianStep> {
  //FATHER
  late final TextEditingController _fatherName = TextEditingController(
    text: widget.data.fatherName,
  );
  late final TextEditingController _fatherOccupation = TextEditingController(
    text: widget.data.fatherOccupation,
  );
  late final TextEditingController _fatherMobile = TextEditingController(
    text: widget.data.fatherMobile?.toString() ?? '',
  );
  late final TextEditingController _fatherEmail = TextEditingController(
    text: widget.data.fatherEmail,
  );

  //MOTHER//
  late final TextEditingController _motherName = TextEditingController(
    text: widget.data.motherName,
  );
  late final TextEditingController _motherOccupation = TextEditingController(
    text: widget.data.motherOccupation,
  );
  late final TextEditingController _motherMobile = TextEditingController(
    text: widget.data.motherMobile?.toString() ?? '',
  );
  late final TextEditingController _motherEmail = TextEditingController(
    text: widget.data.motherEmail,
  );

  // Guardian (if different)
  late final TextEditingController _guardianName = TextEditingController(
    text: widget.data.guardianName,
  );
  late final TextEditingController _guardianRelation = TextEditingController(
    text: widget.data.guardianRelation,
  );
  late final TextEditingController _guardianOccupation = TextEditingController(
    text: widget.data.guardianOccupation,
  );
  late final TextEditingController _guardianPhone = TextEditingController(
    text: widget.data.guardianPhone?.toString() ?? '',
  );
  late final TextEditingController _guardianEmail = TextEditingController(
    text: widget.data.guardianEmail,
  );
  late final TextEditingController _guardianAddress = TextEditingController(
    text: widget.data.guardianAddress,
  );

  bool get _isFormCompleted {
    return _motherName.text.trim().isNotEmpty;
  }

  void _notifyFormChanges() {
    widget.onFormChanges(_isFormCompleted);
  }

  String? _requiredValidator(String? v) {
    return v == null || v.trim().isEmpty ? 'This field is Required' : null;
  }

  @override
  void dispose() {
    _fatherName.dispose();
    _fatherOccupation.dispose();
    _fatherMobile.dispose();
    _fatherEmail.dispose();
    _motherName.dispose();
    _motherOccupation.dispose();
    _motherMobile.dispose();
    _motherEmail.dispose();

    _guardianName.dispose();
    _guardianRelation.dispose();
    _guardianOccupation.dispose();
    _guardianPhone.dispose();
    _guardianEmail.dispose();
    _guardianAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(
            title: 'Father',
            children: [
              _buildLabel('NAME (EN)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _fatherName,
                validator: _requiredValidator,
                onChanged: (v) {
                  widget.data.fatherName = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('OCCUPATION'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _fatherOccupation,
                onChanged: (v) {
                  widget.data.fatherOccupation = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('MOBILE'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _fatherMobile,
                keyboardType: TextInputType.phone,
                validator: _requiredValidator,
                onChanged: (v) {
                  widget.data.fatherMobile = int.tryParse(v);
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('EMAIL'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _fatherEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) {
                  widget.data.fatherEmail = v;
                  _notifyFormChanges();
                },
              ),
            ],
          ),
      
      
          _buildSectionCard(
            title: 'Mother',
            children: [
              _buildLabel('NAME (EN)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _motherName,
                onChanged: (v) {
                  widget.data.motherName = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('OCCUPATION'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _motherOccupation,
                onChanged: (v) {
                  widget.data.motherOccupation = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('MOBILE'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _motherMobile,
                keyboardType: TextInputType.phone,
                onChanged: (v) {
                  widget.data.motherMobile = int.tryParse(v);
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('EMAIL'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _motherEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) {
                  widget.data.motherEmail = v;
                  _notifyFormChanges();
                },
              ),
            ],
          ),
      
          _buildSectionCard(
            title: 'Guardian (if different)',
            children: [
              _buildLabel('NAME (EN)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianName,
                onChanged: (v) {
                  widget.data.guardianName = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('RELATION'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianRelation,
                onChanged: (v) {
                  widget.data.guardianRelation = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('OCCUPATION'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianOccupation,
                onChanged: (v) {
                  widget.data.guardianOccupation = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('PHONE'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianPhone,
                keyboardType: TextInputType.phone,
                onChanged: (v) {
                  widget.data.guardianPhone = int.tryParse(v);
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('EMAIL'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) {
                  widget.data.guardianEmail = v;
                  _notifyFormChanges();
                },
              ),
              const SizedBox(height: 10),
      
              _buildLabel('ADDRESS (EN)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _guardianAddress,
                onChanged: (v) {
                  widget.data.guardianAddress = v;
                  _notifyFormChanges();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
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
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4A4A4A),
          letterSpacing: 0.3,
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
