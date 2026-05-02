import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/commentModel/comment_model.dart';
import 'package:fyp_project/repository/current_user_repository/current_user_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:uuid/uuid.dart';

part 'comment_event.dart';
part 'comment_state.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {

  FirebaseRepository firebaseRepository;
  CurrentUserRepository currentUserRepository;
  final uniqueId = Uuid();

  CommentBloc(this.firebaseRepository,this.currentUserRepository) : super(CommentState()) {
    on<OnLoadPostCommentsEvent>(_onLoadComments);
    on<OnChangeCommentFeildEvent>(_onChangeFeild);
    on<OnAddPostCommentsEvent>(_onAddComment);
    on<OnFavouriteCommentEvent>(_onFavouriteComment);
  }

  void _onLoadComments (OnLoadPostCommentsEvent event, Emitter<CommentState> emit)
  async{
        emit(state.copyWith(newPostCommentLoadStatus: PostCommentLoadStatus.loading));

        await emit.forEach(
            firebaseRepository.listenToSubCollectionData(
              mainCollection: 'UsersMedia', 
              mainDoc: event.postId, 
              subCollection: 'Comments',
              orderBy: 'time_stamp',
              isDescending: true),
            onData: (data) {
                
                List<CommentModel> postCommemts = data.map(
                  (comment) {
                     return CommentModel.fromJson(Map<String,dynamic>.from(comment.data() as Map));
                  },
                ).toList();

               final commentMap = {for(var item in postCommemts) item.commentId! : item };
      
                 return state.copyWith(
                 newCommentList: postCommemts,
                 newCommentMap: commentMap,
                 newPostCommentLoadStatus: PostCommentLoadStatus.success);
            },
            onError: (error, stackTrace) {
               return state.copyWith(newError: error.toString(),newPostCommentLoadStatus: PostCommentLoadStatus.error);
            },

        );
        

        emit(state.copyWith(newPostCommentLoadStatus: PostCommentLoadStatus.success));
  }

   void _onChangeFeild (OnChangeCommentFeildEvent event, Emitter<CommentState> emit)
  {
          emit(state.copyWith(newAddComment: event.comment));    
  }
  
  void _onAddComment (OnAddPostCommentsEvent event, Emitter<CommentState> emit) async{
        
        String commentId = uniqueId.v4();
        CommentModel newComment = CommentModel(
           commentId: commentId,
           comment: state.addComment,
           userName: currentUserRepository.userName(),
           userProfileUrl: currentUserRepository.userProfileUrl(),
           timeStamp: DateTime.now()
        );

        List<CommentModel> updatedList = [newComment, ...state.commentList];

        emit(state.copyWith(newCommentList: updatedList));

        await firebaseRepository.setSubCollectionData(
          mainCollection: 'UsersMedia', 
          mainDoc: event.postId, 
          subCollection: 'Comments', 
          subDoc: commentId, 
          data: newComment.toJson()).onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString()));
          });


  }
  
  void _onFavouriteComment(OnFavouriteCommentEvent event, Emitter<CommentState> emit) async{     

         Map<String,dynamic> updateData = {};

         List<CommentModel> updatedList = state.commentList.map((comment) {
               if(comment.commentId! == event.commentId)
               {    
                    updateData = {
                      'is_like': !comment.isLike!,
                      'likes' : !comment.isLike!?
                       FieldValue.increment(1):
                       FieldValue.increment(-1)
                    };

                    return !comment.isLike!?
                    comment.copyWith(isLike: !comment.isLike!,likes: comment.likes!+1):
                    comment.copyWith(isLike: !comment.isLike!,likes: comment.likes!-1);                   
               }
               return comment;
         }).toList();

         emit(state.copyWith(newCommentList: updatedList));

         await firebaseRepository.updateData(
           path:"UsersMedia/${event.postId}/Comments/${event.commentId}",
           data: updateData);
  }

}
