import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/components.dart';

class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  Animation animation2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(duration:Duration(seconds: 2), vsync: this);
    animation=CurvedAnimation(parent: controller,curve:Curves.easeInOut );
    animation2=ColorTween(begin: Colors.red,end: Colors.amber).animate(controller);
    
    controller.forward();
    controller.addStatusListener((status) { if(animation.isCompleted){
    controller.reverse(from:1.0);}
    else if(animation.isDismissed)
      {
        controller.forward();
      }
    });

    controller.addListener(() { print(controller.value);
    setState(() {

    });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag:'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*80,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Rounded_button(title:'Login',colour: Colors.lightBlueAccent,onpress: () {
    Navigator.pushNamed(context, LoginScreen.id);
    //Go to registration screen.
    }, ),
            Rounded_button(title:'Register',colour: Colors.blueAccent,onpress: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
              //Go to registration screen.
            }, ),
          ],
        ),
      ),
    );
  }
}

