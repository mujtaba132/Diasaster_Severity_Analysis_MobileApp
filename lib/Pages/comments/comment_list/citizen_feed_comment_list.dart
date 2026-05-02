import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/comments/comment_list/comment_list_card/citizen_feed_comment_item.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class CitizenFeedCommentList extends StatelessWidget {
  final String postId;
  const CitizenFeedCommentList({super.key,required this.postId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: BlocBuilder<CommentBloc, CommentState>(
        buildWhen: (previous, current) =>
            previous.postCommentLoadStatus != current.postCommentLoadStatus ||
            previous.commentList.length != current.commentList.length,
        builder: (context, state) {
          if (state.postCommentLoadStatus == PostCommentLoadStatus.loading) {
            return Center(child: CustomLoading(color: theme.primaryColor));
          } else if (state.postCommentLoadStatus ==
              PostCommentLoadStatus.error) {
            return Center(child: CustomException(message: state.error));
          } else if (state.commentList.isEmpty) {
            return Center(
              child: SingleChildScrollView(
                child: CustomException(
                  title: "Comments",
                  message: "No Comments Available.",
                  icon: Icons.comment_rounded),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: state.commentList.length,
            itemBuilder: (_, index) {
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 300 + (index * 50)),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: CitizenFeedCommentItem(
                    postId: postId,
                    commentId: state.commentList[index].commentId!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
