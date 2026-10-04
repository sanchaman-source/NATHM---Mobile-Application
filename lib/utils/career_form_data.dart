import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:natham_college/model/career_job.dart';

class CareerFormData {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  final yearsOfExperience = TextEditingController();
  final currentCompany = TextEditingController();
  final currentSalary = TextEditingController();
  final expectedSalary = TextEditingController();
  final noticePeriod = TextEditingController();
  CareerJob? selectedJob;

  final skills = TextEditingController();
  final education = TextEditingController();
  final certifications = TextEditingController();

  PlatformFile? resume;

  int resumeSize = 0;

  String? get resumeName {
    final p = resume?.path;
    if (p == null) return null;
    return p.split(RegExp(r'[\\/]')).last;
  }

  final coverLetter = TextEditingController();

  List<TextEditingController> get _all => [
    firstName,
    lastName,
    email,
    phone,
    address,
    yearsOfExperience,
    currentCompany,
    currentSalary,
    expectedSalary,
    noticePeriod,
    skills,
    education,
    certifications,
    coverLetter,
  ];

  void reset() {
    for (final c in _all) {
      c.clear();
    }
    selectedJob = null;
    resume = null;
  }

  void dispose() {
    for (final c in _all) {
      c.dispose();
    }
  }
}
