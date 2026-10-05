import 'package:flutter/material.dart';
import 'package:natham_college/model/download_document.dart';

class DownloadListItem extends StatelessWidget {
  final DownloadDocument document;
  final VoidCallback onDownload;

  const DownloadListItem({
    super.key,
    required this.document,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4E4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.description_outlined,
              color: Color(0xFFB71C1C),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (document.category.isNotEmpty)
                      _Badge(text: document.category.toUpperCase()),
                    if (document.category.isNotEmpty) const SizedBox(width: 6),
                    _Badge(text: document.fileType, filled: false),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  document.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (document.dateLabel.isNotEmpty) ...[
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        document.dateLabel,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    if (document.sizeLabel.isNotEmpty) ...[
                      const Icon(
                        Icons.file_download_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        document.sizeLabel,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onDownload,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DOWNLOAD',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.download, size: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final bool filled;
  const _Badge({required this.text, this.filled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: filled ? Colors.grey.shade200 : Colors.transparent,
        border: filled ? null : Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}