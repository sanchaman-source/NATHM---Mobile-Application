class CareerJob {
  final String id;
  final String title;
  final String? titleNp;
  final String? location;
  final String? departmentName;
  final String? fullDescription;
  final String? requirements;
  final List<String> responsibilities;
  final List<String> qualifications;
  final int? vacancies;
  final DateTime? closingDate;
  final bool isActive;
  final String? attachmentUrl;

  const CareerJob({
    required this.id,
    required this.title,
    this.titleNp,
    this.location,
    this.departmentName,
    this.fullDescription,
    this.requirements,
    this.responsibilities = const [],
    this.qualifications = const [],
    this.vacancies,
    this.closingDate,
    this.isActive = true,
    this.attachmentUrl,
  });

  factory CareerJob.fromJson(Map<String, dynamic> j) {
    List<String> strList(dynamic v) =>
        v is List ? v.map((e) => e.toString()).toList() : <String>[];

    return CareerJob(
      id: j['id'].toString(),
      title: (j['title'] ?? '').toString(),
      titleNp: j['title_np'] as String?,
      location: j['location'] as String?,
      departmentName: j['department_name'] as String?,
      fullDescription: j['full_description'] as String?,
      requirements: j['requirements'] as String?,
      responsibilities: strList(j['responsibilities']),
      qualifications: strList(j['qualifications']),
      vacancies: j['vacancies_count'] as int?,
      closingDate: DateTime.tryParse(j['closing_date']?.toString() ?? ''),
      isActive: j['is_active'].toString().toLowerCase() == 'true',
      attachmentUrl: j['attachment_url'] as String?,
    );
  }
}