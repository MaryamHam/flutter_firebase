import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUser extends StatefulWidget {
  const GetUser({super.key});

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {


  Future getDocuments() async {

    CollectionReference person = FirebaseFirestore.instance.collection("candidate");

    QuerySnapshot querySnapshot = await person.get();
    return querySnapshot.docs;
}

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
          backgroundColor: const Color.fromARGB(255, 67, 53, 13),),

body: FutureBuilder(
        future: getDocuments(),
        builder: (context,snapshot) {
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); 
    
          }
    
          if (snapshot.hasError) {
            return Text('Error');
          }
  
          List<DocumentSnapshot> documents = snapshot.data!;
          return Container(
            margin: EdgeInsets.all(10),
    
            child:ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context,index) { 
    
                    return Card(
    
                      color:Color.fromARGB(255, 183, 178, 162) ,
                      child: ListTile(
                        title: Text(documents[index]['firstName'], 
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 67, 53, 13) ),),
                        subtitle: Text(documents[index]['lastName'],
                        style: TextStyle(fontSize: 14,
                        color: const Color.fromARGB(255, 67, 53, 13) ),),
    
                      ),
    
                    );
    
                  },
    
                ),
          );
    
        },
    
      ),

    );
  }
}