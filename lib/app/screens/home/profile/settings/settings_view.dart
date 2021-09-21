import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({required this.logoutOnPressed});

  final Function logoutOnPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.teal.shade300,
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 160),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 54,
                              backgroundImage: NetworkImage(
                                'https://pm1.narvii.com/6611/cfc19e2a3c60c8b4f645175e9a6f118f36484ccb_hq.jpg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 20),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Change Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Photos',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Liked Recipes',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Vault',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 120),
                      OutlinedButton(
                        onPressed: () => logoutOnPressed(context),
                        style: ButtonStyle(
                          visualDensity: VisualDensity(
                            horizontal: VisualDensity.maximumDensity,
                            vertical: VisualDensity.maximumDensity / 6,
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
