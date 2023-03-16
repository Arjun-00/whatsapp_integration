import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? phonenumber;
  String? message;
  String contryCode = "91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp MSG"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40,right: 40),
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value){
                phonenumber = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "PHONE NUMBER",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 18,),
            TextField(
              minLines: 7,
              maxLines: 10,
              onChanged: (value){
                message = value;
              },
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "MESSAGE",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 18,),
            ElevatedButton(
                onPressed: () async{
                  final Uri urls =  Uri.parse('https://wa.me/91$phonenumber?text=$message');
                  // await canLaunchUrl(urls) ? await launchUrl(urls)
                  //     : throw "not process";
                  if (!await launchUrl(urls)) {
                    throw Exception('Could not launch $urls');
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child: Text("SEND"))
            ),
          ],
        ),
      ),
    );
  }
}
