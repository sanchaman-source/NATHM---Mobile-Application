import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natham_college/model/application_form_model.dart';

class PersonalInfoStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  const PersonalInfoStep({
    super.key,
    required this.formKey,
    required this.data,
    required this.onFormChanged,
    this.preSelectedCourse,
    this.isCourseLocked = false,
  });

  final ValueChanged<bool> onFormChanged;
  final String? preSelectedCourse;
  final bool isCourseLocked;

  @override
  State<PersonalInfoStep> createState() => PersonalInfoStepState();
}

class PersonalInfoStepState extends State<PersonalInfoStep> {
  final _formKey = GlobalKey<FormState>();

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  bool get _isFormComplete {
    return _selectedCourse != null &&
        _firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _mobileController.text.trim().length == 10 &&
        _dobController.text.isNotEmpty &&
        _selectedGender != null &&
        _selectedCategory != null &&
        _religionController.text.trim().isNotEmpty &&
        _nationalityController.text.trim().isNotEmpty;
  }

  void _notifyFormChanged() {
    widget.onFormChanged(_isFormComplete);
  }

  late final TextEditingController _firstNameController = TextEditingController(
    text: widget.data.firstName,
  );
  late final TextEditingController _middleNameController =
      TextEditingController(text: widget.data.middleName);
  late final TextEditingController _lastNameController = TextEditingController(
    text: widget.data.lastName,
  );
  late final TextEditingController _emailController = TextEditingController(
    text: widget.data.email,
  );
  late final TextEditingController _mobileController = TextEditingController(
    text: widget.data.mobile,
  );
  late final TextEditingController _dobController = TextEditingController(
    text: widget.data.dateOfBirth,
  );
  late final TextEditingController _religionController = TextEditingController(
    text: widget.data.religion,
  );
  late final TextEditingController _nationalityController =
      TextEditingController(text: widget.data.nationality);
  late final TextEditingController _citizenshipController =
      TextEditingController(text: widget.data.citizenShip);
  late final TextEditingController _passportController = TextEditingController(
    text: widget.data.passportNumber,
  );
  late String? _selectedGender = widget.data.gender;
  late String? _selectedCategory = widget.data.categories;
  late String? _selectedCourse =
      widget.data.course ?? widget.preSelectedCourse ?? _courses.first;

  final List<String> _courses = ['Bachelor of Mountaineering Studies'];

  final List<String> _genders = ['Male', 'Female', 'Other'];

  final List<String> _categories = [
    'Open',
    'Women',
    'Aadibasi/Janajati',
    'Madhesi',
    'Dalit',
    'Backward Area',
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    _religionController.dispose();
    _nationalityController.dispose();
    _citizenshipController.dispose();
    _passportController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedCourse = widget.preSelectedCourse ?? _courses.first;
  }

  @override
  Widget build(BuildContext context) {
    final courseOptions = _courses
        .map((course) => course.trim())
        .where((course) => course.isNotEmpty)
        .toSet()
        .toList();

    final selectedCourse = courseOptions.contains(_selectedCourse?.trim())
        ? _selectedCourse!.trim()
        : null;

    return Form(
      key: widget.formKey,
      onChanged: _notifyFormChanged,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10,
            top: 10,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1. Personal Information',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              _buildLabel('COURSE', isRequired: true),
              const SizedBox(height: 6),
              widget.isCourseLocked
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedCourse ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.lock_outline,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  : DropdownButtonFormField<String>(
                      initialValue: selectedCourse,
                      decoration: _inputDecoration(),
                      items: courseOptions
                          .map(
                            (course) => DropdownMenuItem<String>(
                              value: course,
                              child: Text(
                                course,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => _selectedCourse = value);
                        _notifyFormChanged();
                      },
                      validator: (value) =>
                          value == null ? 'Please select a course' : null,
                    ),
              const SizedBox(height: 16),

              _buildLabel('FIRST NAME (EN)', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _firstNameController,
                decoration: _inputDecoration(),
                textCapitalization: TextCapitalization.words,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'This field is Required'
                    : null,
                onChanged: (v) => widget.data.firstName = v,
              ),
              const SizedBox(height: 16),

              // MIDDLE NAME
              _buildLabel('MIDDLE NAME (EN)'),
              const SizedBox(height: 6),
              TextFormField(
                controller: _middleNameController,
                decoration: _inputDecoration(),
                textCapitalization: TextCapitalization.words,
                onChanged: (v) => widget.data.middleName = v,
              ),
              const SizedBox(height: 16),

              // LAST NAME
              _buildLabel('LAST NAME (EN)', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _lastNameController,
                decoration: _inputDecoration(),
                textCapitalization: TextCapitalization.words,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'This field is Required'
                    : null,
                onChanged: (v) => widget.data.lastName = v,
              ),
              const SizedBox(height: 16),

              _buildLabel('EMAIL', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration(hint: 'example@email.com'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'This field is Required';
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(v)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
                onChanged: (v) => widget.data.email = v,
              ),
              const SizedBox(height: 16),

              _buildLabel('MOBILE', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _mobileController,
                decoration: _inputDecoration(hint: '98XXXXXXXX'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'This field is Required';
                  if (v.length != 10) return 'Enter 10 digit number';
                  return null;
                },
                onChanged: (v) => widget.data.mobile = v,
              ),
              const SizedBox(height: 16),

              _buildLabel('DATE OF BIRTH (BS)', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: _inputDecoration(
                  hint: 'नेपाली जन्म मिति छान्नुहोस्',
                  suffixIcon: const Icon(Icons.calendar_today, size: 20),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    _dobController.text =
                        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';

                    _notifyFormChanged();
                  }
                },
                validator: (v) =>
                    v == null || v.isEmpty ? 'Please select DOB' : null,

                onChanged: (v) => widget.data.dateOfBirth = v,
              ),
              const SizedBox(height: 16),

              _buildLabel('GENDER', isRequired: true),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: _selectedGender,
                decoration: _inputDecoration(hint: 'Select'),
                items: _genders
                    .map(
                      (g) => DropdownMenuItem(
                        value: g,
                        child: Text(g, style: TextStyle(fontSize: 12)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => _selectedGender = value);
                  widget.data.gender = value;
                },
                validator: (v) => v == null ? 'Please select gender' : null,
              ),
              const SizedBox(height: 16),

              _buildLabel('Category', isRequired: true),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: _inputDecoration(hint: 'Select Category'),
                items: _categories
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(c, style: TextStyle(fontSize: 12)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => _selectedCategory = value);
                  widget.data.categories = value;
                  _notifyFormChanged();
                },
                validator: (v) => v == null ? 'Please select category' : null,
              ),
              const SizedBox(height: 16),

              // RELIGION
              _buildLabel('RELIGION (EN)', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _religionController,
                decoration: _inputDecoration(),
                textCapitalization: TextCapitalization.words,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,

                onChanged: (v) => widget.data.religion = v,
              ),
              const SizedBox(height: 16),

              // NATIONALITY
              _buildLabel('NATIONALITY (EN)', isRequired: true),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nationalityController,
                decoration: _inputDecoration(hint: 'Nepali'),
                textCapitalization: TextCapitalization.words,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,

                onChanged: (v) => widget.data.nationality = v,
              ),
              const SizedBox(height: 16),

              // CITIZENSHIP NO.
              _buildLabel('CITIZENSHIP NO. (OR PASSPORT NO. — ONE REQUIRED)'),
              const SizedBox(height: 6),
              TextFormField(
                controller: _citizenshipController,
                decoration: _inputDecoration(),
                onChanged: (v) => widget.data.citizenShip = v,
              ),
              const SizedBox(height: 16),

              // PASSPORT NO.
              _buildLabel('PASSPORT NO.'),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passportController,
                decoration: _inputDecoration(),
                onChanged: (v) => widget.data.passportNumber = v,
              ),
              const SizedBox(height: 28),

              const Text(
                'Identity & Category Documents *',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Upload your passport-size photo and both sides of citizenship. Category verification is required for Aadibasi/Janajati, Madhesi and Dalit selections.',
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

              _buildUploadBox(
                title: 'Drop passport-size photo here * (JPG or PNG, max 1)',
                subtitle: 'JPG or PNG • maximum 3 MB each • 0/1 uploaded',
                icon: Icons.cloud_upload_outlined,
                onTap: () {},
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildUploadBox(
                      title: 'Drop citizenship front side here * (max 1)',
                      subtitle: 'PDF, JPG, JPEG, PNG • max 10 MB',
                      icon: Icons.cloud_upload_outlined,
                      onTap: () {},
                      isSmall: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildUploadBox(
                      title: 'Drop citizenship back side here * (max 1)',
                      subtitle: 'PDF, JPG, JPEG, PNG • max 10 MB',
                      icon: Icons.cloud_upload_outlined,
                      onTap: () {},
                      isSmall: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          color: Colors.black87,
        ),
        children: [
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 12),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      suffixIcon: suffixIcon,
    );
  }

  Widget _buildUploadBox({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool isSmall = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(10),
          dashPattern: const [6, 4],
          color: const Color(0xFFD1D5DB),
          strokeWidth: 1.4,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isSmall ? 22 : 30,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isSmall ? 28 : 34,
                color: const Color(0xFF9CA3AF),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmall ? 12.5 : 13.5,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4B5563),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
                  color: const Color(0xFF9CA3AF),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
