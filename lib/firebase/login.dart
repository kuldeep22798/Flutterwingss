import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
class loginn extends StatefulWidget {
  const loginn({Key? key}) : super(key: key);

  @override
  _loginnState createState() => _loginnState();
}

class _loginnState extends State<loginn> {
  String data="";
  fetchFileData()async{
    String responseText;
    responseText =await rootBundle.loadString('text/firebase/glog.txt');
    setState(() {
      data=responseText;
    });
  }
  @override
  void initState() {
    fetchFileData();
    super.initState();
  }


  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notice"),
      content: Text("SignIn Successfuly"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late bool _success;
  late String _userEmail;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _signin() async {
    final User user = (await
    _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(child: Text("LogIn")),

        ),),
      body: SingleChildScrollView(scrollDirection:Axis.vertical ,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: (){},splashColor: Colors.teal,
                child: Card(elevation: 10,shadowColor: Colors.teal,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 400,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(scrollDirection:Axis.vertical ,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 100,width: 100,decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/loginn.gif"))),),
                            ),
                            SizedBox(height: 10,),
                            Text("LogIn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: _emailController,
                                // onSaved: (val) => _email = val!,
                                  validator: (val) => !val!.contains("@") ? "Invalid Email" : null,
                                  decoration: InputDecoration(suffixIcon: Icon(Icons.mail),
                                    border: OutlineInputBorder(),
                                    labelText: "Email",
                                    hintText: "Enter Valid Email",
                                  )
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 16,right: 16,),
                              child: TextFormField(
                                controller: _passwordController,
                                // onSaved: (val) => _password = val!,
                                validator: (val) => val!.length < 6 ? "Password Is Too Short" : null,
                                decoration: InputDecoration(
                                  // suffixIcon: GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       _obscureText = !_obscureText;
                                  //     });
                                  //   },
                                  //   child:
                                  //   Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                  // ),

                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                  hintText: "Enter Valid Password",
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            MaterialButton(onPressed: (){
                              if(_formKey.currentState!.validate()){
                                _signin();
                                showAlertDialog(context);
                              }

                            },
                              color: Colors.teal,child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,), Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(alignment: Alignment.topLeft,
                  child: Text("Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(data),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
