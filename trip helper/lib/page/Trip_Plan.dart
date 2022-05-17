import 'package:flutter/material.dart';
import 'package:myfirstapp/models/Note.dart';
//import 'package:myfirstapp/Components/Editor.dart';
//rt 'package:myfirstapp/Components/Editor2.dart';

//Plan
const _tagTit = 'title';
const _hintTit = 'Trip plan';

const _tagCont = 'Content';
const _hintCont = 'Today we are going to.....';
const _tagButton = 'Save';

class Trip_Plan_2 extends StatefulWidget {
  @override
  State<Trip_Plan_2> createState() => _Trip_Plan_2();
}

class _Trip_Plan_2 extends State<Trip_Plan_2> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _store(context),
            child: Text(_tagButton),
          ),
        ],
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "Title"),
              keyboardType: TextInputType.multiline),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: "Content"),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
      ]),
    );
  }

  void _store(BuildContext context) {
    final String? title = _titleController.text;
    final String? content = _contentController.text;

    if (title != null && content != null) {
      final twoInfo = Note(title, content);
      Navigator.pop(context, twoInfo);
    }
  }
}

class Trip_Plan extends StatefulWidget {
  final List<Note> _notes = [];

  @override
  State<StatefulWidget> createState() => _Trip_PlanState();
}

class _Trip_PlanState extends State<Trip_Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Records"),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._notes.length,
        itemBuilder: (context, indice) {
          final note = widget._notes[indice];
          return ItemNote(note);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Trip_Plan_2();
          })).then(
            (addNote) => _updateRecord(addNote),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }

  void _updateRecord(addNote) {
    Future.delayed(Duration(milliseconds: 500), () {
      if (addNote != null) {
        setState(() {
          widget._notes.add(addNote);
        });
      }
    });
  }
}

class ItemNote extends StatelessWidget {
  final Note _note;
  ItemNote(this._note);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.assignment),
        title: Text(_note.content.toString()),
        subtitle: Text(_note.title.toString()),
      ),
    );
  }
}
