part of 'local_severity_bloc.dart';


class LocalSeverityEvent extends Equatable {
  const LocalSeverityEvent();
  
  @override
  List<Object?> get props => [];
}

class OnLoadLocalSeverityEvent extends LocalSeverityEvent {}

class OnSearchLocalSeverityEvent extends LocalSeverityEvent {
    final String query;
     const OnSearchLocalSeverityEvent({required this.query});

     @override
     List<Object?> get props => [query];
}

class OnDeleteLocalSeverityEvent extends LocalSeverityEvent {
     final String reportId;
     const OnDeleteLocalSeverityEvent({required this.reportId});

     @override
     List<Object?> get props => [reportId];
}

class OnUploadMediaEvent extends LocalSeverityEvent{
     final File file;
     const OnUploadMediaEvent({required this.file});

     @override
     List<Object?> get props => [file];
}
 
class OnSubmitRequestEvent extends LocalSeverityEvent{
     final MediaModel model;
     const OnSubmitRequestEvent({required this.model});

     @override
     List<Object?> get props => [model];
}
