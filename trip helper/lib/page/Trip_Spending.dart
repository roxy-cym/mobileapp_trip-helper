import 'package:flutter/material.dart';
import 'package:myfirstapp/models/Transfer.dart';
import 'package:myfirstapp/Components/Editor.dart';

const _tagNum = 'Number';
const _hintNum = '0000';

const _tagCategory = 'Category';
const _hintCategory = 'food';
const _tagButton = 'Confirm';

class Trip_Spending_2 extends StatefulWidget {
  @override
  State<Trip_Spending_2> createState() => _Trip_Spending_2();
}

class _Trip_Spending_2 extends State<Trip_Spending_2> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spending Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_numController, _tagNum, _hintNum,
                Icons.account_balance_wallet),
            Editor(_categoryController, _tagCategory, _hintCategory,
                Icons.monetization_on),
            RaisedButton(
              onPressed: () => _store(context),
              child: Text(_tagButton),
            ),
          ],
        ),
      ),
    );
  }

  void _store(BuildContext context) {
    final double? num = double.tryParse(_numController.text);
    final String? category = _categoryController.text;

    if (num != null && category != null) {
      final twoInfo = Transfer(category, num);
      Navigator.pop(context, twoInfo);
    }
  }
}

class Trip_Spending extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() => _Trip_SpendingState();
}

class _Trip_SpendingState extends State<Trip_Spending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spending Records"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, indice) {
          final transfer = widget._transfers[indice];
          return ItemTransfer(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Trip_Spending_2();
          })).then(
            (addTransfer) => _updateRecord(addTransfer),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  void _updateRecord(addTransfer) {
    Future.delayed(Duration(milliseconds: 500), () {
      if (addTransfer != null) {
        setState(() {
          widget._transfers.add(addTransfer);
        });
      }
    });
  }
}

class ItemTransfer extends StatelessWidget {
  final Transfer _transfer;
  ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.category.toString()),
        subtitle: Text(_transfer.num.toString()),
      ),
    );
  }
}
