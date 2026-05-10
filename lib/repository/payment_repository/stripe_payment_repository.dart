import 'dart:io';

import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/services/Payment/Stripe_Payment/stripe_payment_service.dart';

class StripePaymentRepository {
    
     final stripePaymentService = StripePaymentService();

    Future<dynamic> makeCardPayment({
      required String amount,
      required String currency,
    }) async{
             try{
                    await stripePaymentService.makePayment(amount: amount, currency: currency);
                    return true;
             } on SocketException{
                 throw NoInternetException('');
             } on TimeoutException{
                 throw TimeoutException('');
             } catch(error){
                 throw GeneralException(error.toString());
             }
    }
    
}