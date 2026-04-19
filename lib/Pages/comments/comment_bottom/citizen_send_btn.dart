import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';

class CitizenCommentSendBtn extends StatelessWidget {
  final TextEditingController textEditingController;
  final String postId;
  const CitizenCommentSendBtn({super.key, required this.textEditingController,required this.postId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CommentBloc>().add(OnAddPostCommentsEvent(postId: postId));
            if (textEditingController.text.trim().isEmpty) return;
            textEditingController.clear();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primary,
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        );
      },
    );
  }
}
