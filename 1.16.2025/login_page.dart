import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // เพิ่ม Key สำหรับ Form
  final TextEditingController _usernameController = TextEditingController(); // เปลี่ยนจาก TextEditingValue เป็น TextEditingController
  final TextEditingController _passwordController = TextEditingController(); // เช่นเดียวกัน

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKey<NavigatorState>(), // เพิ่ม Key สำหรับ Navigator
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black87,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // ระบุค่า padding
                child: Form(
                  key: _formKey, // กำหนด Form Key
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.rmutt.ac.th/wp-content/uploads/2023/01/20210202-logo-RMUTT-News-1024x341.png',
                            width: 400, // กำหนดความกว้างของภาพ
                              ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                           controller: _usernameController,
                            decoration: const InputDecoration(
                             labelText: "Username",
                              ),
                            validator: (value) {
                            if (value!.isEmpty) {
                            return "Please enter your username!!!";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _passwordController,
                        obscureText: true,
                        decoration:  const InputDecoration(labelText: "Password"),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your password!!!!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24,),
                      ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()) {}
                      }, child: Text("Login")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
