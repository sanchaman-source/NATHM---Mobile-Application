import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CareerFormPage extends StatefulWidget {
  const CareerFormPage({super.key});

  @override
  State<CareerFormPage> createState() => _CareerFormPageState();
}

class _CareerFormPageState extends State<CareerFormPage> {
  final personalInfoKey = GlobalKey<FormState>();
  final positionDetailsKey = GlobalKey<FormState>();
  final skillsKey = GlobalKey<FormState>();
  final documentsKey = GlobalKey<FormState>();
  final coverLetterKey = GlobalKey<FormState>();

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleReset() {
    personalInfoKey.currentState?.reset();
    positionDetailsKey.currentState?.reset();
    skillsKey.currentState?.reset();
    documentsKey.currentState?.reset();
    coverLetterKey.currentState?.reset();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form has been reset'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleSubmit() {
    final isPersonalValid = personalInfoKey.currentState?.validate() ?? false;
    final isPositionValid =
        positionDetailsKey.currentState?.validate() ?? false;
    final isSkillsValid = skillsKey.currentState?.validate() ?? false;
    final isDocumentsValid = documentsKey.currentState?.validate() ?? false;
    final isCoverLetterValid = coverLetterKey.currentState?.validate() ?? false;

    if (isPersonalValid &&
        isPositionValid &&
        isSkillsValid &&
        isDocumentsValid &&
        isCoverLetterValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill all required fields',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),

        title: Text(
          'Job Application',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                SizedBox(height: 10),

                JobApplicationBanner(),

                SizedBox(height: 10),

                PersonalInformationForm(formKey: personalInfoKey),

                SizedBox(height: 10),

                PositionDetailsForm(formKey: positionDetailsKey),

                SizedBox(height: 10),

                SkillsQualificationsForm(formKey: skillsKey),

                SizedBox(height: 10),

                DocumentsForm(),

                SizedBox(height: 10),

                CoverLetterForm(),

                SizedBox(height: 20),

                ApplicationBottomButtons(
                  onCancel: _handleCancel,
                  onReset: _handleReset,
                  onSubmit: _handleSubmit,
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobApplicationBanner extends StatelessWidget {
  const JobApplicationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFC8102E), Color(0xFF8B0000)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOIN NATHM',
            style: TextStyle(
              color: Colors.amber[600],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),

          const Text(
            'Job Application',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            'Complete the form below and our recruitment team will review your application.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInformationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PersonalInformationForm({super.key, required this.formKey});

  @override
  State<PersonalInformationForm> createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: 1 Personal Information
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC8102E),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildLabel('First Name *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: firstNameController,
              decoration: _inputDecoration(hint: 'Enter first name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Last Name *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: lastNameController,
              decoration: _inputDecoration(hint: 'Enter last name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Last name is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Email Address *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration(hint: 'Enter email address'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Phone Number *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration(hint: 'Enter phone number'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Phone number is required';
                }
                if (value.length < 10) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Address *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              decoration: _inputDecoration(hint: 'Enter full address'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Address is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF374151),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFC8102E), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}

class PositionDetailsForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PositionDetailsForm({super.key, required this.formKey});

  @override
  State<PositionDetailsForm> createState() => _PositionDetailsFormState();
}

class _PositionDetailsFormState extends State<PositionDetailsForm> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController yearsOfExperienceController =
      TextEditingController();
  final TextEditingController currentCompanyController =
      TextEditingController();
  final TextEditingController currentSalaryController = TextEditingController();
  final TextEditingController expectedSalaryController =
      TextEditingController();
  final TextEditingController noticePeriodController = TextEditingController();

  final List<String> allPositions = [
    'Software Engineer',
    'Senior Flutter Developer',
    'UI/UX Designer',
    'Product Manager',
    'Backend Developer',
    'QA Engineer',
    'DevOps Engineer',
    'Marketing Manager',
    'HR Officer',
    'Finance Executive',
    'Sales Executive',
    'Customer Support',
    'Data Analyst',
    'Project Manager',
    'Business Analyst',
  ];

  List<String> filteredPositions = [];
  String? selectedPosition;
  bool showSuggestions = false;

  @override
  void initState() {
    super.initState();
    filteredPositions = List.from(allPositions);
  }

  @override
  void dispose() {
    searchController.dispose();
    yearsOfExperienceController.dispose();
    currentCompanyController.dispose();
    currentSalaryController.dispose();
    expectedSalaryController.dispose();
    noticePeriodController.dispose();
    super.dispose();
  }

  void _filterPositions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPositions = List.from(allPositions);
      } else {
        filteredPositions = allPositions
            .where(
              (position) =>
                  position.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
      showSuggestions = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC8102E),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Position Details',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildLabel('Position Applied For *'),
            const SizedBox(height: 8),

            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search positions...',
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFC8102E),
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: _filterPositions,
              onTap: () {
                setState(() {
                  showSuggestions = true;
                });
              },
            ),

            if (showSuggestions && filteredPositions.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4),
                constraints: const BoxConstraints(maxHeight: 180),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: filteredPositions.length,
                  itemBuilder: (context, index) {
                    final position = filteredPositions[index];
                    return ListTile(
                      dense: true,
                      title: Text(
                        position,
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        setState(() {
                          selectedPosition = position;
                          searchController.text = position;
                          showSuggestions = false;
                        });
                      },
                    );
                  },
                ),
              ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: selectedPosition,
              decoration: _inputDecoration(hint: 'Select a position'),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: allPositions.map((position) {
                return DropdownMenuItem(
                  value: position,
                  child: Text(position, style: const TextStyle(fontSize: 13)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPosition = value;
                  searchController.text = value ?? '';
                  showSuggestions = false;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a position';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Department'),
            const SizedBox(height: 8),
            TextFormField(
              enabled: false,
              initialValue: 'Not specified',
              style: TextStyle(fontSize: 13),
              decoration: _inputDecoration(
                hint: '',
              ).copyWith(filled: true, fillColor: Colors.grey.shade100),
            ),

            const SizedBox(height: 20),

            _buildLabel('Years of Experience *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: yearsOfExperienceController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration(hint: 'e.g. 3'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Years of experience is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Current Company'),
            const SizedBox(height: 8),
            TextFormField(
              controller: currentCompanyController,
              decoration: _inputDecoration(hint: 'Enter current company'),
            ),

            const SizedBox(height: 20),

            _buildLabel('Current Salary'),
            const SizedBox(height: 8),
            TextFormField(
              controller: currentSalaryController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration(hint: 'Enter current salary'),
            ),

            const SizedBox(height: 20),

            _buildLabel('Expected Salary *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: expectedSalaryController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration(hint: 'Enter expected salary'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Expected salary is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Notice Period *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: noticePeriodController,
              decoration: _inputDecoration(hint: 'e.g. 30 days / Immediate'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Notice period is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF374151),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFC8102E), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}

class SkillsQualificationsForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const SkillsQualificationsForm({super.key, required this.formKey});

  @override
  State<SkillsQualificationsForm> createState() =>
      _SkillsQualificationsFormState();
}

class _SkillsQualificationsFormState extends State<SkillsQualificationsForm> {
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController certificationsController =
      TextEditingController();

  @override
  void dispose() {
    skillsController.dispose();
    educationController.dispose();
    certificationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC8102E),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Skills & Qualifications',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildLabel('Skills *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: skillsController,
              maxLines: 3,
              decoration: _inputDecoration(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Skills are required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Education *'),
            const SizedBox(height: 8),
            TextFormField(
              controller: educationController,
              maxLines: 3,
              decoration: _inputDecoration(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Education is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            _buildLabel('Certifications (Optional)'),
            const SizedBox(height: 8),
            TextFormField(
              controller: certificationsController,
              maxLines: 3,
              decoration: _inputDecoration(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF374151),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFC8102E), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}

class DocumentsForm extends StatefulWidget {
  const DocumentsForm({super.key});

  @override
  State<DocumentsForm> createState() => _DocumentsFormState();
}

class _DocumentsFormState extends State<DocumentsForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? selectedImage;
  String? errorText;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null) return;

      final fileSize = await image.length();

      if (fileSize > 5 * 1024 * 1024) {
        setState(() {
          errorText = 'Image size must be less than 5 MB';
          selectedImage = null;
        });
        return;
      }

      setState(() {
        selectedImage = image;
        errorText = null;
      });
    } catch (e, stackTrace) {
      debugPrint('Gallery picker error: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        errorText = 'Failed to pick image: $e';
      });
    }
  }

  void _removeImage() {
    setState(() {
      selectedImage = null;
      errorText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC8102E),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Documents',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: _pickImageFromGallery,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: errorText != null
                        ? Colors.red
                        : Colors.grey.shade300,
                    style: BorderStyle.solid,
                  ),
                ),
                child: selectedImage == null
                    ? Column(
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 40,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(height: 12),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                              children: const [TextSpan(text: 'Pick a file')],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'PDF, DOC or DOCX · maximum 5 MB',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(selectedImage!.path),
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            selectedImage!.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: _removeImage,
                            icon: const Icon(Icons.delete_outline, size: 18),
                            label: const Text('Remove'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
              ),
            ),

            // Error Message
            if (errorText != null) ...[
              const SizedBox(height: 8),
              Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 13),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CoverLetterForm extends StatefulWidget {
  const CoverLetterForm({super.key});

  @override
  State<CoverLetterForm> createState() => _CoverLetterFormState();
}

class _CoverLetterFormState extends State<CoverLetterForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController coverLetterController = TextEditingController();

  @override
  void dispose() {
    coverLetterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC8102E),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Cover Letter',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Why are you a good fit for this role?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: coverLetterController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your cover letter here...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFC8102E),
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationBottomButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onReset;
  final VoidCallback onSubmit;

  const ApplicationBottomButtons({
    super.key,
    required this.onCancel,
    required this.onReset,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey.shade700,
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Reset Button
        Expanded(
          child: OutlinedButton(
            onPressed: onReset,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey.shade700,
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Submit Button
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC8102E),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Submit Application',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
