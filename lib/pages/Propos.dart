import 'package:flutter/material.dart';
import 'package:projet_controle/pages/StatistiquePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Propos(),
    );
  }
}

class Propos extends StatefulWidget {
  const Propos({super.key});

  @override
  State<Propos> createState() => _ProposState();
}

class _ProposState extends State<Propos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("A PROPOS", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Center(child: Text("Description du projet", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 200,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TO DO APP",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Il s'agit d'une TO DO APP disposant de: \n - Ajout de tâches\n - Suppression de taches\n - Commencer ou finir une tâche\n - Modifier une tâche\n - Voir les détails d'unr tâche",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(child: Text("Membres de l'équipe", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 120,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor : Colors.grey,
                              radius:30.0,
                              child : Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ADOUMASSE Ortniel",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Nous avons tous contribué\n au travail de groupe",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 120,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor : Colors.grey,
                              radius:30.0,
                              child : Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("AZOKLY Arix",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Nous avons tous contribué\n au travail de groupe",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 120,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor : Colors.grey,
                              radius:30.0,
                              child : Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DJODJOKOUTON Daril",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Nous avons tous contribué\n au travail de groupe",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 120,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor : Colors.grey,
                              radius:30.0,
                              child : Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DOMINGO Isidora",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Nous avons tous contribué\n au travail de groupe",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child:  SizedBox(
                  width: 220,
                  height: 120,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor : Colors.grey,
                              radius:30.0,
                              child : Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HOUNKPONOU Floriane",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(height:10,),
                            Text("Nous avons tous contribué\n au travail de groupe",style: TextStyle(color: Colors.black, fontSize: 15, ),),
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } , child: Text("Allez"))

          ]
      ),
    );
  }
}