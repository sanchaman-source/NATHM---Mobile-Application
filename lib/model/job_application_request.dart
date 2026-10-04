class JobApplicationRequest {
  final String jobId;
  final String firstName;
  final String lastName;
  final String applicantEmail;
  final String applicantPhone;
  final String address;
  final int yearsOfExperience;
  final String? currentCompany;
  final String? currentSalary;
  final String expectedSalary;
  final String noticePeriod;
  final String skills;
  final String education;
  final String? certifications;
  final String resumeUrl;
  final String? coverLetter;

  const JobApplicationRequest({
    required this.jobId,
    required this.firstName,
    required this.lastName,
    required this.applicantEmail,
    required this.applicantPhone,
    required this.address,
    required this.yearsOfExperience,
    this.currentCompany,
    this.currentSalary,
    required this.expectedSalary,
    required this.noticePeriod,
    required this.skills,
    required this.education,
    this.certifications,
    required this.resumeUrl,
    this.coverLetter,
  });

  Map<String, dynamic> toJson() {
    String? clean(String? v) => (v == null || v.trim().isEmpty) ? null : v.trim();

    final map = <String, dynamic>{
      'job_id': jobId,
      'first_name': firstName.trim(),
      'last_name': lastName.trim(),
      'applicant_email': applicantEmail.trim(),
      'applicant_phone': applicantPhone.trim(),
      'address': address.trim(),
      'years_of_experience': yearsOfExperience,
      'current_company': clean(currentCompany),
      'current_salary': clean(currentSalary),
      'expected_salary': expectedSalary.trim(),
      'notice_period': noticePeriod.trim(),
      'skills': skills.trim(),
      'education': education.trim(),
      'certifications': clean(certifications),
      'resume_url': resumeUrl,
      'cover_letter': clean(coverLetter),
    };
    map.removeWhere((_, v) => v == null);
    return map;
  }
}