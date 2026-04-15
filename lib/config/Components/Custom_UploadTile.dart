import 'package:flutter/material.dart';

enum UploadStatus { initial, loading, success, error }

class UploadTile extends StatelessWidget {
  final String fileName;
  final UploadStatus status;
  final VoidCallback? onUpload;
  final VoidCallback? onPreview;

  const UploadTile({
    super.key,
    required this.fileName,
    required this.status,
    this.onUpload,
    this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isSuccess = status == UploadStatus.success;
    final isLoading = status == UploadStatus.loading;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSuccess
            ? Colors.green.withOpacity(0.1)
            : theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSuccess
              ? Colors.green
              : theme.dividerColor.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          ///  Icon
          Icon(
            isSuccess ? Icons.check_circle : Icons.upload_file,
            color: isSuccess
                ? Colors.green
                : theme.iconTheme.color,
          ),

          const SizedBox(width: 10),

          /// File Name / Placeholder
          Expanded(
            child: Text(
              fileName.isNotEmpty
                  ? fileName
                  : "Upload Registration Certificate",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),

          /// Loading
          if (isLoading)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.primaryColor,
              ),
            ),

          ///  Upload Button
          if (!isLoading && !isSuccess && fileName.isNotEmpty)
            IconButton(
              onPressed: onUpload,
              icon: const Icon(Icons.file_upload_outlined),
            ),

          ///  Preview Button
          if (!isLoading && !isSuccess && fileName.isNotEmpty)
            IconButton(
              onPressed: onPreview,
              icon: const Icon(Icons.remove_red_eye),
            ),
        ],
      ),
    );
  }
}