import 'package:flutter/material.dart';

import '../../widgets/action_botton.dart';

class AllCycleList extends StatefulWidget {
  static const routeName = '/allCycles';
  const AllCycleList({super.key});

  @override
  State<AllCycleList> createState() => _AllCycleListState();
}

class _AllCycleListState extends State<AllCycleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Container(
            padding: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Theme.of(context).highlightColor)
              ],
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              iconSize: 20,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          ),
        ),
        actions: const [
          ActionButton(
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hello, ',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      TextSpan(
                        text: "Anonymous",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  'Choose Your Bike',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "City Master",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
