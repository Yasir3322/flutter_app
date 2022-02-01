import 'package:flutter/material.dart';
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  var formKey = GlobalKey<FormState>();
  late String purchase, description;
  late int amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Record'),
      ),
      body:  Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Purchased',
                  labelText: 'Enter Your Purchase',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10.0)
              ),
              validator: (text){
                if(text == null || text.isEmpty){
                  return 'please Provide Purchase';
                }
                purchase = text;
                return null;
              },
            ),

            const SizedBox(height: 10,),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Amount',
                  labelText: 'Enter Your Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10.0)
              ),
              validator: (text){
                if(text == null || text.isEmpty){
                  return 'please provide Amount';
                }
                amount = int.parse(text);
                return null;
              },
            ),

            const SizedBox(height: 60,),

            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: ElevatedButton.icon(onPressed: (){
                if(formKey.currentState!.validate()){
                  // perform adding to data base
                }
              },
                  icon: const Icon(Icons.update),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  label: const Text('Update')),
            ),

          ],
        ),
      ),
    );
  }
}
