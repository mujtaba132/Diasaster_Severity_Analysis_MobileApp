import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';

class CitizenFeedCommentHeader extends StatelessWidget {
  const CitizenFeedCommentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocSelector<CommentBloc, CommentState, int>(
      selector: (state) {
        return state.commentList.length;
      },
      builder: (context, totalComments) {
        
        String comments = 
        totalComments == 0 ? 'No Comments':
        totalComments == 1 ? '01 Comment':
        totalComments < 10 ? '0$totalComments Comments'
        : '$totalComments Comments';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              Text(comments, style: theme.textTheme.titleMedium),
            ],
          ),
        );
      },
    );
  }
}
