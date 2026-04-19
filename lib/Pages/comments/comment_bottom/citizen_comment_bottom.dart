import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/comments/comment_bottom/citizen_send_btn.dart';
import 'package:fyp_project/Pages/comments/comment_bottom/citizen_comment_text_feild.dart';

class CitizenFeedCommentBottom extends StatelessWidget {

  final TextEditingController textEditingController;
  final String postId;
  const CitizenFeedCommentBottom({super.key,required this.textEditingController,required this.postId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
          child: Row(
            children: [
             
              CommentTextFeild(textEditingController: textEditingController),
              
              const SizedBox(width: 8),
              
              CitizenCommentSendBtn(textEditingController: textEditingController,postId: postId),
              
            ],
          ),
        ),
      ),
    );
  }
}