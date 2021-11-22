import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class Item {
  bool isExpanded;
  final String header;
  Widget body;
  Item(this.header, this.body, this.isExpanded);
}

class _PanelState extends State<Panel> {
  List<Item> items = [];
  @override
  void initState() {
    for (int i = 1; i < 11; i++) {
      items.add(Item('$i', Text('Hellow World'), false));
    }
  }

  ExpansionPanel createItem(Item item) {
    return ExpansionPanel(
        headerBuilder: (context, bool isExpanded) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Text("'Task ${item.header}"),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
          children: [
            ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    items[index].isExpanded = !items[index].isExpanded;
                  });
                },
                children: items.map(createItem).toList()
                //items.map(createItem).toList(),

                )
          ],
        ),
      ),
    );
  }
}
