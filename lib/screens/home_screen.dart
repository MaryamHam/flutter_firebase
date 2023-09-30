import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/screens/user_screen.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key,});

   

    var fnameController = TextEditingController();
    var lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    
    CollectionReference person = FirebaseFirestore.instance.collection("candidate");

         Future addPerson()  {
          return person.add({

            "firstName": fnameController.text, 
            "lastName": lnameController.text, 
            
             })
          .then((value) => print("Person Added"))
          .catchError((error) => print("Failed to add person"));
    }

          FirebaseFirestore.instance
            .collection('person')
            .snapshots(includeMetadataChanges: true);

    return SafeArea(
      child: Scaffold(
    
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: const Color.fromARGB(255, 67, 53, 13),),



        body: Container(
          
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
          
                Text("Add new person", style: TextStyle(color: const Color.fromARGB(255, 67, 53, 13),
                fontSize: 20,fontWeight: FontWeight.bold),),
          
                TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                   
                  ),
                ),
                 TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                   
                  ),
                ),
               
          SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 67, 53, 13))),
            onPressed: addPerson,
            child: Text(
              "Add Person",
            ),
                ),

                 SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 67, 53, 13))),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> GetUser()));
            },
            child: Text(
              "Show All",
            ),
                ),
            ],),
          )
      
        ),
    );
  }
}