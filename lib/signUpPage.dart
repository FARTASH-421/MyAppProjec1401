import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back,
          size: 20,
              color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height- 50,
            width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Sing Up",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 20,),
                  Text("Create an account, It's free",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700]),),
                ],
              ),
          Column(
            children: [
              inputFile("Username"),
              inputFile("Email"),
              inputFile("password"),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }

Widget  inputFile(label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.black87
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
         decoration: InputDecoration(
           contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(
               color: Colors.grey,
             ),
           ),
           border: OutlineInputBorder(
             borderSide: BorderSide(color: Colors.grey),
           )
         ),
        ),
        SizedBox(height: 10,),
      ],
    );
}
}
