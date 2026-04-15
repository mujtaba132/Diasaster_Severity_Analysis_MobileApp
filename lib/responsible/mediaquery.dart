import 'package:flutter/widgets.dart';

class Responsive {
     
      BuildContext context;
      Responsive(this.context);

    Size screenSize()
     {
         return MediaQuery.of(context).size;
     }

    double screenheight()
     {
         return MediaQuery.of(context).size.height;
     }

    double screenWidth()
     {
         return MediaQuery.of(context).size.width;
     }
}