import 'package:flutter/material.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/screens/pets/add-pet/add_pet_form.dart';
import 'package:pet_app/services/pets/pets_service.dart';
import 'package:pet_app/services/services.dart';

class AddPetPage extends StatefulWidget {
  static final routeName = '/add-pet';

  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final PetsService _petsService = services.get<PetsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pet"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AddPetForm(
              addPetHandler: (Pet newPet) async {
                _petsService
                    .addPet(newPet)
                    .then((value) => Navigator.of(context).pop());
              },
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            )
          ],
        ),
      ),
    );
  }
}
