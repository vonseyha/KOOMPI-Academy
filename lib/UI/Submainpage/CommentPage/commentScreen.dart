import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koompi_academy_project/Model/CommentModel/commentModelScreen.dart';

class FregementAnswer extends StatefulWidget {
  @override
  _FregementAnswerState createState() => _FregementAnswerState();
}

enum MyPupopMenu { delete, edit }

class _FregementAnswerState extends State<FregementAnswer> {
  final List<Trip> tripsList = [
    Trip("images/background.jpg", "Tang Eamseng", DateTime.now(),
        "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg", "Tang Eamseng", DateTime.now(),
        "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg", "Tang Eamseng", DateTime.now(),
        "What are the must-have Chrome extensions for any researcher who does programming?"),
    Trip("images/background.jpg", "Tang Eamseng", DateTime.now(),
        "What are the must-have Chrome extensions for any researcher who does programming?"),
  ];

  int _counter = 0;
  MyPupopMenu _seleteion;
  bool test = false;
  bool test1 = false;
  Color _color = Colors.white;

  Color _iconColor = Colors.grey;

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
        title: new Text(
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
                SizedBox(width: 10.0),
                Container(
                  height: 45.0,
                  width: 320.0,
                  margin: const EdgeInsets.only(top: 8.0),
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
                                color: Color(0xFFf9b62f),
                              ),
                              onPressed: () {
                                print('Send Sucessfull');
                              }),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new ListView.builder(
                itemCount: tripsList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildTripCard(context, index)),
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
                                ))
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: _showPopPupMenu(context),
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: new Text(
                            '21 Answer',
                            style: new TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sans-serif',
                            ),
                          ))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.message,
                          color: _iconColor,
                          size: 18,
                        ),
                        label: Text('View'),
                        onPressed: () {
                          setState(() {
                            test1 = true;
                            _color = Colors.grey;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.reply,
                          size: 20,
                          color: Colors.grey,
                        ),
                        label: Text('Reply'),
                        onPressed: () {
                          setState(() {
                            test = true;
                          });
                          print("Reply");
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  child: test == true ? _fillReplyComments(context) : null,
                ),
                Container(
                  child: test1 == true ? _displaySubComment(context) : null,
                ),
                Container(
                    height: 20.0,
                    child: IconButton(
                        icon: Icon(
                          Icons.expand_less,
                          color: _color,
                        ),
                        onPressed: () {
                          setState(() {
                            test1 = false;
                            test = false;
                            _color = Colors.white;
                          });
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displaySubComment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("images/background.jpg"),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: new Text(
                        "Tang Eamseng",
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Container(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: new Text(
                            '${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()}',
                            style: new TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'sans-serif',
                            ),
                          ))
                    ],
                  )),
              Container(
                child: _showPopPupMenu(context),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: new Text(
              "What are the must-have Chrome extensions",
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'sans-serif',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 60.0),
            child: FlatButton.icon(
              icon: Icon(
                Icons.reply,
                size: 17.0,
                color: Colors.grey,
              ),
              label: Text(
                'Reply',
                style: TextStyle(fontSize: 12.0),
              ),
              onPressed: () {
                setState(() {
                  test = true;
                });
                print("Reply");
              },
            ),
          ),
          Container(
            child: test == true ? _fillReplyComments(context) : null,
          ),
        ],
      ),
    );
  }

  _fillReplyComments(BuildContext context) {
    return Container(
      height: 30.0,
      width: 340.0,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 270.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Write a reply...",
                hintStyle: TextStyle(fontSize: 13),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
          ),
          Container(
              width: 60.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            test = false;
                          });
                          print('Send Sucessfull');
                        }),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          print('Send Sucessfull');
                        }),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  _showPopPupMenu(BuildContext context) {
    return Center(
      child: PopupMenuButton<MyPupopMenu>(
        onSelected: (MyPupopMenu result) {
          if (result == MyPupopMenu.delete) {
            setState(() {
              _seleteion = result;
            });
            _displayDialog(context);
            print(result);
          } else if (result == MyPupopMenu.edit) {
            setState(() {
              _seleteion = result;
            });
            print(result);
            _asyncInputDialog(context);
          }
        },
        icon: Icon(Icons.more_horiz, color: Colors.grey),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MyPupopMenu>>[
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.delete,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete, size: 25, color: Colors.amber[500]),
                ],
              ),
            ),
          ),
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.edit,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, size: 25, color: Colors.blue),
                ],
              ),
            ),
          ),
        ],
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
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        alignment: Alignment.center,
                        child: new Text(
                          "Are you sure to delete this comment?",
                          style: new TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'sans-serif',
                            color: Colors.indigo,
                          ),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Row(
                        children: <Widget>[
                          new FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'YES',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'sans-serif',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.amber[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(width: 25.0),
                          new FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'NO',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'sans-serif',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: 'New comment',
                  labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic),
                ),
                onChanged: (value) {
                  teamName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
