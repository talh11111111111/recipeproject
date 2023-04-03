import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../widgets/appbar.dart';
import '../widgets/info.dart';

class FavouritesPge extends StatefulWidget {
  const FavouritesPge({super.key});

  @override
  State<FavouritesPge> createState() => _FavouritesPgeState();
}

class _FavouritesPgeState extends State<FavouritesPge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: MyAppBar(),
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: Hive.box('favourites').listenable(),
                builder: (context, box, child) {
                  return Hive.box('favourites').isEmpty
                      ? const Info(text: 'you dont have a favorite food')
                      : ListView.builder(
                          padding: const EdgeInsets.all(4),
                          itemCount: box.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              background: Container(
                                color: Colors.red,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              key: ValueKey(box.getAt(index)),
                              child: Card(
                                  child: ListTile(
                                title: Text(
                                  box.getAt(index),
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                              onDismissed: (DismissDirection direction) async {
                                await box.deleteAt(index);
                              },
                            );
                          },
                        );
                })));
  }
}
