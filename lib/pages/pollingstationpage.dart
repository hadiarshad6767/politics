import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme.dart';
import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';

import '../LocalStorage/localStorage.dart';
import '../settings/settings.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;

import 'pollingStationdata.dart';
import 'pollingresult.dart';

class PollingStationPage extends StatefulWidget {
  const PollingStationPage({Key? key}) : super(key: key);

  @override
  State<PollingStationPage> createState() => _PollingStationPageState();
}

class _PollingStationPageState extends State<PollingStationPage> {
  Future<String> Service() async {
    var url = Uri.parse("http://api.cwiztech.com:8079/v1/apigateway");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer 73ee19f4-4908-43c5-b04f-581e19e2f5a5"
        },
        body: jsonEncode({
          "request_BODY": "",
          "request_TYPE": "GET",
          "request_URI": "electioncontituencypollingstation",
          "service_NAME": "ELECTION"
        }));
    // List<dynamic> responselist = [];
    // responselist = jsonDecode(response.body);
    // print(responselist.length);
    // print(responselist[0]);
    // print(response.body);
    return response.body;
  }

  Future<String>? _calculation;
  void initState() {
    _calculation = Service();
    // print(_calculation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PollingStation"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder<String>(
        future: _calculation,
        builder: (
          BuildContext context,
          AsyncSnapshot<String> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              // print(snapshot.data.toString());
              List<dynamic> responselist = [];
              List<Pollingstation> pollingstationlist = [];
              responselist = jsonDecode(snapshot.data.toString());

              for (int i = 0; i < responselist.length; i++) {
                Pollingstation pollingstation = Pollingstation();
                var a = PollingStationResponse.fromJson(responselist[i]);
                pollingstation.pollingstationname = a.description.toString();
                var b = ContiteuncyResponse.fromJson(
                    json.decode(a.contituencyDETAIL.toString()));
                pollingstation.contituencyCODE = b.contituencyCODE.toString();
                var c = ElectionResponse.fromJson(
                    json.decode(b.electionDETAIL.toString()));
                pollingstation.electionDATE = c.election_DATE.toString();
                var e =
                    districtResponse.fromJson(jsonDecode(b.district_DETAIL));
                pollingstation.districtNAME = e.district_NAME.toString();
                var f = provincesResponse.fromJson(e.provinces_ID);
                pollingstation.entityname = f.entityname.toString();
                pollingstation.entitynameDescription = f.description.toString();
                var d = ElectionTypeResponse.fromJson(c.electiontype_ID);
                pollingstation.electionDescription = d.description.toString();
                pollingstationlist.add(pollingstation);
                print(pollingstationlist[i].pollingstationname);
              }
              return ListView.builder(
                itemCount: pollingstationlist.length,
                //  responselist.length,
                itemBuilder: (context, position) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                          title: Column(
                            children: [
                              Text(
                                pollingstationlist[position]
                                    .contituencyCODE
                                    .toString(),
                                // b.contituencyCODE.toString(),
                                style: TextStyle(fontSize: 22.0),
                              ),
                              Text(pollingstationlist[position]
                                      .pollingstationname
                                      .toString()
                                  // a.description.toString()
                                  ),
                              Text(pollingstationlist[position]
                                      .electionDescription
                                      .toString()
                                  // d.description.toString()
                                  ),
                              Text(pollingstationlist[position]
                                  .entityname
                                  .toString()),
                              // f.entityname.toString()),
                              Text(pollingstationlist[position]
                                      .entitynameDescription
                                      .toString()
                                  //f.description.toString()
                                  ),
                              Text(
                                pollingstationlist[position]
                                    .electionDATE
                                    .toString(),
                                // c.election_DATE.toString()
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Pollingresultpage(
                                    pollingstation:
                                        pollingstationlist[position])));
                          }),
                    ),
                  );
                },
              );
              // Text(snapshot.data.toString(),
              //     style: const TextStyle(color: Colors.cyan, fontSize: 36));
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      // FutureBuilder<String>(
      //   future: _calculation, // a previously-obtained Future<String> or null
      //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //     print(snapshot);
      //     print(snapshot.data);
      //     print(snapshot.error);
      //     print(snapshot.connectionState);
      //     List<Widget> children;
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemBuilder: (context, position) {
      //           return Card(
      //             child: Padding(
      //                 padding: const EdgeInsets.all(16.0),
      //                 child: Column(
      //                   children: [
      //                     Text(
      //                       "NA-70",
      //                       style: TextStyle(fontSize: 22.0),
      //                     ),
      //                     Text("Govt M.B.Girls High School Lalamusa (Male)"),
      //                     Text("BY ELECTION"),
      //                     Text("Punjab"),
      //                     Text("2018-07-29")
      //                   ],
      //                 )),
      //           );
      //         },
      //       ) as ListView;
      //     } else if (snapshot.hasError) {
      //       children = <Widget>[
      //         const Icon(
      //           Icons.error_outline,
      //           color: Colors.red,
      //           size: 60,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 16),
      //           child: Text('Error: ${snapshot.error}'),
      //         )
      //       ];
      //     } else {
      //       children = const <Widget>[
      //         SizedBox(
      //           width: 60,
      //           height: 60,
      //           child: CircularProgressIndicator(),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: 16),
      //           child: Text('Awaiting result...'),
      //         )
      //       ];
      //     }
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: children,
      //       ),
      //     );
      //   },
      // ),
      // FutureBuilder(
      //   builder: (context, projectSnap) {
      //     if (projectSnap.connectionState == ConnectionState.none &&
      //         projectSnap.hasData == null) {
      //       //print('project snapshot data is: ${projectSnap.data}');
      //       return Container();
      //     } else {
      //       return ListView.builder(
      //         itemBuilder: (context, position) {
      //           return Card(
      //             child: Padding(
      //                 padding: const EdgeInsets.all(16.0),
      //                 child: Column(
      //                   children: [
      //                     Text(
      //                       "NA-70",
      //                       style: TextStyle(fontSize: 22.0),
      //                     ),
      //                     Text("Govt M.B.Girls High School Lalamusa (Male)"),
      //                     Text("BY ELECTION"),
      //                     Text("Punjab"),
      //                     Text("2018-07-29")
      //                   ],
      //                 )),
      //           );
      //         },
      //       );
      //     }
      //   },
      //   // future: getProjectDetails(),
      // ),
      // body: ListView.builder(

      //   itemBuilder: (context, position) {
      //     return Card(
      //       child: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: Column(
      //             children: [
      //               Text(
      //                 "NA-70",
      //                 style: TextStyle(fontSize: 22.0),
      //               ),
      //               Text("Govt M.B.Girls High School Lalamusa (Male)"),
      //               Text("BY ELECTION"),
      //               Text("Punjab"),
      //               Text("2018-07-29")
      //             ],
      //           )),
      //     );
      //   },
      // ),
    );
  }
}
