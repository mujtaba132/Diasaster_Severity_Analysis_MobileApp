import 'package:bloc/bloc.dart';
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
  }

  void _onLoadComments (OnLoadPostCommentsEvent event, Emitter<CommentState> emit)
  async{
        emit(state.copyWith(newPostCommentLoadStatus: PostCommentLoadStatus.loading));

        await Future.delayed(Duration(seconds: 5));

        emit(state.copyWith(newPostCommentLoadStatus: PostCommentLoadStatus.success));
  }

   void _onChangeFeild (OnChangeCommentFeildEvent event, Emitter<CommentState> emit)
  {
          emit(state.copyWith(newAddComment: event.comment));    
  }
  
  void _onAddComment (OnAddPostCommentsEvent event, Emitter<CommentState> emit)
  {
        CommentModel newComment = CommentModel(
           commentId: uniqueId.v4(),
           comment: state.addComment,
           userName: currentUserRepository.userName(),
           userProfileUrl: currentUserRepository.userProfileUrl(),
        );

        List<CommentModel> updatedList = state.commentList..insert(0, newComment);

        emit(state.copyWith(newCommentList: updatedList));
  }
  
}
