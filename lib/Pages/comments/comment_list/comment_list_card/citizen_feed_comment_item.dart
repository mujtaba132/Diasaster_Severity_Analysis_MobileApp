import 'package:flutter/material.dart';
import 'package:fyp_project/Model/commentModel/comment_model.dart';
import 'package:fyp_project/Pages/comments/comment_list/comment_list_card/comment_card_favourite.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fyp_project/config/Components/Custom_circle_avatar.dart';

class CitizenFeedCommentItem extends StatefulWidget {
  final CommentModel report;
  final String postId;
  const CitizenFeedCommentItem({
    super.key,
    required this.report,
    required this.postId,
  });

  @override
  State<CitizenFeedCommentItem> createState() => _CitizenFeedCommentItemState();
}

class _CitizenFeedCommentItemState extends State<CitizenFeedCommentItem> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleAvatar(
                userName: widget.report.userName!,
                imageUrl: widget.report.userProfileUrl,
                radius: 18,
              ),

              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.report.userName!,
                                style: theme.textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.report.comment!,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 15),    
                        
                        CommentCardFavourite(report: widget.report,postId: widget.postId),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

           Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(timeago.format(widget.report.timeStamp!)),
                  const SizedBox(width: 7),
                ],
              )
        ],
      ),
    );
  }
}
