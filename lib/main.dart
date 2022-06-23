// import 'package:circle_main/login_pages/main_page.dart';
import 'package:FitKitApp2/splash_screen_widgets/splash_screen.dart';
import 'package:FitKitApp2/splash_screen_widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import './theme/theme_control.dart';
import './theme/theme.dart';
import 'profile/profile_screen.dart';
import './Welcome/welcome_screen.dart';
import 'tabs/tabs.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
    themeChangeProvider.darkTheme = false;
  }
  final storage=new FlutterSecureStorage();
  Future<bool> checkloginStatus()async{
   String? value= await storage.read(key: "uid");
   if(value==null)
   {
     return false;
   }
   else{
     return true;
   }
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      // child: Consumer<DarkThemeProvider>(
      //   builder: (BuildContext context, value, Widget? child) {
        child: 
           MaterialApp(
              // theme: Styles.themeData()
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home:  FutureBuilder(
                  future: checkloginStatus(),
                  builder: (BuildContext, AsyncSnapshot<bool>snapshot){
                  if(snapshot.data==false)
                  {
                    print('we are here');
                     return WelcomeScreen();
                  }
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Container(
                      color: Colors.white,
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                   return  Tabs(); //add main page here
                } ,) ,//SplashScreen(),
              //home: ContactSuggestion(),
              // home: MainPage(),
              // home: ChatPage(),

    )
        // },
      );
    
  }
}
