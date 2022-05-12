import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MainViewModel {
  Future sendMail(String mailAddress, BuildContext context) async {
    const email = "info@myyeldesign.com";
    const String image =
        "https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/10019203/10019203-ad0484-1650x1650.jpg";

    final smtpServer = SmtpServer(
      "smtpout.secureserver.net",
      username: "info@myyeldesign.com",
      password: "mehmet1987",
      port: 587,
    );
    final message = Message()
      ..from = const Address(email, "Myyel Design")
      ..recipients = [mailAddress]
      ..subject = "Merhaba"
      ..html = "<h1>Deneme</h1>"
          "<img src='{$image}' width='200' data-imageType='jpeg'/>"
          "<a>myyeldesign.com</a>"
      ..text = "Deneme";

    try {
      await send(message, smtpServer);
    } on MailerException catch (e) {
      print(e);
    }
  }
}
