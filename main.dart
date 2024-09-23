import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void incremento() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                isFull ? 'Lotado' : 'pode entrar',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white ,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  count.toString(),
                  style:  TextStyle(
                    fontSize: 100,
                    color: isFull ? Colors.redAccent[700] : Colors.white,
                  ),
                ),
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                        fixedSize: const Size(120, 120),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )

                    ),
                    child: Text(
                      'saiu',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 32,),
                  TextButton(
                    onPressed: isFull ? null : incremento,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                        fixedSize: const Size(120, 120),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    child: Text(
                      'entrou',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
