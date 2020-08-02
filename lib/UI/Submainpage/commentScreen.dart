import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koompi_academy_project/Model/CommentModel/commentModelScreen.dart';

class FregementAnswer extends StatefulWidget {
  @override
  _FregementAnswerState createState() => _FregementAnswerState();
}

class _FregementAnswerState extends State<FregementAnswer> {

  final List<Trip> tripsList = [
    Trip("images/background.jpg","Tang Eamseng" ,DateTime.now(), "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg","Tang Eamseng" ,DateTime.now(), "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg","Tang Eamseng" ,DateTime.now(), "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg","Tang Eamseng" ,DateTime.now(), "What are the must-have Chrome extensions for any researcher who does programming?"),
  ];
  Color  _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Color(0xFFf9b62f),
          centerTitle: true,
          title:new Text(
            "Comment",
            style: new TextStyle(
              fontSize: 25.0,
              fontFamily: 'sans-serif',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 45.0,
                    width: 45.0,
                    child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/background.jpg"),
                    ),
                ),
                SizedBox(width:10.0),
                Container(
                  height: 45.0,
                  width: 320.0,
                  margin: const EdgeInsets.only(top:8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "write your comment here",
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: IconButton(
                          icon: Icon(
                              Icons.send,
                              color:Color(0xFFf9b62f),
                            ), 
                            onPressed: null
                            ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new ListView.builder(
              itemCount: tripsList.length,
              itemBuilder: (BuildContext context, int index) => buildTripCard(context, index)
            ),
          )
        ],
      ), 
    );
  }

    Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                  Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(trip.image),
                            ),
                          ),
                        
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: <Widget>[
                                
                                Container(
                                  child: new Text(
                                    trip.username,
                                    style: new TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'sans-serif',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: new Text(
                                    '${DateFormat('dd/MM/yyyy').format(trip.commenntDate).toString()}',
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'sans-serif',
                                    ),
                                  )
                                )
                            ],)
                          ),
                          Container(
                            child: IconButton(icon: Icon(Icons.more_horiz), onPressed:(){
                               _displayDialog(context);
                            }),
                          ),
                      ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Text(
                      trip.description,
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'sans-serif',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: new Text(
                              '21 Answeer',
                              style: new TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sans-serif',
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.question_answer,
                                  color: _iconColor,
                                  ),
                                  //`Icon` to display
                                label: Text('View'), //`Text` to display
                                onPressed: () {
                                  //Code to execute when Floating Action Button is clicked
                                  setState(() {
                                    _iconColor = Colors.blueAccent;
                                  });
                                },
                              ),
                            ),

                            Container(
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.chat,
                                  color: Colors.grey,
                                  ), //`Icon` to display
                                label: Text('Reply'), //`Text` to display
                                onPressed: () {
                                  //C*********************** Call  Alert dailog for write answer***************//
                                  // _displayDialogAnswer(context);
                                },
                              ),
                            )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: Container(
              height: 120.0,
              child: Column(
                children: <Widget>[
                  Container(
                      child:  Container(
                        alignment: Alignment.center,
                        child: new Text(
                          "CHOOSE OPTION",
                          style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo,
                        ),
                      )
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child:Row(
                      children: <Widget>[
                        new FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'DELETE',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'sans-serif',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width:5.0),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 15.0,
                            )
                          ],
                        ),

                        color: Colors.amber[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width:25.0),
                      new FlatButton( 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'EDIT',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'sans-serif',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width:5.0),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15.0,
                            )
                          ],
                        ),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ],
                    ) ,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}

