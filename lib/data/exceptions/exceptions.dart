sealed class AppExceptions implements Exception{
    
   final String? message;
   final String? defaultMsg;

    const AppExceptions({
       this.message = '',
       this.defaultMsg = '',
    });

     @override
       String toString()
       {
           return '$message$defaultMsg';
       }
}


class NoInternetException extends AppExceptions{
      NoInternetException(String? message):super(message: message ?? '',defaultMsg: 'Error: No or Unstable Internet Connection!!');
}

class TimeoutException extends AppExceptions{
      TimeoutException(String? message):super(message: message ?? '',defaultMsg: 'Error: Timeout occur!!');
}

class UnAuthorizedException extends AppExceptions{
      UnAuthorizedException(String? message):super(message: message ?? '',defaultMsg: 'Error: UnAuthorized Access!!');
}

class FobiddenException extends AppExceptions{
      FobiddenException(String? message):super(message: message ?? '',defaultMsg: 'Error: Not allowed by server!!');
}


class GeneralException extends AppExceptions{
      GeneralException(String? message):super(message: message ?? '',defaultMsg: '');
}





