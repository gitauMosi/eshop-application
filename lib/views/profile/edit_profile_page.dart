import 'package:eshop/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_textfield.dart';

class EditProfilePage extends StatelessWidget {
   EditProfilePage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              Stack(
                children: [
                  Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      )
                    ]
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(Icons.edit),),
                  ),
                )
                ]
              ),
              SizedBox(height: 20,),
              customTextfield(label: "Name", controller: nameController ),
              SizedBox(height: 15,),
               customTextfield(label: "Email", controller: emailController ),
              SizedBox(height: 20,),
               customTextfield(label: "Phone ", controller: phoneController ),
              SizedBox(height: 20,),
               customTextfield(label: "Adress", controller: addressController ),
              SizedBox(height: 20,),
              CustomBtn(name: "Save", function: (){}) 
            ],
          ),
        ),
      )
     
    );
  }
}

