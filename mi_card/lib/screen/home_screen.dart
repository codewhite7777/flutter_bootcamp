import 'package:flutter/material.dart';
import 'package:mi_card/constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePart(
              profilePath: 'asset/images/alee.png',
              name: 'Lee A Rang',
              position: 'Flutter Developer',
            ),
            ContactPart(
              phoneNumber: "+82 010 0000 4242",
              mail: 'codewhite7777@gmail.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfilePart({
    required String profilePath,
    required String name,
    required String position,
  }) {
    return Builder(
      builder: (BuildContext context) {
        double defaultIndent = MediaQuery.of(context).size.width / 5;
        return Column(
          children: [
            CircleAvatar(
              radius: DEFAULT_CIRCLE,
              backgroundImage: AssetImage(profilePath),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "pacifico",
                fontSize: 50,
              ),
            ),
            Text(
              position,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "opensans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.yellow[300],
              thickness: 1.5,
              indent: defaultIndent,
              endIndent: defaultIndent,
            ),
          ],
        );
      },
    );
  }

  Widget ContactPart({
    required String phoneNumber,
    required String mail,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(phoneNumber),
            leading: const Icon(
              Icons.phone,
              color: DEFAULT_COLOR,
            ),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(mail),
            leading: const Icon(
              Icons.mail,
              color: DEFAULT_COLOR,
            ),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
