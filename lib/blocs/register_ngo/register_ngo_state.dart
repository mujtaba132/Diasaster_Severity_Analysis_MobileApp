part of 'register_ngo_bloc.dart';

class RegisterNgoState extends Equatable {

  final String name;
  final String address;
  final String phoneNo;
  final String bankName;
  final String accountNo;
  final String uploadedCertificateUrl;
  final UploadCertificateStatus uploadCertificateStatus;
  final SubmitRegisterNGOsStatus submitRegisterNGOsStatus;
  final String certificateFile;
  final String fileName;
  final String error;

  const RegisterNgoState({
    this.name='', 
    this.address='', 
    this.phoneNo='', 
    this.bankName='', 
    this.accountNo='', 
    this.uploadedCertificateUrl='',
    this.uploadCertificateStatus=UploadCertificateStatus.initail,
    this.submitRegisterNGOsStatus=SubmitRegisterNGOsStatus.initail,
    this.certificateFile='',
    this.fileName='',
    this.error=''});
  

  RegisterNgoState copyWith ({
       String? newName,
       String? newAddress,
       String? newPhoneNo,
       String? newBankName,
       String? newAccountNo,
       String? newUploadedCertificateUrl,
       UploadCertificateStatus? newUploadCertificateStatus,
       SubmitRegisterNGOsStatus? newSubmitNGOsStatus,
       String? newCertificateFile,
       String? newFileName,
       String? newError
    })
  {
      return
          RegisterNgoState(
            name: newName ?? name,
            address: newAddress ?? address,
            phoneNo: newPhoneNo ?? phoneNo,
            bankName: newBankName ?? bankName,
            accountNo: newAccountNo ?? accountNo,
            uploadedCertificateUrl: newUploadedCertificateUrl ?? uploadedCertificateUrl, 
            uploadCertificateStatus: newUploadCertificateStatus ?? uploadCertificateStatus,
            submitRegisterNGOsStatus: newSubmitNGOsStatus ?? submitRegisterNGOsStatus,
            certificateFile: newCertificateFile ?? certificateFile,
            fileName: newFileName ?? fileName,
            error: newError ?? error,
          );
  }
  @override
  List<Object?> get props => [name,address,phoneNo,bankName,accountNo,uploadedCertificateUrl,uploadCertificateStatus,submitRegisterNGOsStatus,certificateFile,error,fileName];
}
