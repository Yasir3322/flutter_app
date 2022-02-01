import 'package:flutter/material.dart';
import 'package:to_done/database/datebase_halper.dart';
import 'package:to_done/models/recodnote.dart';
import 'package:to_done/screens/addscreen.dart';
import 'package:to_done/screens/updatescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('sanga ye'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const AddList();
          }));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
/*
Card(
                            color: Colors.white54,
                            child: ListTile(
                              leading:Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(child: Text('1'))),
                              title: Text('purchase ${r.purchase}'),
                              subtitle: Text('amount ${r.amount}'),
                              trailing: IconButton(onPressed: (){},
                                  icon:const Icon(Icons.delete) ),


                              onTap: (){
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                //   return const UpdateScreen();
                                // }));
                              },
                            ),
                          );
 */

/*
FutureBuilder<List<Record>>(
          future: DatabaseHelper.instance.getAllrecords(),
          builder: (BuildContext context , AsyncSnapshot<List<Record>> snapshot){
            if(snapshot.hasData){

              if(snapshot.data!.isEmpty){
                  return const Center(child: Text('NO record found'),);
              }else{

                    List<Record> records = snapshot.data!;

                    return ListView.builder(
                        itemCount: records.length,
                        itemBuilder: (context,index){
                          Record r = records[index];
                          return Text(records.length.toString());
                        });
              }

            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
 */