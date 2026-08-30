class Course {
  final String id;
  final String title;
  final String shortDescription;
  final String level;          
  final String duration;      
  final int seats;
  final String discipline;    
  final String institution;   
  final String imagePath;

  Course({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.level,
    required this.duration,
    required this.seats,
    required this.discipline,
    required this.institution,
    required this.imagePath,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      level: json['level'] ?? '',
      duration: json['duration'] ?? '',
      seats: json['seats'] ?? 0,
      discipline: json['discipline'] ?? '',
      institution: json['institution'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}

final List<Course> dummyCourses = [
  Course(
    id: '1',
    title: 'Master of Science in Mountain and Adventure Tourism',
    shortDescription: '',
    level: 'BACHELOR',
    duration: '2 YEARS',
    seats: 0,
    discipline: 'HOTEL MANAGEMENT',
    institution: 'NATHM',
    imagePath: 'assets/images/nathmtwo.jpeg', // dummy
  ),
  Course(
    id: '2',
    title: 'Master of Adventure Tourism Studies',
    shortDescription: '',
    level: 'MASTER',
    duration: '2 YEARS',
    seats: 0,
    discipline: 'HOTEL MANAGEMENT',
    institution: 'NATHM',
    imagePath: 'assets/images/mslu.jpg',
  ),
  Course(
    id: '3',
    title: 'Masters of Hospitality Management',
    shortDescription: 'Objectives The Master of Hospitality Management (MHM) is a hybrid program...',
    level: 'MASTER',
    duration: '2 YEARS',
    seats: 0,
    discipline: 'HOTEL MANAGEMENT',
    institution: 'NATHM',
    imagePath: 'assets/images/mn.jpg',
  ),
];