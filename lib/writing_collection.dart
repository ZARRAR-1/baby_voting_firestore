import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BabyName extends StatelessWidget {
  final String Name;
  final int votes;

  BabyName(this.Name, this.votes);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference names = FirebaseFirestore.instance.collection('BabyNames');

    Future<void> addBabyName() {
      // Call the user's CollectionReference to add a new user
      return names
          .add({
            'name': Name, // John Doe
            'votes': votes // 42
          })
          .then((documentSnapshot) =>
              print("Added Data with ID: ${documentSnapshot.id}"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addBabyName,
      child: const Text(
        "Add Baby Name",
      ),
    );
  }
}

void main()
{
   BabyName("Aliyaar", 0);
}
