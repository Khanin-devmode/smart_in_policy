import 'package:flutter/material.dart';

class PolicyDetailPage extends StatefulWidget {
  const PolicyDetailPage({super.key});

  @override
  State<PolicyDetailPage> createState() => _PolicyDetailPageState();
}

class _PolicyDetailPageState extends State<PolicyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Policy detail')),
        body: Row(
          children: [
            const Expanded(child: Text('policy')),
            // Expanded(
            //   child: GridView.count(
            //     primary: false,
            //     padding: const EdgeInsets.all(20),
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     crossAxisCount: 2,
            //     children: <Widget>[
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[100],
            //         child: const Text("He'd have you all unravel at the"),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[200],
            //         child: const Text('Heed not the rabble'),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[300],
            //         child: const Text('Sound of screams but the'),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[400],
            //         child: const Text('Who scream'),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[500],
            //         child: const Text('Revolution is coming...'),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(8),
            //         color: Colors.teal[600],
            //         child: const Text('Revolution, they...'),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Text('Grid Header 1'),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.deepOrange,
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                  ],
                ),
                Text('Grid Header 1'),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('AH')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('ML')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('HM')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('JL')),
                      label: const Text('Laurens'),
                    ),
                  ],
                )
              ],
            )))
          ],
        ));
  }
}