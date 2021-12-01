import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/widgets/app_button_widget.dart';
import 'package:mchaat_web/core/widgets/input_widget.dart';
import 'package:mchaat_web/screens/home/home_screen.dart';
import 'package:mchaat_web/screens/login/components/slider_widget.dart';
import 'package:flutter/material.dart';
//janes code------
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:mchaat_web/screens/login/login_otp_verify.dart';
import 'package:mchaat_web/screens/login/utils/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Login extends StatefulWidget {
  Login({required this.title});
  final String title;

    
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  var tweenLeft = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  var _isMoved = false;

  bool isChecked = false;

  //jane code-----
       TextEditingController _email                   = TextEditingController();
        TextEditingController _password               = TextEditingController();

          TextEditingController _name                 = TextEditingController();
          TextEditingController _username             = TextEditingController();
          TextEditingController _number               = TextEditingController();
          TextEditingController _emailReg             = TextEditingController();
          TextEditingController _passwordReg          = TextEditingController();
          TextEditingController _ConfirmPassword      = TextEditingController();

           final GoogleSignIn googleSignIn = GoogleSignIn();
    
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  //janes code-------------------
     _SubmitLogin() async   {
      String email              = _email.text.trim();
      String password           = _password.text.trim();
     if(_email.text.isEmpty || _password.text.isEmpty) {
          Fluttertoast.showToast(
                        msg: "Pls. Fill-up required fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
     }else{
        try{  
           http.Response response =  await http.post(Uri.parse('https://hakdog.mchaat.com/api/web-login?email=' + email + "&password=" + password  ));
             if (response.statusCode == 200 && response.body != null) {
           dynamic jsonParsed = json.decode(response.body);
                  var PassCpNumber = jsonParsed['number'];                  
                       var route = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new ApiSetUpLoginVerify(numberCP:PassCpNumber), // assigned is "ShopID" while   _ShopID is the controller / content that we pass
                                    );
                                    Navigator.of(context).push(route);
                
                                
              }else{
                  
               dynamic jsonParsed = json.decode(response.body);         
                         Fluttertoast.showToast(
                            msg: jsonParsed['message'].toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
                
                }
  
                            
            }catch(err,stackrace){
              print(err);
              print(stackrace);
              
            } 
     }   
   
   }


    _SubmitRegistration() async   {
      String name               = _name.text.trim();
      String username           = _username.text.trim();
      String number             = _number.text.trim();
      String email              = _emailReg.text.trim();
      String password           = _passwordReg.text.trim();
      String confirmpassword    = _ConfirmPassword.text.trim();
     if(_name.text.isEmpty || _username.text.isEmpty || _number.text.isEmpty || _emailReg.text.isEmpty || _passwordReg.text.isEmpty || _ConfirmPassword.text.isEmpty) {
       
                 Fluttertoast.showToast(
                        msg: "Pls. Fill-up required fields",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 26.0
                    );
     }else{
        try{  
        // http.Response response =  await http.post(Uri.parse('https://hakdog.mchaat.com/api/web-register?name=' + name + "&username=" + username  + "&number=" + number  + "&email=" + email + "&password=" + password + "&password_confirmation=" + confirmpassword   ));
        // if (response.statusCode == 201 && response.body != null) {
           // dynamic jsonParsed = json.decode(response.body);
          var PassCpNumber = "09502757029"; // number;    
                   
                       var route = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new ApiSetUpLoginVerify(numberCP:PassCpNumber), // assigned is "ShopID" while   _ShopID is the controller / content that we pass
                                    );
                                    Navigator.of(context).push(route);
                //         print(response.statusCode);
                                
                // }else{
                //          dynamic jsonParsed = json.decode(response.body);         
                //          Fluttertoast.showToast(
                //             msg: jsonParsed['message'].toString(),
                //             toastLength: Toast.LENGTH_SHORT,
                //             gravity: ToastGravity.CENTER,
                //             timeInSecForIosWeb: 3,
                //             backgroundColor: Colors.red,
                //             textColor: Colors.white,
                //             fontSize: 16.0
                //           );
                
                // }
      
                            
     }catch(err,stackrace){
      // print(err);
      // print(stackrace);
                Fluttertoast.showToast(
                            msg: err.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
      
    }    
     } //close if condition for NULL
   
   }


   _SignInUsingGmailAcct() async   {
    bool res = await AuthProvider().loginWithGoogle();
                  if(!res){
                        Fluttertoast.showToast(
                            msg: "error logging in with google " ,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
                  }else{
                
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );

                 }


   }


   _CheckGmailAcct() async   {
    //  FirebaseApp firebaseApp = await Firebase.initializeApp();
    //  User? user = FirebaseAuth.instance.currentUser;

    // var currentUser = FirebaseAuth!.instance.currentUser();
            // if( !user){
            // // wrong call in wrong place!
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => HomeScreen()
            // ));
            // }

                  // if(!res){
                  //       Fluttertoast.showToast(
                  //           msg: "error logging in with google " ,
                  //           toastLength: Toast.LENGTH_SHORT,
                  //           gravity: ToastGravity.CENTER,
                  //           timeInSecForIosWeb: 3,
                  //           backgroundColor: Colors.red,
                  //           textColor: Colors.white,
                  //           fontSize: 16.0
                  //         );
                  // }else{
                
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => HomeScreen()),
                  //       );

                  // }


   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: SliderWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: bgColor,
                child: Center(
                  child: Card(
                    //elevation: 5,
                    color: bgColor,
                    child: Container(
                      padding: EdgeInsets.all(42),
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Image.asset("assets/logo/logo_icon.png", scale: 3),
                          SizedBox(height: 24.0),
                          //Flexible(
                          //  child: _loginScreen(context),
                          //),
                          Flexible(
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenRight),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _loginScreen(context),
                                      ]),
                                ),
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenLeft),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _registerScreen(context),
                                      ]),
                                ),
                              ],
                            ),
                          ),

                          //Flexible(
                          //  child: SlideTransition(
                          //    position: _animationController!.drive(tweenLeft),
                          //    child: Stack(
                          //        fit: StackFit.loose,
                          //        clipBehavior: Clip.none,
                          //        children: [
                          //          _registerScreen(context),
                          //        ]),
                          //  ),
                          //),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _registerScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Container(
                        
                          child: TextField(
                            controller: _name,
                            decoration: InputDecoration(
                                labelText: 'Name', border: OutlineInputBorder()),
                          )),
                SizedBox(height: 8.0),
               Container(
                    
                          child: TextField(
                            controller: _username,
                            decoration: InputDecoration(
                                labelText: 'Username', border: OutlineInputBorder()),
                          )),

                     Container(
                         
                          child: TextField(
                            controller: _number,
                            decoration: InputDecoration(
                                labelText: 'Number', border: OutlineInputBorder()),
                          )),

                          SizedBox(
                                height: 20,
                              ),

                              Container(
                      
                          child: TextField(
                            controller: _emailReg,
                            decoration: InputDecoration(
                                labelText: 'Email', border: OutlineInputBorder()),
                          )),


                           SizedBox(
                                height: 20,
                              ),

                              Container(
                       
                          child: TextField(
                            controller: _passwordReg,
                              obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password', border: OutlineInputBorder()),
                          )),
                          SizedBox(
                                height: 20,
                              ),

                              Container(
                      
                          child: TextField(
                            controller: _ConfirmPassword,
                              obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password', border: OutlineInputBorder()),
                          )),        
            // InputWidget(
            
            //   keyboardType: TextInputType.emailAddress,
            //   onSaved: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   onChanged: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   validator: (String? value) {
            //     return (value != null && value.contains('@'))
            //         ? 'Do not use the @ char.'
            //         : null;
            //   },

            //   topLabel: "Name",

            //   hintText: "Enter Name",
            //   // prefixIcon: FlutterIcons.chevron_left_fea,
            // ),
           
            // InputWidget(
            //   keyboardType: TextInputType.emailAddress,
            //   onSaved: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   onChanged: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   validator: (String? value) {
            //     return (value != null && value.contains('@'))
            //         ? 'Do not use the @ char.'
            //         : null;
            //   },

            //   topLabel: "Email",

            //   hintText: "Enter E-mail",
            //   // prefixIcon: FlutterIcons.chevron_left_fea,
            // ),
            SizedBox(height: 8.0),
            // InputWidget(
            //   topLabel: "Password",
            //   obscureText: true,
            //   hintText: "Enter Password",
            //   onSaved: (String? uPassword) {},
            //   onChanged: (String? value) {},
            //   validator: (String? value) {},
            // ),
            SizedBox(height: 24.0),
            AppButton(
              type: ButtonType.PRIMARY,
              text: "Sign Up",
              onPressed: _SubmitRegistration, 
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()),
              //   );
              // },
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me")
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign In",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _loginScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            
                    Container(
                      
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                                labelText: 'Email', border: OutlineInputBorder()),
                          )),

          
            // InputWidget(
           
              
            //   keyboardType: TextInputType.emailAddress,
            //   onSaved: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   onChanged: (String? value) {
            //     // This optional block of code can be used to run
            //     // code when the user saves the form.
            //   },
            //   validator: (String? value) {
            //     return (value != null && value.contains('@'))
            //         ? 'Do not use the @ char.'
            //         : null;
            //   },
          

            //   topLabel: "Email",

            //   hintText: "Enter E-mail",
            //   // prefixIcon: FlutterIcons.chevron_left_fea,
            // ),
            SizedBox(height: 8.0),
           
             Container(
                        
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password', border: OutlineInputBorder()),
                          )),
            // InputWidget(
            //   keyboardType: TextInputType.number,
            //   topLabel: "Password",
            //   obscureText: true,
            //   hintText: "Enter Password",
            //   onSaved: (String? uPassword) {},
            //   onChanged: (String? value) {},
            //   validator: (String? value) {},
              
            // ),
            
            //  ElevatedButton(
            //                     onPressed: _SubmitLogin, 
            //                   child: Text(
            //                         'LOGIN',
            //                         style: TextStyle(color: Colors.white),
            //                       ),
                              
            //                   ),

            SizedBox(height: 24.0),



        
            AppButton(
              
              type: ButtonType.PRIMARY,
              text: "Sign In",
                onPressed: _SubmitLogin, 
             
            ),

            SizedBox(height: 24.0),
        
            AppButton(
              type: ButtonType.PRIMARY,
              
              
              text: "Login with Google",
                 onPressed: _SignInUsingGmailAcct, 
             
            ),
            

             

            
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[

                    
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me")
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: greenColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign up",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
