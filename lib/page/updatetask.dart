import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/service/tasklist.dart';

class updatetask extends StatefulWidget {
  final Task task;

  updatetask(this.task);

  @override
  updatetaskState createState() => updatetaskState(this.task);
}
//class controller
class updatetaskState extends State<updatetask> {
  Task task;
  
  updatetaskState(this.task);

  TextEditingController nameController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (task != null) {
      nameController.text = task.name;
    }
    //rubah
    return Scaffold(
      appBar: AppBar(
        title: task == null ? Text('Tambah') : Text('Rubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget> [
            // nama
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',             
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {                  
                  //                                                    
                },
              ),
            ),
            // tombol button
            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: Row(
                children: <Widget> [
                  // tombol simpan
                  Expanded(
                     child: ElevatedButton(
                    onPressed: context.watch<Tasklist>().isActive
                        ? () {
                            context
                                .read<Tasklist>()
                                .setTaskName(nameController.text);
                            if (context.read<Tasklist>().isValidated()) {
                              context.read<Tasklist>().updateTask(
                                    nameController.text,
                                  );
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    child: const Text("Tambah Task Baru"),
                  ),
                    ),
                  
                  Container(width: 5.0,),
                  // tombol batal
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle( 
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                     
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}