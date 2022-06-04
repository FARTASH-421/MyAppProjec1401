import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_pojects/Profile/account_page.dart';
import '../Profile/icon_widget.dart';
import '../ShopButtonNavigator.dart';

class UploadPage extends StatelessWidget {
  BuildContext context;
  UploadPage({ required this.context,

    Key? key}) : super(key: key);
  PickedFile? _imageFile;
  final ImagePicker _piker = ImagePicker();
  static const keyDarkMode = 'key-dark-mode';
  String imagePath = "images/Profile.jpg";

  final Title= TextEditingController();
  final  nameSeller = TextEditingController();
  final urlImage= TextEditingController();
  final Price= TextEditingController();
  final color= TextEditingController();


  Widget _bulidLoge(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("Add Commodity",
            style: TextStyle(
              fontFamily: "Kurale",
              fontSize: MediaQuery.of(context).size.height/25,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }


  Widget _bulidContianer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30.0),),
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width *0.9,
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageProfile(),
                _bulidTitle(),
                _bulidNameSeller(),
                _bulidUrlImage(),
                _bulidPrice(),
                _bulidColor(),
                _bulidAdd(),
              ],
            ),

          ),
        ),
      ],
    );
  }

  Widget  _bulidTitle(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: Title,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText:"Title",
          labelStyle: TextStyle(
            fontFamily: "Kurale",
            color: Colors.black87
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orangeAccent,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
  Widget  _bulidUrlImage(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: urlImage,
        keyboardType: TextInputType.text,
        onChanged: (value){ },
        decoration: const InputDecoration(
          labelText:"url Image",
          labelStyle: TextStyle(
            fontFamily: "Kurale",
              color: Colors.black87
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
  Widget  _bulidPrice(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.visiblePassword,
        controller: Price,
        onChanged: (value){ },
        decoration: const InputDecoration(
          labelText:'Price',
          labelStyle: TextStyle(
            fontFamily: 'Kurale',
              color: Colors.black87
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
  Widget  _bulidColor(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        controller: color,
        onChanged: (value){ },
        decoration: const InputDecoration(
          labelText:"Color",
          labelStyle: TextStyle(
            fontFamily: "Kurale",
              color: Colors.black87
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
  Widget _bulidNameSeller(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.text,
        controller: nameSeller,
        onChanged: (value){},
        decoration: const InputDecoration(
          labelText:'nameSeller',
          labelStyle: TextStyle(
            fontFamily: "Kurale",
              color: Colors.black87
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),

        ),
      ),
    );
  }
  Widget _bulidAdd(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: FloatingActionButton(

            backgroundColor: Colors.orange,
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context){
                      return const ShopButtonNavigator();
                    }
                ),
              );
            },
            child: const Icon(Icons.playlist_add, color: Colors.black,size: 50,),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff2f3f7),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                  color:Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  )
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bulidLoge(),
              _bulidContianer(),
            ],
          )
        ],
      ),
      ),
  );
  }

  Widget imageProfile() => Center(
    child: Stack(
      children: [
        const CircleAvatar(
          radius: 100,
          // backgroundImage: imaage(),
        ),
        Positioned(
          bottom: 20.0,
          right: 14.0,
          child: InkWell(
            child: const IconWidget(
                icon: Icons.camera_alt, color: Colors.teal),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => buttonSheet()),
              );
            },
          ),
        ),
      ],
    ),
  );

  void takePhone(ImageSource source) async {
    try {
      final pickedFile = await _piker.getImage(source: source);
      if (pickedFile == null) return;
      // setState(() {
      //   _imageFile = pickedFile;
      // });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Widget buttonSheet() => Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Choose Profile Photo",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Kurale",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton.icon(
                onPressed: () {
                  takePhone(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Kurale",
                  ),
                )),
            FlatButton.icon(
                onPressed: () {
                  takePhone(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text(
                  "Image",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Kurale",
                  ),
                )),
          ],
        ),
      ],
    ),
  );


}
