import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class radiio extends StatefulWidget {
  @override
  _radiioState createState() => _radiioState();
}

class _radiioState extends State<radiio> {
  String? _group1SelectedValue;
  String? _group2SelectedValue;

  @override
  void initState() {
    _group1SelectedValue = "1";
    _group2SelectedValue = "A";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>radiobttncode()));
      },child: Text("Codes"),backgroundColor: Colors.teal,),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.teal,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(child: Text("Radio Button",style: TextStyle(color: Colors.white),)),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Center(
                    child: RichText(
                        text: TextSpan(
                            text: "Selected Number: ",
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '$_group1SelectedValue ',
                                  style: TextStyle(fontSize: 24)),
                            ]))),
                ListTile(
                  title: Text("1"),
                  leading: Radio(
                      value: "1",
                      groupValue: _group1SelectedValue,
                      onChanged: _group1Changes),
                ),
                ListTile(
                  title: Text("2"),
                  leading: Radio(
                      value: "2",
                      groupValue: _group1SelectedValue,
                      onChanged: _group1Changes),
                ),
                ListTile(
                  title: Text("3"),
                  leading: Radio(
                      value: "3",
                      groupValue: _group1SelectedValue,
                      onChanged: _group1Changes),
                ),
                ListTile(
                  title: Text("4"),
                  leading: Radio(
                      value: "4",
                      groupValue: _group1SelectedValue,
                      onChanged: _group1Changes),
                ),
                ListTile(
                  title: Text("5"),
                  leading: Radio(
                      value: "5",
                      groupValue: _group1SelectedValue,
                      onChanged: _group1Changes),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Center(
                    child: RichText(
                        text: TextSpan(
                            text: "Selected Character: ",
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '$_group2SelectedValue ',
                                  style: TextStyle(fontSize: 24)),
                            ]))),
                ListTile(
                  title: Text("A"),
                  leading: Radio(
                      value: "A",
                      groupValue: _group2SelectedValue,
                      onChanged: _group2Changes),
                ),
                ListTile(
                  title: Text("B"),
                  leading: Radio(
                      value: "B",
                      groupValue: _group2SelectedValue,
                      onChanged: _group2Changes),
                ),
                ListTile(
                  title: Text("C"),
                  leading: Radio(
                      value: "C",
                      groupValue: _group2SelectedValue,
                      onChanged: _group2Changes),
                ),
                ListTile(
                  title: Text("D"),
                  leading: Radio(
                      value: "D",
                      groupValue: _group2SelectedValue,
                      onChanged: _group2Changes),
                ),
                ListTile(
                  title: Text("E"),
                  leading: Radio(
                      value: "E",
                      groupValue: _group2SelectedValue,
                      onChanged: _group2Changes),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _group1Changes(String? value) {
    setState(() {
      _group1SelectedValue = value;
    });
  }

  void _group2Changes(String? value) {
    setState(() {
      _group2SelectedValue = value;
    });
  }
}



class radiobttncode extends StatefulWidget {
  const radiobttncode({Key? key}) : super(key: key);

  @override
  _radiobttncodeState createState() => _radiobttncodeState();
}

class _radiobttncodeState extends State<radiobttncode> {
  String data="";
  fetchFileData()async{
    String responseText;
    responseText =await rootBundle.loadString('text/other/radiio.txt');
    setState(() {
      data=responseText;
    });
  }
  @override
  void initState() {
    fetchFileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.teal,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(child: Text("Radio Button",style: TextStyle(color: Colors.white),)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(alignment: Alignment.topLeft,
                      child: Text("Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                ),
                SizedBox(height: 20,),
                SelectableText(data),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}