import 'package:flutter/material.dart';

import 'pollingStationdata.dart';

class Pollingresultpage extends StatefulWidget {
  Pollingstation pollingstation;
  Pollingresultpage({Key? key, required this.pollingstation}) : super(key: key);

  @override
  State<Pollingresultpage> createState() => _PollingresultpageState();
}

class _PollingresultpageState extends State<Pollingresultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(
          widget.pollingstation.contituencyCODE.toString(),
          // b.contituencyCODE.toString(),
          style: TextStyle(fontSize: 22.0),
        ),
        Text(widget.pollingstation.pollingstationname.toString()
            // a.description.toString()
            ),
        Text(widget.pollingstation.electionDescription.toString()
            // d.description.toString()
            ),
        Text(widget.pollingstation.entityname.toString()),
        // f.entityname.toString()),
        Text(widget.pollingstation.entitynameDescription.toString()
            //f.description.toString()
            ),
        Text(
          widget.pollingstation.electionDATE.toString(),
          // c.election_DATE.toString()
        ),
      ],
    ));
  }
}
