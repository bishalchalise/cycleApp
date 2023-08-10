import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback? toggleTheme;
  final VoidCallback? helpAndSupport;
  final VoidCallback? aboutUs;
  final VoidCallback? settings;
  final VoidCallback? favourites;
  final VoidCallback? logOut;
  final String userText;
  const MyDrawer(
      {required this.userText,
      super.key,
       this.toggleTheme,
       this.helpAndSupport,
       this.aboutUs,
       this.settings,
       this.favourites,
       this.logOut});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        surfaceTintColor: Colors.white,
        width: 230,
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.green.shade600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Hello,",
                        style: TextStyle(
                          color: Colors.green.shade600,
                        )),
                    TextSpan(
                        text: userText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        )),
                  ]))
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.light_mode),
              subtitle: Text('Dark/Light Theme',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700)),
              title: const Text(
                'Toggle Theme',
              ),
              onTap: toggleTheme,
            ),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.support_agent),
                subtitle: Text('Contacts/Related Information',
                    style:
                        TextStyle(fontSize: 10, color: Colors.grey.shade700)),
                title: const Text('Help and Support'),
                onTap: helpAndSupport),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              subtitle: Text('Version Number/ Release Notes',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700)),
              title: const Text('About Us'),
              onTap: aboutUs,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              subtitle: Text('Edit Profiles/Releated Data',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700)),
              title: const Text('Settings'),
              onTap: settings,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.favorite),
              subtitle: Text('Your Favourites',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700)),
              title: const Text('Favourites'),
              onTap: favourites,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: logOut,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
