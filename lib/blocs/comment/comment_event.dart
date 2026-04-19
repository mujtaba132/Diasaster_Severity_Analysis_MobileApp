part of 'comment_bloc.dart';


abstract class CommentEvent extends Equatable {

  const CommentEvent();
  
  @override
  List<Object?> get props => [];
}

class OnLoadPostCommentsEvent extends CommentEvent{}

class OnChangeCommentFeildEvent extends CommentEvent{
     
     final String comment;

     const OnChangeCommentFeildEvent({required this.comment});

     @override
     List<Object?> get props => [comment];
}

class OnAddPostCommentsEvent extends CommentEvent{
   
   final String postId;
  
   const OnAddPostCommentsEvent({required this.postId});

   @override
   List<Object?> get props => [postId];

}