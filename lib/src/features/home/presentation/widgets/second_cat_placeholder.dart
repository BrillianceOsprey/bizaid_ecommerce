import 'package:flutter/material.dart';

class SecondCatPlaceHolder extends StatelessWidget {
  const SecondCatPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    // height: context.screenHeight * 0.15,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 70,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'No Data',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
