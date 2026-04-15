import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart'; 
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/repository/cloudinary_repository/cloudinaryRepository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'register_ngo_event.dart';
part 'register_ngo_state.dart';

class RegisterNgoBloc extends Bloc<RegisterNgoEvent, RegisterNgoState> {

  late Cloudinaryrepository cloudinaryrepository;
  late FirebaseRepository firebaserepository;
  RegisterNgoBloc(this.cloudinaryrepository,this.firebaserepository) : super(RegisterNgoState()) {
    on<OnChangedNameEvent>(_onChangeName);
    on<OnChangedAddressEvent>(_onChangeAddress);
    on<OnChangedPhoneNoEvent>(_onChangePhoneNo);
    on<OnChangedBankNameEvent>(_onChangeBankName);
    on<OnChangedAccountNoEvent>(_onChangeAccountNo);
    on<OnPickFileEvent>(_onPickFile);
    on<OnUploadFileEvent>(_onUploadedUrl);
    on<OnregisterFormSubmitEvent>(_onRegisterFormSubmit);
  }

  void _onChangeName(OnChangedNameEvent event, Emitter<RegisterNgoState> emit) {
    emit(state.copyWith(newName: event.name));
  }

  void _onChangeAddress(
    OnChangedAddressEvent event,
    Emitter<RegisterNgoState> emit,
  ) {
    emit(state.copyWith(newAddress: event.address));
  }

  void _onChangePhoneNo(
    OnChangedPhoneNoEvent event,
    Emitter<RegisterNgoState> emit,
  ) {
    emit(state.copyWith(newPhoneNo: event.phoneNo));
  }

  void _onChangeBankName(
    OnChangedBankNameEvent event,
    Emitter<RegisterNgoState> emit,
  ) {
    emit(state.copyWith(newBankName: event.bankName));
  }

  void _onChangeAccountNo(
    OnChangedAccountNoEvent event,
    Emitter<RegisterNgoState> emit,
  ) {
    emit(state.copyWith(newAccountNo: event.accountNo));
  }

  void _onPickFile(
    OnPickFileEvent event,
    Emitter<RegisterNgoState> emit,
  )async{
     
     FilePickerResult? result;

try {

  result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png'],
  );
} 
catch (error) {
  emit(state.copyWith(newUploadCertificateStatus: UploadCertificateStatus.error,newError: error.toString()));
  return; 
}

if (result != null && result.files.single.path != null) {

  final extension = result.files.single.extension?.toLowerCase();

  if (extension != null && ['jpg', 'png'].contains(extension)) {
    final fileName = result.files.single.name; 
    final filePath = result.files.single.path!;

    emit(state.copyWith(newUploadCertificateStatus: UploadCertificateStatus.initail,newCertificateFile: filePath,newFileName: fileName));
  } else {
    emit(state.copyWith(newUploadCertificateStatus: UploadCertificateStatus.error,newError: "Only JPG, PNG allowed"));
  }
}
  }

  void _onUploadedUrl(
    OnUploadFileEvent event,
    Emitter<RegisterNgoState> emit,
  ) async {
       emit(state.copyWith(newUploadCertificateStatus: UploadCertificateStatus.loading));

       await cloudinaryrepository.uploadCloudinaryImage(filePath: state.certificateFile).then((path) {
                 emit(state.copyWith(newUploadedCertificateUrl: path,newUploadCertificateStatus: UploadCertificateStatus.success));
       }).onError((error, stackTrace) {
             emit(state.copyWith(newUploadCertificateStatus: UploadCertificateStatus.error,newError: error.toString())); 
       });
  }

  void _onRegisterFormSubmit(
    OnregisterFormSubmitEvent event,
    Emitter<RegisterNgoState> emit,
  ) async{

        if(state.uploadCertificateStatus!=UploadCertificateStatus.success)
        {
          emit(state.copyWith(newSubmitNGOsStatus: SubmitRegisterNGOsStatus.error,newError: "File not Uploaded"));
          return;
        }
        
        emit(state.copyWith(newSubmitNGOsStatus: SubmitRegisterNGOsStatus.loading));

        NGOModel newNGO = NGOModel(
          ngoName: state.name,
          address: state.address,
          phoneNo: state.phoneNo,
          bankName: state.bankName,
          accountNo: state.accountNo,
          cerficateUrl: state.uploadedCertificateUrl,
          isVerified: false,
        );

       try{
        await firebaserepository.pushData(path: 'NGOsRequests', data: newNGO.toJson());
        emit(state.copyWith(newSubmitNGOsStatus: SubmitRegisterNGOsStatus.success));
        }
        catch(error)
        {
          emit(state.copyWith(newSubmitNGOsStatus: SubmitRegisterNGOsStatus.error,newError: error.toString()));
        }

  }
}
