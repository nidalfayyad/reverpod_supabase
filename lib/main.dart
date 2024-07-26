import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_subabase/models/quistions_model.dart';
import 'package:reverpod_subabase/view/quistion_page.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
//   const supabaseUrl = 'https://ybhoquboipamtbzvlqfr.supabase.co';
//   const supabaseKey =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InliaG9xdWJvaXBhbXRienZscWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4MDgzMjYsImV4cCI6MjAzNzM4NDMyNn0.JmKxJoPhW7kuNDWOLbaRItWETlP6RvSEzI6FXwcxWb4';
//   final supabase = SupabaseClient(supabaseUrl, supabaseKey);

//   // query data
//   final data = await supabase.from('quistions').select();
//   //print(data);
//   List<quistionmodel> products = [];

//   for (var i = 0; i < data.length; i++) {
//     quistionmodel product = quistionmodel.fromMap(data[i]);
//     products.add(product);
//   }
//   print("forloooooooop");
//   for (var i = 0; i < products.length; i++) {
//     print(products[i].quistion);
//   }

//   print("object");
// //  print(g);
//   // print("$products[0]");
//   print("22222222222222222222222222222222222222222222222");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
    );
  }
}

class Loginpage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  Loginpage({super.key});

  // get supabase => Supabase;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Emal:"),
          TextField(
            controller: email,
            onChanged: (value) {},
            decoration: InputDecoration(
              //prefix: Icon(Icons.account_box),
              hintText: 'Email',
              label: Icon(Icons.account_circle),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          InkWell(
              onTap: () async {
                const supabaseUrl = 'https://ybhoquboipamtbzvlqfr.supabase.co';
                const supabaseKey =
                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InliaG9xdWJvaXBhbXRienZscWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE4MDgzMjYsImV4cCI6MjAzNzM4NDMyNn0.JmKxJoPhW7kuNDWOLbaRItWETlP6RvSEzI6FXwcxWb4';
                final supabase = SupabaseClient(supabaseUrl, supabaseKey);

                // // query data
                final data = await supabase.from('users').select();
                print(data);
                print("object2222");
                print("${email.text}");
                print("wwwwwww");
                await supabase.from('users').insert([
                  {
                    'name': '${email.text}',
                    'emal': 'true',
                    'merred': false,
                    'pass': 'false',
                  },
                ]);
                print("dataنننننن");
                //    print(data);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => quistionpage(),
                    ));
              },
              child: Icon(Icons.send)),
        ],
      ),
    );
  }
}
