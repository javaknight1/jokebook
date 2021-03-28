import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/bit.dart';

class NewBitPage extends StatefulWidget {
  NewBitPage({Key key}) : super(key: key);

  @override
  NewBitPageState createState() => NewBitPageState();
}

class NewBitPageState extends State<NewBitPage> {
  final _formKey = GlobalKey<FormState>(); 
  final _bit = Bit();
  List<DropdownMenuItem<int>> typeList = [
    new DropdownMenuItem(
      child: new Text('Bit'),
      value: Type.Bit.index,
    ),
    new DropdownMenuItem(
      child: new Text('Premise'),
      value: Type.Premise.index,
    ),
    new DropdownMenuItem(
      child: new Text('Story'),
      value: Type.Story.index,
    )];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new bit")
      ),
      body: Center(
        child: new Form(
          key: _formKey,
          child: new ListView(
            children: getFormWidget(),
          ))
      )
    );
  }

   List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    // title
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new TextFormField(
        decoration: InputDecoration(labelText: 'Title', hintText: 'Enter title for joke'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a title';
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _bit.title = value;
          });
        },
      )
    ));

    // type
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new DropdownButtonFormField(
        hint: new Text('Type of joke'),
        items: typeList,
        value: _bit.type.index,
        onChanged: (value) {
          setState(() {
            _bit.type = _bit.getTypeObject(value);
          });
        },
        isExpanded: true,
      )
    ));

    // description
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new TextFormField(
        minLines: 3,
        maxLines: 5,
        decoration: InputDecoration(labelText: 'Joke details', hintText: 'Explain or summarize the joke'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a joke';
          }
          return null;
        },
        onSaved: (val) => setState(() => _bit.description = val),
      )
    ));
    
    // submit button
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new RaisedButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form.validate()) {
            form.save();
            _bit.save();
            _showDialog(context);
          }
        },
        child: Text('Save'),
      )
    ));

    return formWidget;
  }

  _showDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
