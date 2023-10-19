import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_test/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameProvider = Provider.of<UsernameProvider>(context);
    final theme = Theme.of(context); 
    
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Welcome, ${usernameProvider.username}', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Mettez ici le code pour gérer la déconnexion
                    },
                    child: Text('Deconnexion', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange, theme),
                  itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.green, theme),
                  itemDashboard('Audience', CupertinoIcons.person_2, Colors.purple, theme),
                  itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown, theme),
                  itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo, theme),
                  itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal, theme),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue, theme),
                  itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent, theme),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background, ThemeData theme) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: theme.primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(  
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: theme.textTheme.titleMedium)
      ],
    ),
  );

  }

