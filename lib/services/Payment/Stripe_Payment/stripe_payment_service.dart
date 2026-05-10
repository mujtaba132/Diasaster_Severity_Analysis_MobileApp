import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fyp_project/services/Payment/Stripe_Payment/keys.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/data/networks/network_services_api.dart';

class StripePaymentService {

   final NetworkServicesApi networkServicesApi = NetworkServicesApi();

   static Future<void> init() async {
    Stripe.publishableKey = StripeKey.publishable_key;
    await Stripe.instance.applySettings();
  }
    
   Future<dynamic> makePayment({
        required String amount,
        required String currency,
    }) async{
          
          try{
               
                   final paymentIntent =  await createPaymentIntent(
                    amount : amount,
                    currency: currency,
                   );

                   print(paymentIntent);

                   await Stripe.instance.initPaymentSheet(
                    paymentSheetParameters: 
                    SetupPaymentSheetParameters(
                      merchantDisplayName: 'Donation',
                      paymentIntentClientSecret:paymentIntent['client_secret']
                    ));
                  print("Sheet Intailized Successfully!..");
                   await Stripe.instance.presentPaymentSheet();
       
                  return true;

          }
          catch(error){
              throw GeneralException(error.toString());
          }
    } 


   Future<dynamic> createPaymentIntent({required String amount,required String currency}) async{
           
        final body =  {
            'amount' : (double.parse(amount) * 100).toInt().toString(),
            'currency' : currency,
            'payment_method_types[]' : 'card',
        };
       
      print(body);
       final header =  {
        'Authorization':
            'Bearer ${StripeKey.secret_key}',
        'Content-Type': 
            'application/x-www-form-urlencoded',
      };
      print(header);   
      try{
         final response = await networkServicesApi.postAPI(
        'https://api.stripe.com/v1/payment_intents', 
        body, 
        header);

     print(response);
      return response;
      } catch(e){
        throw GeneralException(e.toString());
      }
   }
}