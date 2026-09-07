import 'package:flutter/material.dart';
import 'package:natham_college/model/application_form_model.dart';
import 'package:natham_college/screen/study/apply/screen/academic_step.dart';
import 'package:natham_college/screen/study/apply/screen/address_step_page.dart';
import 'package:natham_college/screen/study/apply/screen/apply_now_page.dart';
import 'package:natham_college/screen/study/apply/screen/declaration_step.dart';
import 'package:natham_college/screen/study/apply/screen/guardian_step.dart';
import 'package:natham_college/screen/study/apply/screen/payment_step.dart';
import 'package:natham_college/screen/study/apply/screen/personal_info_step.dart';
import 'package:natham_college/screen/study/apply/screen/review_step.dart';

class ApplicationFormWidget extends StatefulWidget {
  final String? preSelectedCourse;
  final Widget? topSection;
  final VoidCallback? onSubmitted;

  const ApplicationFormWidget({
    super.key,
    this.preSelectedCourse,
    this.topSection,
    this.onSubmitted,
  });

  @override
  State<ApplicationFormWidget> createState() => _ApplicationFormWidgetState();
}

class _ApplicationFormWidgetState extends State<ApplicationFormWidget> {
  final ApplicationFormData _formData = ApplicationFormData();

  int currentStep = 1;
  String? selectedCourse;

  final steps = const [
    StepData('Personal'),
    StepData('Address'),
    StepData('Guardian'),
    StepData('Academics'),
    StepData('Declaration'),
    StepData('Review'),
    StepData('Payment'),
  ];

  final List<GlobalKey<FormState>> _formKeys = List.generate(
    7,
    (_) => GlobalKey<FormState>(),
  );

  @override
  void initState() {
    super.initState();
    selectedCourse = widget.preSelectedCourse;
  }

  void _goNext() {
    final isStepValid =
        _formKeys[currentStep - 1].currentState?.validate() ?? true;
    if (!isStepValid) return;

    if (currentStep < steps.length) {
      setState(() => currentStep++);
    } else {
      widget.onSubmitted?.call();
    }
  }

  void _goBack() {
    if (currentStep > 1) setState(() => currentStep--);
  }

  Widget _buildStepBody(int step) {
    switch (step) {
      case 1:
        return PersonalInfoStep(
          formKey: _formKeys[0],
          data: _formData,
          preSelectedCourse: widget.preSelectedCourse,
          isCourseLocked: widget.preSelectedCourse != null,
          onFormChanged: (isFormComplete) {
            setState(() {});
          },
        );
      case 2:
        return AddressForm(
          formKey: _formKeys[1],
          data: _formData,
          onFormChanges: (isFormComplete) {
            setState(() {});
          },
        );
      case 3:
        return GuardianStep(
          formKey: _formKeys[2],
          data: _formData,
          onFormChanges: (isFormComplete) {
            setState(() {});
          },
        );
      case 4:
        return AcademicStep(
          formKey: _formKeys[3],
          data: _formData,
          onFormChanges: (isFormComplete) {
            setState(() {});
          },
        );
      case 5:
        return DeclarationStep(
          formKey: _formKeys[4],
          data: _formData,
          onFormChanges: (isFormComplete) {
            setState(() {});
          },
        );
      case 6:
        return ReviewStep(
          formKey: _formKeys[5],
          data: _formData,
          onEditStep: (stepIndex) {
            setState(() {
              currentStep = stepIndex;
            });
          },
        );
      case 7:
        return PaymentStep(
          formKey: _formKeys[6],
          data: _formData,
          onFormChanges: (value) {
            setState(() {});
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.topSection != null) widget.topSection!,
            ApplicationStepperHeader(currentStep: currentStep, steps: steps),

            const SizedBox(height: 10),

            _buildStepBody(currentStep),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    if (currentStep > 1)
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _goBack,
                          child: Row(
                            children: const [
                              Icon(Icons.arrow_back,size: 14),
                              SizedBox(width: 5),
                              Text('Previous',
                              style: TextStyle(
                                    fontSize: 12
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (currentStep > 1) const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF800000),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _goNext,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentStep == steps.length
                                  ? (_formData.paymentGateway == 'connectips'
                                        ? 'Pay with connectIPS'
                                        : 'Pay with eSewa')
                                  : 'Next',
                                  style: TextStyle(
                                    fontSize: 12
                                  ),
                            ),
                            const SizedBox(width: 6),
                            if (currentStep == steps.length)
                              const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseApplyFormScreen extends StatelessWidget {
  final String imagePath;
  final String courseLevel;
  final String courseTitle;
  final String courseDiscipline;
  final int courseSeat;
  final String campus;

  const CourseApplyFormScreen({
    super.key,
    required this.imagePath,
    required this.courseLevel,
    required this.courseTitle,
    required this.courseDiscipline,
    required this.courseSeat,
    required this.campus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admission Application')),
      body: ApplicationFormWidget(
        preSelectedCourse: courseTitle,
        topSection: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: BannerCard(
            imagePath: imagePath,
            courseLevel: courseLevel,
            courseTitle: courseTitle,
            courseDiscipline: courseDiscipline,
            courseSeat: courseSeat,
            campus: campus,
          ),
        ),
      ),
    );
  }
}

class TrackApplyFormScreen extends StatelessWidget {
  const TrackApplyFormScreen({super.key});

  static const _accent = Color(0xFF8B1E2D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply')),
      body: ApplicationFormWidget(
        preSelectedCourse: null,
        topSection: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'APPLICATION FORM',
                style: TextStyle(
                  color: _accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 0.6,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Admission Application',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
