class DownloadDocument {
  final String category; 
  final String fileType; 
  final String title;
  final DateTime publishedDate;
  final String fileSizeLabel; 
  final String fileUrl; 

  const DownloadDocument({
    required this.category,
    required this.fileType,
    required this.title,
    required this.publishedDate,
    required this.fileSizeLabel,
    required this.fileUrl,
  });
}