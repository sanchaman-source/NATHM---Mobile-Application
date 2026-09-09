import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natham_college/model/application_form_model.dart';
import 'package:natham_college/screen/study/apply/widget/document_upload_box.dart';
import 'package:natham_college/widgets/document_drop_box.dart';

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
  late final List<CategoryDocConfig> _categoryDocs = [
    CategoryDocConfig(
      category: 'Aadibasi/Janajati',
      title: 'Tap to Upload Aadibasi/Janajati document',
      hint: 'PDF, JPG, JPEG, and PNG · upto 10 MB',
      getFile: () => widget.data.aadibasiJanajatiDoc,
      setFile: (f) => setState(() => widget.data.aadibasiJanajatiDoc = f),
    ),
    CategoryDocConfig(
      category: 'Madhesi',
      title: 'Tap to Upload Madhesi Document',
      hint: 'PDF, JPG, JPEG, and PNG · upto 10 MB',
      getFile: () => widget.data.madhesiDoc,
      setFile: (f) => setState(() => widget.data.madhesiDoc = f),
    ),
    CategoryDocConfig(
      category: 'Dalit',
      title: 'Tap to Upload Dalit Document',
      hint: 'PDF, JPG, JPEG, and PNG · upto 10 MB',
      getFile: () => widget.data.dalitDoc,
      setFile: (f) => setState(() => widget.data.dalitDoc = f),
    ),
  ];

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

  final List<String> _courses = [
    'Bachelor of Mountaineering Studies',
    'Bachelor of Travel and Tourism Management',
    'Bachelor of Hotel Management',
    'Master of Hospitality Management',
    'Master of Adventure Tourism Studies',
  ];

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
                      initialValue: _selectedCourse,
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
                        widget.data.course = value;
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

              _buildLabel('MIDDLE NAME (EN)'),
              const SizedBox(height: 6),
              TextFormField(
                controller: _middleNameController,
                decoration: _inputDecoration(),
                textCapitalization: TextCapitalization.words,
                onChanged: (v) => widget.data.middleName = v,
              ),
              const SizedBox(height: 16),

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
                  hint: 'Select your birth date.',
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
                    final formatted =
                        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                    setState(() {
                      _dobController.text = formatted;
                    });
                    widget.data.dateOfBirth = formatted;

                    _notifyFormChanged();
                  }
                },
                validator: (v) =>
                    v == null || v.isEmpty ? 'Please select DOB' : null,
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

              _buildLabel('CITIZENSHIP NO. (OR PASSPORT NO. — ONE REQUIRED)'),
              const SizedBox(height: 6),
              TextFormField(
                controller: _citizenshipController,
                decoration: _inputDecoration(),
                onChanged: (v) => widget.data.citizenShip = v,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

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

              DocumentUploadBox(
                title: 'Tap to add passport-size photo',
                subtitle: 'JPG or PNG • upto 3 MB each',
                icon: Icons.cloud_upload_outlined,
                maxSizeMB: 3,
                initialFile: widget.data.passportPhoto,
                onChanged: (file) => widget.data.passportPhoto = file,
                validator: (file) =>
                    file == null ? 'Passport photo is required' : null,
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: DocumentUploadBox(
                      title: 'Tap to upload citizenship (front) *',
                      subtitle: 'JPG, PNG · up to 10 MB',
                      icon: Icons.cloud_upload_outlined,
                      isSmall: true,
                      allowPdf: true,
                      initialFile: widget.data.citizenshipFront,
                      onChanged: (file) => widget.data.citizenshipFront = file,
                      validator: (file) => file == null ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DocumentUploadBox(
                      title: 'Tap to upload citizenship (back) *',
                      subtitle: 'JPG, PNG · up to 10 MB',
                      icon: Icons.cloud_upload_outlined,
                      isSmall: true,
                      allowPdf: true,
                      initialFile: widget.data.citizenshipBack,
                      onChanged: (file) => widget.data.citizenshipBack = file,
                      validator: (file) => file == null ? 'Required' : null,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Builder(
                builder: (context) {
                  final matched = _categoryDocs
                      .where((c) => c.category == _selectedCategory)
                      .toList();
                  if (matched.isEmpty) return const SizedBox.shrink();

                  return Column(
                    children: matched
                        .map(
                          (config) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: DocumentDropBoxField(
                              key: ValueKey(config.category),
                              title: config.title,
                              hint: config.hint,
                              initialFile: config.getFile(),
                              onFileSelected: config.setFile,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),

              SizedBox(height: 10),
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
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
}
