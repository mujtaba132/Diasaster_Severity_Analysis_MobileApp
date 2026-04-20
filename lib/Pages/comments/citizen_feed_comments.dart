import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/comments/comment_list/citizen_feed_comment_list.dart';
import 'package:fyp_project/Pages/comments/comment_bottom/citizen_comment_bottom.dart';
import 'package:fyp_project/Pages/comments/comment_header/citizen_feed_comment_header.dart';
import 'package:fyp_project/blocs/comment/comment_bloc.dart';
import 'package:fyp_project/main.dart';


class CommentSection extends StatefulWidget {
  final String postId;
  const CommentSection({super.key,required this.postId});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late CommentBloc _commentBloc;


  @override
  void initState() {
    super.initState();

    _commentBloc = getit<CommentBloc>()..add(OnLoadPostCommentsEvent(postId: widget.postId));

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _commentBloc.close();
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _commentBloc,
      child: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) {
            return Transform.translate(
              offset: Offset(0, (1 - _animationController.value) * 500),
              child: child,
            );
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                child: Container(
                  color: theme.scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        
                       CitizenFeedCommentHeader(),
                          
                       CitizenFeedCommentList(postId: widget.postId),
                          
                       CitizenFeedCommentBottom(
                        textEditingController: _controller,
                        postId: widget.postId
                        ),
                          
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }



}


