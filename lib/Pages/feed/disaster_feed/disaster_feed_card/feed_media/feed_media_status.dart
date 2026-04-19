import 'package:flutter/material.dart';
import 'package:fyp_project/utils/enums.dart';

class FeedMediaStatus extends StatelessWidget {
  final CitizenFeedStatus status;
  final Role role;
  const FeedMediaStatus({super.key,required this.status,required this.role});

  @override
  Widget build(BuildContext context) {
    return  
     (role==Role.admin || role==Role.user)?
    Positioned(
      top: 10,
      right: 12,
      child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status.name,
                    style: TextStyle(
                      color: _getStatusColor(status),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
    ):
    const SizedBox.shrink();
  }

   Color _getStatusColor(CitizenFeedStatus status) {
    switch (status) {
      case CitizenFeedStatus.pending:
        return Colors.orange;
      case CitizenFeedStatus.processing:
        return Colors.red;
      case CitizenFeedStatus.approved:
        return Colors.green;
    }
  }
}