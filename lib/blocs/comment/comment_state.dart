part of 'comment_bloc.dart';

   
class CommentState extends Equatable {

  final List<CommentModel> commentList;
  final Map<String,CommentModel> commentMap;
  final String addComment;
  final PostCommentLoadStatus postCommentLoadStatus;
  final String error;
  final int refreshTick;


  const CommentState({
      this.commentList = const [],
      this.commentMap = const {},
      this.addComment = '',
      this.postCommentLoadStatus = PostCommentLoadStatus.initail,
      this.error = '',
      this.refreshTick = 0
  });


  CommentState copyWith ({
       List<CommentModel>? newCommentList,
       Map<String,CommentModel>? newCommentMap,
       String? newAddComment,
       PostCommentLoadStatus? newPostCommentLoadStatus,
       String? newError,
       int? newRefreshTick
  }){
      return CommentState(
        commentList: newCommentList ?? commentList,
        commentMap: newCommentMap ?? commentMap,
        postCommentLoadStatus: newPostCommentLoadStatus ?? postCommentLoadStatus,
        addComment: newAddComment ?? addComment,
        error: newError ?? error,
        refreshTick: newRefreshTick ?? refreshTick
      );
  }
  
  @override
  List<Object?> get props => [commentList,commentMap,addComment,postCommentLoadStatus,refreshTick,error];
}
