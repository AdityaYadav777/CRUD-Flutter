

import 'package:datatest/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Contact> contact =List.empty(growable:true);

final _nameController=TextEditingController();
final _contactController=TextEditingController();
var selectedIndex=-1;

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:AppBar(
  backgroundColor: Colors.deepPurpleAccent,
  foregroundColor: Colors.white,
  centerTitle:true,
  title:Text('Contact List',style: TextStyle(fontWeight: FontWeight.bold),)
),
body :Padding(
  padding: const EdgeInsets.all(19.0),
  child: Column(
  children:[

    TextField(
      controller: _nameController,
      decoration:InputDecoration(
        border:OutlineInputBorder(),
        hintText:'Enter Name'
      )
    ),

     SizedBox(height:10),

      TextField(
        controller: _contactController,
      decoration:InputDecoration(
        border:OutlineInputBorder(),
        hintText:'Enter Contact Number',
      ),
      keyboardType:TextInputType.number,
        maxLength: 10,
      ),

     SizedBox(height:20),

   Row(
  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      ElevatedButton(
        onPressed:(){

          String name= _nameController.text.trim();
          String _contact= _contactController.text.trim();

          if( name.isNotEmpty && _contact.isNotEmpty){
            setState(() {
              contact.add(Contact(name: name, contactNumber: _contact));
              _nameController.text="";
              _contactController.text="";
              selectedIndex=-1;
            });


          }


        },
        child:Text('Save')
      ),

    ElevatedButton(
        onPressed:(){

          String name=_nameController.text.trim();
          String _mycontact=_contactController.text.trim();
          if(name.isNotEmpty && _mycontact.isNotEmpty){
            setState(() {
              contact[selectedIndex].name=name;
              contact[selectedIndex].contactNumber=_mycontact;
              _nameController.text='';
              _contactController.text="";
            });
          }

        },
        child:Text('Update')
      ),
    ]
   ),
    contact.isEmpty?Text('No Data Found',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
    :Expanded(
      child: ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context,index)=> getRow(index)),
    )
    
  ]
  ),
)
    ) ;
  }


  Widget getRow(int index){
    return Card(

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor: index %2 ==0? Colors.deepPurpleAccent: Colors.purple,
          foregroundColor: Colors.white,

          child: Text(contact[index].name[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),

        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact[index].name),
            Text(contact[index].contactNumber)
          ],
        ),

        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [

              InkWell(
                onTap: (){

                  _nameController.text=contact[index].name;
                  _contactController.text=contact[index].contactNumber;
                   selectedIndex=index;
                },
                  child: Icon(Icons.edit)),

              InkWell(
                  onTap:(){
                    setState(() {
                      contact.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete))
            ],
          ),
        ),

      ),
    );
  }

}

