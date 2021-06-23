import 'package:flutter/material.dart';
import 'package:pay_flow/app/modules/home/home_controller.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controller = HomeController();
  final pages = [
    Container(child: Center(child: Text("Itens do menu",style: TextStyles.titleHome,))),
    Container(color: Colors.green,),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: 'Olá, ',
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(text: 'Ana.', style: TextStyles.titleBoldBackground,),
                    ],
                  ),
                ),
                subtitle: Text('Mantenha as suas contas em dia', style: TextStyles.captionShape,),
                trailing: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(image: NetworkImage('https://static.wixstatic.com/media/353a77_d1eb22a21b2247c49af2f68131fa842e~mv2.jpg'),fit:BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          )),
      body:pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          IconButton(onPressed: (){
             controller.setPage(0);
          },icon: Icon(Icons.home),color: AppColors.primary,),
          InkWell(
            onTap: (){
              
              },
            child: Container(height: 56,width: 56,decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(5)),
            child: Icon(Icons.add_box_outlined,color: AppColors.background,),),
          ),
          IconButton(onPressed: (){
             controller.setPage(1);
          },icon: Icon(Icons.description_outlined),color: AppColors.body,),
          
        ],),
      ),

    );
  }
}
