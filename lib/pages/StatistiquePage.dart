import 'package:flutter/material.dart';
import 'package:projet_controle/pages/Propos.dart';
import 'package:projet_controle/pages/todolist_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;


  final List<Widget> _pages = [
    HomePage(),
    TodoList(),
    Propos(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("STATISTIQUES", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(

                  child: Image.asset(
                    'assets/home_pick.jpg',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    child: SizedBox(
                      width: 500,
                      height: 200,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nombre total de tâches:',
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                            Text('Tâches non commencées: ',
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                            Text('Tâches en cours: ',
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                            Text('Tâches terminées:',
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TodoList())
                      );
                    },
                    child: Text("data")
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Statistiques'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_rounded),
              label: 'TodoList'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'A Propos'
          ),
        ],
      ),

    );
  }
}