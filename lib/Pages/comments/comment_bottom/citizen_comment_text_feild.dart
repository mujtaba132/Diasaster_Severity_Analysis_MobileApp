import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';


class CommentTextFeild extends StatelessWidget {
  final TextEditingController textEditingController;
  const CommentTextFeild({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: 
             Expanded(
            child: TextField(
              controller: textEditingController,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              onChanged: (value){
                  context.read<CommentBloc>().add(OnChangeCommentFeildEvent(comment: value));
              },
              decoration: InputDecoration(
                hintText: "Write a comment...",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: theme.cardColor,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ),
        );
      },
    );
  }
}
