class Notice {
  final String id;
  final String title;
  final String subtitle;
  final String category; 
  final DateTime date;
  final bool isLatest; 

  Notice({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.date,
    this.isLatest = false,
  });
}