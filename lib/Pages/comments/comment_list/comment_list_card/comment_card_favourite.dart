import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/commentModel/comment_model.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';


class CommentCardFavourite extends StatelessWidget {
  final CommentModel report;
  final String postId;

  const CommentCardFavourite({super.key, required this.report,required this.postId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<CommentBloc>().add(
                  OnFavouriteCommentEvent(
                    commentId: report.commentId!,
                    postId: postId
                  ),
                );
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Icon(
                  report.isLike!
                      ? Icons.favorite_rounded
                      : Icons.favorite_border,
                  key: ValueKey(report.isLike), 
                  color: Colors.red[700],
                ),
              ),
            ),

            const SizedBox(width: 5),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                report.likes!.toString(),
                key: ValueKey(report.likes),
              ),
            ),
          ],
        ),
      ],
    );
  }
}