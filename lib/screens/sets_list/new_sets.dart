import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../models/set.dart';
import '../../models/bit.dart';

class NewBitPage extends StatefulWidget {
  NewBitPage({Key key}) : super(key: key);

  @override
  NewBitPageState createState() => NewBitPageState();
}

class NewBitPageState extends State<NewBitPage> {
  final _formKey = GlobalKey<FormState>(); 
  final _set = Set();
  Map<Bit, int> allBits = _getAllBits();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new set")
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
            _set.title = value;
          });
        },
      )
    ));

    // set length
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new TextFormField(
        decoration: InputDecoration(labelText: 'Length of set', hintText: 'Enter the length of this set (length in minutes)'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a title';
          } else if (int.tryParse(value) != null) {
            return "Only enter a digit valiue";
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            _set.minLen = int.parse(value);
          });
        },
      )
    ));

    /**
     * What I want to achieve with this widget is quite extensive. Here is what
     * we want it to do.
     * 1) Add new bits
     * At the start, there will be one dropdown that's blank. There should be
     * all the list of bits to choose from. Add it to the current list of bits
     * saved to the working Bit object. Once they select a bit, another
     * dropdown should appear below it.
     * 
     * 2) Change current bit
     * Once a bit has been choosen from a current dropdown, you should be 
     * able to select it again and change to another bit. Once selected new
     * bit, it should not create another blank dropdown at the end. You'll
     * want to update the bit's index within the list of bits in the working
     * set.
     * 
     * 3) Remove one bit
     * Each dropdown should have a minus/remove icon to left. When you click that,
     * it should remove that specific dropdown and remove that bit from the list of
     * bits in the working set.
     */

    // all the bits that's been added
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new DropdownButtonFormField(
        hint: new Text('bit used in set'),
        items: typeList,
        value: "",
        onChanged: (value) {
          setState(() {
            _bit.type = _bit.getTypeObject(value);
          });
        },
        isExpanded: true,
      ),
    ));

    // submit button
    formWidget.add(Container(
      padding: EdgeInsets.all(16),
      child: new RaisedButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form.validate()) {
            form.save();
            _set.save();
            _showDialog(context);
          }
        },
        child: Text('Save'),
      )
    ));

    return formWidget;
  }

  /**
   * This will get all the bits that have been stored into the database
   */
  static Map<Bit, int> _getAllBits() {
    // TODO: Grab bits from database
    Map<Bit, int> bits = {};
    for (var i = 0; i < 10; i++) {
      Bit bit = new Bit();
      bit.title = "Bit " + (i+1).toString();
      bits[bit] = -1;
    }
    return bits;
  }

  // List<> getBitsDropdowns(bits) {
  //   return [
  //   new DropdownMenuItem(
  //     child: new Text('Bit'),
  //     value: Type.Bit.index,
  //   ),
  //   new DropdownMenuItem(
  //     child: new Text('Premise'),
  //     value: Type.Premise.index,
  //   ),
  //   new DropdownMenuItem(
  //     child: new Text('Story'),
  //     value: Type.Story.index,
  //   )];
  // }

  _showDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
