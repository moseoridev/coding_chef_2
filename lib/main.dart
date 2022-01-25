import 'package:flutter/material.dart';
import 'package:coding_chef_2/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('image/chef.gif'),
                  width: 170,
                  height: 190,
                ),
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle:
                                  TextStyle(color: Colors.teal, fontSize: 15))),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration:
                                  InputDecoration(labelText: 'Enter Dice'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                                  InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ButtonTheme(
                                minWidth: 100,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.text == 'dice' &&
                                        controller2.text == '1234') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Dice()));
                                    } else if (controller.text == 'dice') {
                                      showSnackBar(context, '비밀번호를 다시 확인해주세요.');
                                    } else if (controller2.text == '1234') {
                                      showSnackBar(context, 'dice를 다시 확인해주세요.');
                                    } else {
                                      showSnackBar(
                                          context, '입력한 정보를 다시 확인해주세요.');
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.orangeAccent),
                                ))
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String snt) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(snt),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue),
  );
}
