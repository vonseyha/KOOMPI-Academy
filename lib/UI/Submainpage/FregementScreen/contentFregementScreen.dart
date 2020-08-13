import 'package:flutter/material.dart';

class FregementContent extends StatefulWidget {
  @override
  _FregementContentState createState() => _FregementContentState();
}

class _FregementContentState extends State<FregementContent> {
  @override
  Widget build(BuildContext context){
    var datawh = MediaQuery.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: datawh.size.height/2.18,
              color: Colors.white,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 5.0),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => EntryItem(
                      data[index],
                    ),
                  ),
                ),
              )
            ),
        ],
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; 
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry('Google Chrome Part1', <Entry>[
    Entry('Section A0'),
    Entry('Section A1'),
  ]),
  Entry('Google Chrome Part2', <Entry>[
    Entry('Section B0'),
    Entry('Section B1'),
  ]),
  Entry(
    'Google Chrome Part3',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
