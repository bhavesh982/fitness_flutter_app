import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness_app/models/categoryModels.dart';
import 'package:fitness_app/models/dietModels.dart';

import '../models/popularModels.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories=[];
  List<DietModel> diets=[];
  List<PopularDietsModel> popularDiets=[];
  bool click=true;

  void getInitialInfo(){
    categories=CategoryModel.getCategories();
    diets=DietModel.getDiet();
    popularDiets=PopularDietsModel.getPopularDiets();
  }
  @override
  Widget build(BuildContext context) {
   getInitialInfo();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor:Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          _dietSection(),
          const SizedBox(
            height: 40,
          ),
          _popularSection()
        ],
      ),
    );
  }
  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20,bottom: 20),
              child: Text("Popular",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  itemBuilder: (context,index){
                return Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:
                    popularDiets[index].boxIsSelected
                        ?[
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0,10),
                        color: popularDiets[index].boxIsSelected
                            ? Colors.black.withOpacity(0.2):Colors.transparent
                      )
                    ]:[]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset(popularDiets[index].iconPath)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(popularDiets[index].name,
                              style: const TextStyle(
                                fontSize: 18
                              ),),
                              Text("${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}",
                              style: const TextStyle(
                                color: Colors.grey
                              ),)
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset("assets/search.svg",
                            ),
                          ))
                    ],
                  ),
                );
              }, separatorBuilder:(context,index)=>const SizedBox(height: 20,),
                  itemCount: popularDiets.length
              ),
            )
          ],
        );
  }

  Column  _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Recommendation\n For diet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  itemBuilder: (context,index){
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(diets[index].name,style: const TextStyle(
                            fontSize: 18,
                          ),),
                          Text("${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}",
                          style: const TextStyle(
                            color: Color(0xff929292)
                          ),),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected?const Color(0xff9fb2f9):Colors.transparent,
                              diets[index].viewIsSelected?const Color(0xff4693f8):Colors.transparent

                            ]
                          )
                        ),
                        child: Center(
                          child: Text("View",
                          style: TextStyle(
                            color: diets[index].viewIsSelected?Colors.white:Colors.purple,
                            fontSize: 16
                          ),),
                        ),
                      )
                    ],
                  ),
                );
              },
                  separatorBuilder: (context,index)=>const SizedBox(width: 20,),
                  itemCount: diets.length),
            )
          ],
        );
  }
  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Category",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                  separatorBuilder: (context,index)=>const SizedBox(width: 20,),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: categories[index].boxcolor.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width:50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconpath),
                        ),
                      ),
                      Text(categories[index].name)
                    ],
                  ),
                );
              }),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40.0,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Pancakes",
              hintStyle: const TextStyle(
                color: CupertinoColors.inactiveGray,
                fontStyle: FontStyle.italic
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const VerticalDivider(
                          color: Colors.black,
                          thickness: 0.5,
                          indent: 8,
                          endIndent: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/filter.svg',height: 30,),
                        ),

                      ]),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/search.svg',height: 30,),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(20)
            ),
          ),
        );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading:GestureDetector(
        onTap: (){

        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),

           color:const Color(0xfff2f2f2),
         ),
          child: SvgPicture.asset('assets/arrow.svg'),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            alignment: Alignment.center,
            width: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              color:const Color(0xfff2f2f2),
            ),
            child: SvgPicture.asset('assets/menu.svg'),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      title: const Text(
          "Fitness App",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),
      centerTitle: true,
    );
  }
}
