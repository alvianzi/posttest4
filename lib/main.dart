// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameNess',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String username = "", email = '';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { unknown, Pria, Wanita }

class _MyHomePageState extends State<MyHomePage> {
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  Gender gender = Gender.unknown;

  bool priv = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }

  String getGender(Gender? value) {
    if (value == Gender.Pria) {
      return "Pria";
    } else if (value == Gender.Wanita) {
      return "Wanita";
    }
    return "Tidak Bergender";
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Email',
        labelText: "Isi Email Anda");
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 235, 64, 12),
      appBar: AppBar(
        title: Text("GameNess"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 241, 245, 7),
                Color.fromARGB(255, 241, 207, 10)
              ],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.topLeft,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/GameNess.jpg',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: usernameCtrl,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Center(child: Text('USERNAME')),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailCtrl,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Center(child: Text('EMAIL')),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Laki-Laki"),
                      leading: Radio(
                        groupValue: gender,
                        value: Gender.Pria,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Wanita"),
                      leading: Radio(
                        groupValue: gender,
                        value: Gender.Wanita,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text("Setuju dengan Kebijakan dari GameNess.com"),
                leading: Checkbox(
                  value: priv,
                  onChanged: (bool? value) {
                    setState(() {
                      priv = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                MyHomePage.username = usernameCtrl.text;
                MyHomePage.email = emailCtrl.text;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const YourApp()),
              );
            },
            child: const Text("Sumbit"),
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Color.fromARGB(255, 243, 219, 5)),
        child: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                child: new DrawerHeader(child: new CircleAvatar()),
                //  decoration: BoxDecoration(
                //    image: DecorationImage(
                //      image: AssetImage("assets/GameNess"),
                //      ),
                //      ),

                color: Color.fromARGB(255, 204, 243, 30),
              ),
              new Container(
                color: Color.fromARGB(255, 246, 250, 9),
                child: new Column(
                  children: new List.generate(1, (int index) {
                    return new ListTile(
                      title: Text('Home'),
                      trailing: Icon(Icons.arrow_right),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: 1080,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 253, 236, 4),
                Color.fromARGB(255, 241, 245, 3)
              ],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.topLeft,
            ),
          ),
          child: Text(
            'Copyright By @alvianusnestha/191502062',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 8, 8, 8),
              fontSize: 15,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class YourApp extends StatefulWidget {
  const YourApp({Key? key}) : super(key: key);

  @override
  State<YourApp> createState() => _YourAppState();
}

class _YourAppState extends State<YourApp> {
  @override
  Widget build(BuildContext context) {
    var username = MyHomePage.username;
    var email = MyHomePage.email;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 235, 64, 12),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/GameNess.jpg',
              ),
            ),
          ),
          Center(
            child: Text(
                'Selamat Datang Kesatria $username Anda Telah memasuki Arena fantasi Kota Alianzi'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("KEMBALI"),
            ),
          ),
        ],
      ),
    );
  }
}
