class DownloadDocument {
  final String id;
  final String title;
  final String category;
  final String categorySlug;
  final DateTime? publishedDate;
  final String fileUrl;
  final String fileName;
  final String contentType;
  final int sizeBytes;

  const DownloadDocument({
    required this.id,
    required this.title,
    required this.category,
    required this.categorySlug,
    required this.publishedDate,
    required this.fileUrl,
    required this.fileName,
    required this.contentType,
    required this.sizeBytes,
  });

  factory DownloadDocument.fromNoticeJson(
    Map<String, dynamic> notice,
    Map<String, dynamic> attachment,
  ) {
    return DownloadDocument(
      id: (attachment['id'] ?? '').toString(),
      title: (notice['title'] ?? '').toString(),
      category: (notice['category'] ?? '').toString(),
      categorySlug: (notice['category_slug'] ?? '').toString(),
      publishedDate: DateTime.tryParse(
        (notice['published_date'] ?? '').toString(),
      ),
      fileUrl: (attachment['file_url'] ?? '').toString(),
      fileName: (attachment['file_name'] ?? '').toString(),
      contentType: (attachment['content_type'] ?? '').toString(),
      sizeBytes: (attachment['size_bytes'] as num?)?.toInt() ?? 0,
    );
  }

  String get fileType {
    final t = contentType.toLowerCase();
    if (t.contains('pdf')) return 'PDF';
    if (t.contains('jpeg') || t.contains('jpg')) return 'JPG';
    if (t.contains('png')) return 'PNG';
    if (t.contains('word')) return 'DOC';
    final dot = fileName.lastIndexOf('.');
    return dot == -1 ? 'FILE' : fileName.substring(dot + 1).toUpperCase();
  }

  String get sizeLabel {
    if (sizeBytes <= 0) return '';
    if (sizeBytes < 1024 * 1024) return '${(sizeBytes / 1024).round()} KB';
    return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String get dateLabel {
    final d = publishedDate;
    if (d == null) return '';
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${d.day.toString().padLeft(2, '0')} ${months[d.month - 1]} ${d.year}';
  }

  static const String _fileBaseUrl = 'https://nathm-backend.onrender.com';

  String get resolvedFileUrl {
    if (fileUrl.isEmpty) return '';
    if (fileUrl.startsWith('http://') || fileUrl.startsWith('https://')) {
      return fileUrl;
    }
    return fileUrl.startsWith('/')
        ? '$_fileBaseUrl$fileUrl'
        : '$_fileBaseUrl/$fileUrl';
  }
}
