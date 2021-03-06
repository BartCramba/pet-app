import 'package:flutter/material.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/model/user.dart';
import 'package:pet_app/screens/home/profile/edit_profile_page.dart';
import 'package:pet_app/screens/pets/add-pet/add_pet_page.dart';
import 'package:pet_app/screens/pets/my_pets/my_pets_page.dart';
import 'package:pet_app/services/auth/auth_service.dart';
import 'package:pet_app/services/services.dart';
import 'package:pet_app/services/user/user_service.dart';
import 'package:pet_app/widgets/profile_picture.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserService _userService = services.get<UserService>();
  final AuthService _authService = services.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _userService.getUser(_authService.currentUserUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final User currentUser = snapshot.data;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ProfilePicture(
                    image: null,
                    pictureUrl: currentUser.pictureUrl,
                    placeholderImageUri: "assets/blank_profile.png",
                    imageGetter: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    currentUser.username,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("Edit info"),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(
                            EditProfilePage.routeName,
                            arguments: currentUser),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("My Pets"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyPetsPage.routeName);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("Add pet"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddPetPage.routeName,
                          arguments: Pet.empty());
                    },
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
