import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/comments/comment_bottom/citizen_send_btn.dart';
import 'package:fyp_project/Pages/comments/comment_bottom/citizen_comment_text_feild.dart';
import 'package:fyp_project/config/Components/Custom_circle_avatar.dart';
import 'package:fyp_project/repository/current_user_repository/current_user_repository.dart';

class CitizenFeedCommentBottom extends StatefulWidget {

  final TextEditingController textEditingController;
  final String postId;
  const CitizenFeedCommentBottom({super.key,required this.textEditingController,required this.postId});

  @override
  State<CitizenFeedCommentBottom> createState() => _CitizenFeedCommentBottomState();
}

class _CitizenFeedCommentBottomState extends State<CitizenFeedCommentBottom> {

    final CurrentUserRepository userRepository = CurrentUserRepository();

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

              CustomCircleAvatar(userName: userRepository.userName()!,imageUrl: userRepository.userProfileUrl()),
             
              CommentTextFeild(textEditingController: widget.textEditingController),
              
              const SizedBox(width: 8),
              
              CitizenCommentSendBtn(textEditingController: widget.textEditingController,postId: widget.postId),
              
            ],
          ),
        ),
      ),
    );
  }
}