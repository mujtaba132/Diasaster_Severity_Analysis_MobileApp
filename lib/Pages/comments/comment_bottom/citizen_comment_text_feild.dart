import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

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
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: 
            AppSearchField(
              controller: textEditingController,
              hintText: 'Add a comment',
              onChanged: (query){
                   context.read<CommentBloc>().add(OnChangeCommentFeildEvent(comment: query)); 
              })
          ),
        );
      },
    );
  }
}
