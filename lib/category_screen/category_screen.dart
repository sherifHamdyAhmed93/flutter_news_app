import 'package:flutter/material.dart';
import 'package:flutter_news_app/category_screen/card_item.dart';
import 'package:flutter_news_app/category_screen/tab_widget.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  static const String screenName = 'category_screen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          child: Image.asset('assets/images/pattern.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
          color: Colors.white,
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text('Sports',style: Theme.of(context).textTheme.titleMedium,),centerTitle: true,),
          body: Column(
            children: [
              TabWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return CardItem();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
