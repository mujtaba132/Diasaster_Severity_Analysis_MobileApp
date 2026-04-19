import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/comments/comment_list/citizen_feed_comment_item.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class CitizenFeedCommentList extends StatelessWidget {
  const CitizenFeedCommentList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: BlocBuilder<CommentBloc, CommentState>(
        buildWhen: (previous, current) => 
        previous.postCommentLoadStatus!=current.postCommentLoadStatus 
        || previous.commentList!=current.commentList,
        builder: (context, state) {
        
                    if (state.postCommentLoadStatus == PostCommentLoadStatus.loading) {
                      return Center(child: CustomLoading(color: theme.primaryColor));
                    } else if (state.postCommentLoadStatus == PostCommentLoadStatus.error) {
                      return Center(child: CustomException(message: state.error));
                    } else if (state.commentList.isEmpty) {
                      return Center(child: CustomException(message: "No Comments Available."));
                    }
          
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: state.commentList.length,
            itemBuilder: (_, index) {
              return CitizenFeedCommentItem(index: index);
            },
          );
        },
      ),
    );
  }
}
