import 'package:flutter/material.dart';
import 'package:news_app/widgets/page_view_widget.dart';

import 'homepage.dart';
import 'models/get_news_response_model.dart';

class FullPage extends StatefulWidget {
  final Article individualNews;
  const FullPage({
    super.key,
    required this.individualNews,
  });

  @override
  State<FullPage> createState() => _FullPageState();
}

   class _FullPageState extends State<FullPage> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leadingWidth: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.red, Colors.cyan])),
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(),
              ),
            );
          },
          child: Row(
            children: [
              const Text(
                'Done',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.purple, Colors.lightGreen, Colors.yellow],
          ),
        ),
        child: PageViewWidget(individualNews: widget.individualNews),
      ),
    );
  }
}
