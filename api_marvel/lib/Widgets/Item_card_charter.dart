// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemCardCharter extends StatelessWidget {
  final String title;
  final String image;
  final String comicsCount;
  final String seriesCount;
  final String storiesCount;
  final String eventsCount;

  const ItemCardCharter({super.key, required this.title, required this.image, required this.comicsCount, required this.seriesCount, required this.storiesCount, required this.eventsCount});



@override
Widget build(BuildContext context) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    elevation: 4,
    shadowColor: Colors.black.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: SizedBox(
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft, 
              child: ClipOval(
                child: Image.network(
                  image,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22.0,
                       color: Color(0xFFF11E22),
                       fontWeight: FontWeight.w900,  
                       fontFamily: 'Marvel',
                       ),
                    
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 20.0), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Comics",
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              ),
                          ),
                          Text(
                            comicsCount,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF11E22),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Marvel',
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Series",
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              ),
                          ),
                          Text(
                            seriesCount,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF11E22),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Marvel',
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Stories",
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              ),
                          ),
                          Text(
                            storiesCount,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF11E22),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Marvel',
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Events",
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              ),
                          ),
                          Text(
                            eventsCount,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF11E22),
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Marvel',
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

 










}