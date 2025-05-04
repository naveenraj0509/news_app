import 'package:flutter/material.dart';
import 'package:news_app/fullpage.dart';
import 'package:news_app/models/get_news_response_model.dart';
import 'dart:convert';

class PageViewWidget extends StatefulWidget {
  final Article individualNews;

  const PageViewWidget(
      {super.key, required this.individualNews,
      });

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  TextEditingController controller = TextEditingController();
  bool isReadMore=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                ),

                Text(
                  widget.individualNews.title??"",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(widget.individualNews.image??""),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.individualNews.publishedAt.toString() ,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Published by ',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  widget.individualNews.source!.name.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 15),
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.individualNews.content??"",
                      maxLines:isReadMore?null:2,
                      overflow: isReadMore?TextOverflow.visible:TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                   setState(() {
                     isReadMore=!isReadMore;
                   });
                  },
                  child: Text(
                    !isReadMore?'Read More':"Show Less",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
