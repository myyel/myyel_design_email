import 'package:flutter/material.dart';
import 'package:myyel_design_email/main_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String text = "";
  final TextEditingController _textEditingController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      home: GestureDetector(
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
                  flex: 11,
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
                          child: TextFormField(
                            controller: _textEditingController,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(maxHeight: 45),
                              focusedBorder: InputBorder.none,
                              focusColor: Colors.white30,
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(color: Colors.white30),
                              hintText: "Email",
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => const Color(0xff88623d)),
                          ),
                          onPressed: () {
                            MainViewModel()
                                .sendMail(_textEditingController.text, context);
                            _textEditingController.clear();
                          },
                          child: const Text(
                            "Gönder",
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
                  child: Text(
                    text,
                    style: const TextStyle(color: Color(0xfff0e3d3)),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Mail Düzenle",
                            style: TextStyle(color: Color(0xfff0e3d3)),
                          )),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Mail Listesi",
                          style: TextStyle(color: Color(0xfff0e3d3)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
