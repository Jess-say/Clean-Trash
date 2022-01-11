import 'dart:convert';

import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info=json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
            padding: const EdgeInsets.only(top:70, left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 30,
                            color:color.AppColor.homepageText,
                            fontWeight: FontWeight.w700
                        )
                    )
                  ],
                ),
                SizedBox(height:30),
                Row(
                  children: [
                    Text(
                        "Jane Doe",
                        style: TextStyle(
                          fontSize: 50,
                          color: color.AppColor.nameText,
                          fontWeight: FontWeight.w900,
                        )
                    )
                  ],
                ),
                SizedBox(height:30),
                Row(
                    children: [
                      Text(
                          "What do you want to recycle?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color:color.AppColor.homepageText
                          )
                      )
                    ]
                ),
                Expanded(child: ListView.builder(
                    itemCount: (info.length.toDouble()/3).toInt(),
                    itemBuilder: (_, i){
                      int a = i; // 0,1
                      int b = (2*i)+2; // 2,4
                      int c = (2*i)+3; // 3,5
                      return Row(
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(right: 10,bottom:15),
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:AssetImage(
                                          info[a]['img']
                                      )
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    ),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    )
                                  ]
                              ),
                              child: Center(
                                  child:Align(
                                      alignment: Alignment.bottomCenter,
                                      child:Text(
                                          info[a]["title"],
                                          style:TextStyle(
                                              fontSize: 20,
                                              color:Colors.black
                                          )
                                      )
                                  )
                              )
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(right: 10,bottom:15),
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:AssetImage(
                                          info[b]['img']
                                      )
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    ),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    )
                                  ]
                              ),
                              child: Center(
                                  child:Align(
                                      alignment: Alignment.bottomCenter,
                                      child:Text(
                                          info[b]["title"],
                                          style:TextStyle(
                                              fontSize: 20,
                                              color:Colors.black
                                          )
                                      )
                                  )
                              )
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(right: 10,bottom:15),
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:AssetImage(
                                          info[c]['img']
                                      )
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    ),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: color.AppColor.boxShadowBackground.withOpacity(0.5)
                                    )
                                  ]
                              ),
                              child: Center(
                                  child:Align(
                                      alignment: Alignment.bottomCenter,
                                      child:Text(
                                          info[c]["title"],
                                          style:TextStyle(
                                              fontSize: 20,
                                              color:Colors.black
                                          )
                                      )
                                  )
                              )
                          )
                        ],
                      );
                    }))

              ],
            )
        )
    );
  }
}