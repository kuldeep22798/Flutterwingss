import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class dbtable extends StatefulWidget {
  @override
  _dbtableState createState() => _dbtableState();
}

class _dbtableState extends State<dbtable> {
  bool sort = true;

  List<int> sno = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  List<String> itemList = [
    'Item- 1',
    'Item- 2',
    'Item- 3',
    'Item- 4',
    'Item- 5',
    'Item- 6',
    'Item- 7',
    'Item- 8',
    'Item- 9',
    'Item- 10',
    'Item- 11',
    'Item- 12',
    'Item- 13',
    'Item- 14',
    'Item- 15'
  ];

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        sno.sort((a, b) => a.compareTo(b));
        itemList = itemList.reversed.toList();
      } else {
        sno.sort((b, a) => a.compareTo(b));
        itemList = itemList.reversed.toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>dbtablecodes()));
      },child: Text("Codes"),backgroundColor: Colors.teal,),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.teal,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(child: Text("DataBase Table",style: TextStyle(color: Colors.white),)),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              sortColumnIndex: 0,
              sortAscending: sort,
              columns: [
                DataColumn(
                    label: Text('No.'),
                    numeric: true,
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                      });
                      onSort(columnIndex, ascending);
                    }),
                DataColumn(label: Text('Column-1')),
                DataColumn(label: Text('Column-2')),
                DataColumn(label: Text('Column-3')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('${sno[0]}')),
                    DataCell(Text('${itemList[0]}')),
                    DataCell(Text('${itemList[0]}')),
                    DataCell(Text('${itemList[0]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[1]}')),
                    DataCell(Text('${itemList[1]}')),
                    DataCell(Text('${itemList[1]}')),
                    DataCell(Text('${itemList[1]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[2]}')),
                    DataCell(Text('${itemList[2]}')),
                    DataCell(Text('${itemList[2]}')),
                    DataCell(Text('${itemList[2]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[3]}')),
                    DataCell(Text('${itemList[3]}')),
                    DataCell(Text('${itemList[3]}')),
                    DataCell(Text('${itemList[3]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[4]}')),
                    DataCell(Text('${itemList[4]}')),
                    DataCell(Text('${itemList[4]}')),
                    DataCell(Text('${itemList[4]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[5]}')),
                    DataCell(Text('${itemList[5]}')),
                    DataCell(Text('${itemList[5]}')),
                    DataCell(Text('${itemList[5]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[6]}')),
                    DataCell(Text('${itemList[6]}')),
                    DataCell(Text('${itemList[6]}')),
                    DataCell(Text('${itemList[6]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[7]}')),
                    DataCell(Text('${itemList[7]}')),
                    DataCell(Text('${itemList[7]}')),
                    DataCell(Text('${itemList[7]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[8]}')),
                    DataCell(Text('${itemList[8]}')),
                    DataCell(Text('${itemList[8]}')),
                    DataCell(Text('${itemList[8]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[9]}')),
                    DataCell(Text('${itemList[9]}')),
                    DataCell(Text('${itemList[9]}')),
                    DataCell(Text('${itemList[9]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[10]}')),
                    DataCell(Text('${itemList[10]}')),
                    DataCell(Text('${itemList[10]}')),
                    DataCell(Text('${itemList[10]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[11]}')),
                    DataCell(Text('${itemList[11]}')),
                    DataCell(Text('${itemList[11]}')),
                    DataCell(Text('${itemList[11]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[12]}')),
                    DataCell(Text('${itemList[12]}')),
                    DataCell(Text('${itemList[12]}')),
                    DataCell(Text('${itemList[12]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[13]}')),
                    DataCell(Text('${itemList[13]}')),
                    DataCell(Text('${itemList[13]}')),
                    DataCell(Text('${itemList[13]}')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('${sno[14]}')),
                    DataCell(Text('${itemList[14]}')),
                    DataCell(Text('${itemList[14]}')),
                    DataCell(Text('${itemList[14]}')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class dbtablecodes extends StatefulWidget {
  const dbtablecodes({Key? key}) : super(key: key);

  @override
  _dbtablecodesState createState() => _dbtablecodesState();
}

class _dbtablecodesState extends State<dbtablecodes> {
  String data="";
  fetchFileData()async{
    String responseText;
    responseText =await rootBundle.loadString('text/other/dbtable.txt');
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
          child: Center(child: Text("DataBase Table",style: TextStyle(color: Colors.white),)),
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
