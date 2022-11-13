import 'package:flutter/material.dart';

class SearchNav extends StatelessWidget {
  const SearchNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 10 - 8.0 * 0.0, bottom: 12 - 8.0 * 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 35.0,
                      child: Material(
                        elevation: 5.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        child: TextField(
                          autofocus: false,
                          onTap: () {},
                          style: const TextStyle(
                            fontSize: 12.0,
                            height: 2.0,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            border: InputBorder.none,
                            hintText: "Mencari masakan",
                          ),
                        ),
                      ),
                    )),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
