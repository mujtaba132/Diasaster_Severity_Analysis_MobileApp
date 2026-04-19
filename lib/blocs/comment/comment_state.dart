part of 'comment_bloc.dart';

   
class CommentState extends Equatable {

  final List<CommentModel> commentList;
  final String addComment;
  final PostCommentLoadStatus postCommentLoadStatus;
  final String error;

  const CommentState({
      this.commentList = const [],
      this.addComment = '',
      this.postCommentLoadStatus = PostCommentLoadStatus.initail,
      this.error = ''
  });


  CommentState copyWith ({
       List<CommentModel>? newCommentList,
       String? newAddComment,
       PostCommentLoadStatus? newPostCommentLoadStatus,
       String? newError
  }){
      return CommentState(
        commentList: newCommentList ?? commentList,
        postCommentLoadStatus: newPostCommentLoadStatus ?? postCommentLoadStatus,
        addComment: newAddComment ?? addComment,
        error: newError ?? error
      );
  }
  
  @override
  List<Object?> get props => [commentList,addComment,postCommentLoadStatus,error];
}
