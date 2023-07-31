import 'package:flutter/material.dart';
import 'package:techno_world/ui/auth/widgets/global_text_fields.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add products'),    
      ),
      body: Column(
        children: [
          Center(
            child: GlobalTextField(hintText: 'name', keyboardType: TextInputType.text, textInputAction: TextInputAction.next, textAlign: TextAlign.left, controller: TextEditingController()),
          )
        ],
      ),

    );
  }
}
