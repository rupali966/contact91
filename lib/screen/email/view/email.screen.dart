import 'package:contactthree/widget/component/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController to = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController bcc = TextEditingController();
  TextEditingController sub = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String eml = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Sent"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              txt(str: "New message", size: 18),
              S(h: 20),
              txtfild(hintStr: "To", cntr: to),
              txtfild(hintStr: "Bcc", cntr: bcc),
              txtfild(hintStr: "Subject", cntr: sub),
              txtfild(hintStr: "Body", height: 15, cntr: body),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("Sent"),
                      onPressed: () async {
                        SnackBar snackbar = SnackBar(
                          content: Text("Sending ...."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        final Email email = Email(
                          body: '${body.text.toString()}',
                          subject: '${sub.text.toString()}',
                          cc: ['${body.text.toString()}'],
                          bcc: ['${bcc.text.toString()}'],
                          isHTML: false,
                        );
                        await FlutterEmailSender.send(email);
                        // emailto(
                        //     email: eml,
                        //     subject: "Scaibu"
                        // );
                      },
                    ),
                    S(w: 10),
                    ElevatedButton(
                      child: Text("Save"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
