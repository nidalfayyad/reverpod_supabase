import 'dart:js_interop';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_subabase/models/quistions_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class quistionservices {
  String supabaseUrl = 'https://ybhoquboipamtbzvlqfr.supabase.co';
  String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InliaG9xdWJvaXBhbXRienZscWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4MDgzMjYsImV4cCI6MjAzNzM4NDMyNn0.JmKxJoPhW7kuNDWOLbaRItWETlP6RvSEzI6FXwcxWb4';

  Future<List<quistionmodel>> getquistion() async {
    try {
      const supabaseUrl = 'https://ybhoquboipamtbzvlqfr.supabase.co';
      const supabaseKey =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InliaG9xdWJvaXBhbXRienZscWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4MDgzMjYsImV4cCI6MjAzNzM4NDMyNn0.JmKxJoPhW7kuNDWOLbaRItWETlP6RvSEzI6FXwcxWb4';
      final supabase = SupabaseClient(supabaseUrl, supabaseKey);

      // query data
      final data = await supabase.from('quistions').select();
      //print(data);
      List<quistionmodel> products = [];

      for (var i = 0; i < data.length; i++) {
        quistionmodel product = quistionmodel.fromMap(data[i]);
        products.add(product);
      }
      print("forloooooooop");
      for (var i = 0; i < products.length; i++) {
        print(products[i].quistion);
      }

      print("object");
//  print(g);
      // print("$products[0]");
      print("22222222222222222222222222222222222222222222222");

      //print(data);
      // List<quistionmodel> products = [];

      // for (var i = 0; i < data.length; i++) {
      //   quistionmodel product = quistionmodel.fromMap(data[i]);
      //   products.add(product);
      // }
      // String g = products[0].quistion;
      print("object");
      print(data);
      return products;
      // print("$products[0]");
      // print("22222222222222222222222222222222222222222222222");

      // if () {
      //   return CarModel.fromMap(data[]);
      // } else {
      //   throw Exception('This is Not 200');
      // }
    } catch (e) {
      throw e;
    }
  }
}
