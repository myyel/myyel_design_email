import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myyel_design_email/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

import 'views/mail_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailTextEditingController =
      TextEditingController();
  final TextEditingController _cityTextEditingController =
      TextEditingController();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
    return StreamProvider(
      create: (_) =>
          FirebaseFirestore.instance.collection("mailData").snapshots(),
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Beklenmeyen bir hata oluştu"),
              );
            } else if (snapshot.hasData) {
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                  body: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        opacity: .6,
                        image: AssetImage("assets/images/logo3.PNG"),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 9,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _mailTextEditingController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        decoration: const InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 45),
                                          focusedBorder: InputBorder.none,
                                          focusColor: Colors.white30,
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.white30),
                                          hintText: "Email",
                                          filled: true,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _cityTextEditingController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        decoration: const InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 45),
                                          focusedBorder: InputBorder.none,
                                          focusColor: Colors.white30,
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.white30),
                                          hintText: "Şehir",
                                          filled: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: 85,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) =>
                                                const Color(0xff88623d)),
                                  ),
                                  onPressed: () {
                                    MainViewModel().addMailAddress(
                                      _mailTextEditingController.text,
                                      _cityTextEditingController.text,
                                    );
                                    _mailTextEditingController.clear();
                                    _cityTextEditingController.clear();
                                  },
                                  child: const Text(
                                    "Ekle",
                                    style: TextStyle(
                                      color: Color(0xfff0e3d3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MailList()));
                            },
                            child: const Text(
                              "Mail Listesi",
                              style: const TextStyle(color: Color(0xfff0e3d3)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
