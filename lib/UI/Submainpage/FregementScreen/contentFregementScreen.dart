import 'package:flutter/material.dart';

class FregementContent extends StatefulWidget {
  @override
  _FregementContentState createState() => _FregementContentState();
}

class _FregementContentState extends State<FregementContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildFregementContent(context),
    );
  }

  Widget _buildFregementContent(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 300.0,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => EntryItem(
                      data[index],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry('Google Chrome Part1', <Entry>[
    Entry('Section A0'),
    Entry('Section A1'),
  ]),
  // Second Row
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

//******************* Create the Widget for the row *********************//
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
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
