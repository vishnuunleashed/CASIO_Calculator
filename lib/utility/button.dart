import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final dynamic text;
  final Function callback;

  MyButton({this.text,this.callback});


  @override
  Widget build(BuildContext context){
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.deepPurpleAccent[100],
        onTap: callback,
        child: Container(
          height: 70,
          width: 70,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 30

              ),
            ),

          ),
        ),

      ),
    );
  }
}