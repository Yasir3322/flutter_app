import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_done/database/datebase_halper.dart';
import 'package:to_done/models/recodnote.dart';

class AddList extends StatefulWidget {
  const AddList({Key? key}) : super(key: key);

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  var formKey = GlobalKey<FormState>();
  late String purchase, description;
  late int amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add List'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Purchased',
                  labelText: 'Enter Your Purchase',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10.0)),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please Provide Purchase';
                }else{
                  purchase = text;
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Amount',
                  labelText: 'Enter Your Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10.0)),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please provide Amount';
                }else{
                  amount = int.parse(text);
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // perform adding to data base

                      Record r = Record(
                        purchase: purchase,
                        amount: amount,
                      );

                      int result = await DatabaseHelper.instance.addRecord(r);
                      
                      if(result > 0){
                        Fluttertoast.showToast(msg: 'Record Saved',backgroundColor: Colors.green);
                      }else{
                        Fluttertoast.showToast(msg: 'Record Saved',backgroundColor: Colors.red);
                      }
                    }
                  },
                  icon: const Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  label: const Text('Save')),
            ),
            ElevatedButton(onPressed: (){}, child: const Text('view All')),
          ],
        ),
      ),
    );
  }
}
