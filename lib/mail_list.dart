import 'package:flutter/material.dart';

class MailList extends StatefulWidget {
  const MailList({Key? key}) : super(key: key);

  @override
  _MailListState createState() => _MailListState();
}

class _MailListState extends State<MailList> {
  List<String> mails = [
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
    "mehmetyasinyel@hotmail.com",
  ];
  String text = "";

  @override
  void initState() {
    for (var i in mails) {
      text = text + i + " ";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamicHeight = MediaQuery.of(context).size.height;
    final dynamicWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            opacity: .6,
            image: AssetImage("assets/images/logo4.PNG"),
          )),
          child: Column(
            children: [
              ///AppBar
              Container(
                height: dynamicHeight * .09,
                color: Colors.grey[900],
                child: Row(
                  children: [
                    SizedBox(
                      width: dynamicWidth * .15,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "<",
                          style: TextStyle(
                            fontSize: dynamicHeight * .06,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dynamicWidth * .7,
                      child: Text(
                        "Mail Listesi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: dynamicHeight * .03,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dynamicWidth * .15,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: dynamicHeight * .05,
              ),

              ///Search Field
              SizedBox(
                width: dynamicWidth * .85,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(
                    constraints: BoxConstraints(maxHeight: 45),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: .5, color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Colors.white70)),
                    focusColor: Colors.white30,
                    hintStyle: TextStyle(color: Colors.white70),
                    hintText: "Şehir",
                    filled: true,
                  ),
                ),
              ),

              SizedBox(
                height: dynamicHeight * .05,
              ),

              Expanded(
                child: SizedBox(
                  height: dynamicHeight * .75,
                  child: SingleChildScrollView(
                      child: SizedBox(
                    width: dynamicWidth * .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          text,
                          style: TextStyle(
                            fontSize: dynamicHeight * .016,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
