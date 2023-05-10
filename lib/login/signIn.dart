import 'package:all_login/login/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final  firstnamecontroller = TextEditingController();
  final  lastnamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final password1controller = TextEditingController();
  final password2controller = TextEditingController();
  bool showpassword = false;
  bool showpassword2 = false;

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  // Sign In Function
  void sign(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        isLoading = false;
        setState(() {});
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage(),
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: SizedBox(width: 330,
                child:Form(key: _formKey,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/img_1.png", height: 120,),
                      const SizedBox(height: 10,),
                      const Text("SIGNIN", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30, letterSpacing: 1.5
                      ),),
                      const SizedBox(height: 35,),
                      TextFormField(
                        onChanged: (value){},
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,

                        validator: (value) =>
                        !EmailValidator.validate(value!, true)
                            ? 'Not a valid email.'
                            : null,
                        style: const TextStyle(color: Colors.deepPurple,
                            fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),

                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,
                              color: Colors.blue.shade900,)),

                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value){},
                        controller: firstnamecontroller,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'please enter your first name';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.deepPurple,
                            fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),

                            hintText: "First Name",

                            prefixIcon: Icon(Icons.person,
                              color: Colors.blue.shade900,)),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value){},
                        controller: lastnamecontroller,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'please enter your first name';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.deepPurple,
                            fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),

                            hintText: "Last Name",

                            prefixIcon: Icon(Icons.person,
                              color: Colors.blue.shade900,)),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value){
                          },obscureText: showpassword? false :true,
                        controller: password1controller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.deepPurple,
                            fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            filled: true,

                            hintText: "Password",


                            prefixIcon: Icon(Icons.lock,
                              color: Colors.blue.shade900,),

                            suffixIcon: InkWell(
                              onTap: (){
                              setState(() {
                                showpassword = !showpassword;
                              });
                            },
                              child: Icon(showpassword?
                                  Icons.visibility_off:
                                Icons.remove_red_eye,
                                color: Colors.blue.shade900,),
                            )
                        ),


                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value){},
                        controller: password2controller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm Password';
                          }else
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }else if (value != password1controller.text) {
                            return 'Password do not match';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.deepPurple,
                            fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38
                                ),
                                borderRadius: BorderRadius.circular(12),
                            ),

                            hintText: "Confirm Password",

                            prefixIcon: Icon(Icons.lock,
                              color: Colors.blue.shade900,),

                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  showpassword2 = !showpassword2;
                                });
                              },
                              child: Icon(showpassword2?
                              Icons.visibility_off:
                              Icons.remove_red_eye,
                                color: Colors.blue.shade900,),
                            )
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async{
                          sign(context);
                        },
                        style: ButtonStyle(padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 60,
                            vertical: 15)),
                          backgroundColor: MaterialStateProperty.all(Colors.blue.shade600),
                          foregroundColor: MaterialStateProperty.all(Colors.pinkAccent),

                        ),
                        child: const Text("SIGN UP",
                          style: TextStyle(color: Colors.white,
                              fontSize: 18,letterSpacing: 2,
                          ),),
                      ),
                      const SizedBox(height: 40,),
                      Row(children: [
                        const Text("Already have a account?",
                        style: TextStyle(
                          fontSize: 20
                        ),),
                        TextButton(onPressed: () {

                        },
                            child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 20
                              ),))
                      ],)
              ],),
                ) ,),
            )

          ],
        ),
      ),
    );
  }
}
