import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/get_news_response_model.dart';
import 'package:news_app/widgets/page_view_widget.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController page = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  Dio dio = Dio();
  bool isLoading = true;

  // var response;
  GetNewsResponseModel? responseModel;
  // String language = "ml";

  getNews() async {
    var response = await dio.get(
        "https://gnews.io/api/v4/top-headlines?category=general&lang=ml&country=in&max=20&apikey=86605456ff13e69009d2b9d8a652a2c6",);
    // print(response.data['articles'][0]['title']);
    responseModel = GetNewsResponseModel.fromJson(response.data);
    // print(responseModel?.articles?[0].description);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.red, Colors.cyan])),
        ),
        backgroundColor: Colors.white70,
        leadingWidth: 150,
        leading: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.newspaper, color: Colors.white, size: 40),
              Text(
                "24 News",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        actions: [Icon(Icons.menu, color: Colors.white, size: 35)],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
        itemCount: responseModel!.articles!.length,
              controller: page,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => PageViewWidget(
                individualNews: responseModel!.articles![index],
              ),
            ),
    );
  }
}
