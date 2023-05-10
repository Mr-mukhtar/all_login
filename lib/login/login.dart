import 'package:all_login/home.dart';
import 'package:all_login/login/signIn.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool isSwitched = true;
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;



  void login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        isLoading = false;
        setState(() {});
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()
          ),
        );
      });
    }
  }
  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

      body:
      SingleChildScrollView(
        child: Stack(children: [
          Center(
            child: Container(width: 330,color: Colors.white10,
              child: Form(key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/img.png", height: 150,width: 350,),
                    const Text("LOGIN", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30, letterSpacing: 1.5
                    ),),
                    const SizedBox(height: 35,),


                    TextFormField(

                      controller: emailcontroller,
                      validator: (val) => !EmailValidator.validate(val!, true)
                          ? 'Not a valid email.'
                          : null,
                      // Validation for email

                      style: const TextStyle(color: Colors.deepPurple,
                          fontSize: 16),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black54
                              ),
                              borderRadius: BorderRadius.circular(12)
                          ),

                          hintText: "Email",
                          filled: true,

                          prefixIcon: Icon(Icons.email,
                            color: Colors.blue.shade900,)),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){
                        },
                      controller:passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText: showPassword ? false : true,
                      style: const TextStyle(color: Colors.deepPurple,
                          fontSize: 16),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black38),
                              borderRadius: BorderRadius.circular(12)
                          ),

                          hintText: "Password",
                          hintStyle: const TextStyle(
                          ),
                          prefixIcon: Icon(Icons.lock,color: Colors.blue.shade700,),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye,
                                color: Colors.blue.shade700)),
                      ),
                    ),
                    const SizedBox(height: 10,),
                     Row(
                      children: [
                       Switch(value: isSwitched,
                         onChanged: (value){
                         setState(() {
                           isSwitched = value;
                         });
                         },

                       ),
                        const Expanded(
                          child: Text('Remember me Already have account?',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height:30,),
                    OutlinedButton(
                      onPressed: () async{
                        login(context);
                      },
                      style: ButtonStyle(padding:
                      MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 80,
                          vertical: 15)),

                        backgroundColor: MaterialStateProperty.all(Colors.blue.shade600),
                        foregroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                          animationDuration: const Duration(seconds: 2)

                      ),
                      child: const Text("LOGIN",
                        style: TextStyle(color: Colors.white,
                          fontSize: 18,letterSpacing: 2
                        ),),),
                    const SizedBox(height: 15,),
                    const Text("OR", style: TextStyle(
                      fontSize: 20
                    ),),
                    const SizedBox(height: 15,),
                    const Text("Log in with",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20
                    ),),
                    const SizedBox(height: 15,),
                    Row(children: [
                      Expanded(
                        child: TextButton(onPressed: (){},
                          child: Image.asset("assets/google.png",
                            width: 50,height: 50,),),
                      ),

                      Expanded(
                        child: TextButton(onPressed: (){},
                          child: Image.asset("assets/apple.jpg",
                            width: 70,height: 70, ),),
                      ),

                      Expanded(
                        child: TextButton(onPressed: (){},
                          child: Image.asset("assets/facebook.png",
                             width: 50,height: 50,),),
                      ),


                    ],),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const Text("Don't have an account?",
                          style:  TextStyle(color: Colors.black,
                            fontSize: 17
                        ),),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (BuildContext context)=>const SignIn()
                              ));
                        },
                            child: const Text('Register Now',
                              style: TextStyle(
                                fontSize: 20
                            ),)),
                        const SizedBox(height: 20,)


                      ],
                    ),


                  ],
                ),
              ),),
          ),



        ],),
      ),
    );
  }
}
