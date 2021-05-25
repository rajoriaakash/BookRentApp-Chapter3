import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  TextEditingController _issueTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String issue='';
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Issue'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: Container(
                // height: 300,
                decoration: BoxDecoration(
                  // color: Colors.white.withOpacity(0.6),
                    borderRadius: new BorderRadius.circular(10.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,

                    decoration: InputDecoration(
                      hintText: 'Report an issue',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      prefixIcon: Icon(
                          Icons.sd_card_alert_rounded,
                      ),
                    ),
                    controller: _issueTextController,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 20,),
          TextButton(
            child: Text('Submit'),
            onPressed: (){},
          )
        ],

      ),

    );
  }
}
