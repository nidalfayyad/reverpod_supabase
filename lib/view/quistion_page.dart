import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_subabase/main.dart';
import 'package:reverpod_subabase/models/quistions_model.dart';
import 'package:reverpod_subabase/providers/used_provider.dart';
import 'package:reverpod_subabase/serveces/quistion_services.dart';

final osan = Provider<quistionservices>((ref) {
  return quistionservices();
});
final quistionprovider = FutureProvider<List<quistionmodel>>((ref) {
  return ref.read(osan).getquistion();
});

class quistionpage extends ConsumerWidget {
  quistionpage({super.key});
  PageController controller = PageController();
  bool selectitme = false;
  List<String> answer = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quistionprovider1 = ref.watch(quistionprovider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Quistins"),
        ),
        body: quistionprovider1.when(data: (data) {
          return PageView.builder(
            controller: controller,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Scaffold(
                body: Container(
                  color: Color.fromARGB(255, 230, 120, 215),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          data[index].quistion,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, ind) {
                            return ListTile(
                              title: InkWell(
                                  onTap: () {
                                    print("hloooooooooo");
                                    print("count11 is ");
                                    selectitme = true;
                                    controller.nextPage(
                                        duration: Duration(seconds: 2),
                                        curve: Curves.bounceOut);
                                    // print(snapshot.data!.length);
                                    print(
                                        "-------------------------------------");
                                    print(data[index].id);
                                    if ((data[index].id) as int > 10) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Loginpage(),
                                          ));
                                    }
                                    print("result is ");
                                  },
                                  child: InkWell(
                                    child: Container(
                                      color: Colors.blue,
                                      child: Text(
                                        (ind + 1).toString() + answer[ind],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          // return ListView.builder(
          //   itemCount: data.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       subtitle: Text(data[index].id.toString()),
          //       title: Text(data[index].quistion),
          //       leading: Text(data[index].gende.toString()),
          //     );
          //   },
          // );
        }, error: (error, StackTrace) {
          return Text(error.toString());
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
