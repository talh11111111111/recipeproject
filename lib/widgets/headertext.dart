import 'package:flutter/material.dart';

import '../views/favouritepage.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'All Foods Are Here',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouritesPge()));
              },
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
