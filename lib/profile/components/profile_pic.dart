import 'dart:io';
import 'package:FitKitApp2/login_page_widgets/pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ProfilePic extends StatefulWidget {
  const ProfilePic({ Key? key }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final storage =new FlutterSecureStorage();
  File? image;
  String? url; 
   AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  Future pickImage(ImageSource source) async{
    try{
    final image= await ImagePicker().pickImage(source: source);
   
   
    print(image.toString());
    if(image==null)return;
    
    final imageTemporary= File(image.path);
     setState(() {
       this.image= imageTemporary;
     }); 
    }  on PlatformException catch(e){
      print('Failed to pick image : $e');
    }
  }
  Future clearimage() async{
    setState(() {
      image = null;
    });
  }
  // Future<void> _readAll() async {
  //   final all = await storage.readAll(
  //    aOptions: _getAndroidOptions());
  //   setState(() {
  //     url = all.entries
  //         .map((entry) => url('PhotoUrl', entry.value))
  //         .toList(growable: false);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          
             Column(
               
              children: [
                Spacer(),
                image!=null?
                ClipOval(
                  child:
                Image.file(
                  image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                 
             )):Icon(Icons.person,
             size: 100,
             color: Colors.purple,
             ),

              ],

          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.purple,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  _bottomsheet(context);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
  

_bottomsheet(context){
  showModalBottomSheet(
    context: context,
    builder: (BuildContext c){
      return Container(
        // height: 150,
        child:Wrap(
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
            child:
             Text('Profile Photo',
             style: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold,
               
             ),
             
             ),
             
            ),
            IconButton(onPressed: (){
            if(image!=null){
            clearimage();
            Fluttertoast.showToast(msg: "Profile Pic Deleted");
              }
              else{
                Fluttertoast.showToast(msg: "No Profile Pic");

              }
              }, icon:Icon( Icons.delete),
            ),
            Divider(height: 2.0,),
            ListTile(
             leading: TextButton(
              
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.purple,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: (){ 
                  pickImage(ImageSource.camera);

                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
              title: Text('camera'),
            ),
            ListTile(
             leading: TextButton(
              
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.purple,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);

                },
                child: Icon(Icons.image),
                  
                
              ),
              title: Text('Gallery'),
            )
          ]
        )
      );
    
  }
  );
}
}