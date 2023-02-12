import 'package:cpu/Home.dart';
import 'package:cpu/SRTNIO.dart';
import 'package:flutter/material.dart';

class SRTN extends StatefulWidget {
  SRTN({Key? key}) : super(key: key);

  @override
  State<SRTN> createState() => _SRTNState();
}

class _SRTNState extends State<SRTN> {

var _counter = 0;
  double _avg_tat = 0, _avg_wt = 0;

 List<DataRow> _rowList = [];
  List<List<int>> _data = [];
  List<List<String>> _datas = [];
  List<List<int>> _cardv = [];
  List<List<String>> _cardvs = [];
  List<List<bool>> _readyq = [];
  List<String> _Na = [], _Re = [], _Ru = [], _Te = [];
  List<List<Widget>> _disdata = [], _disNum = [];


void _addrow() {
    setState(() {
      var t = _counter;
      _counter++;
      _data.add([0, 0, 0, 0, 0]);

      _datas.add(['0', '0', '0', '0', '0']);

      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(Text('P' + (_counter - 1).toString(),
            style: TextStyle(color: Colors.white))),
        DataCell(TextField(
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          onChanged: (val) {
            setState(() {
              _datas[t][0] = val;
              _data[t][0] = int.parse(val);
             // _calculate();
            });
          },
        )),
        DataCell(TextField(
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          onChanged: (val) {
            _datas[t][1] = val;
            _data[t][1] = int.parse(val);
            setState(() {
             // _calculate();
            });
          },
        )),
        DataCell(Text(_datas[t][2], style: TextStyle(color: Colors.black))),
        DataCell(Text(_datas[t][3], style: TextStyle(color: Colors.black))),
        DataCell(Text(_datas[t][4], style: TextStyle(color: Colors.black))),
      ]));
    });
  }
 
void _RemoveRow() {
    setState(() {
      _counter--;
      _rowList.removeLast();
      _data.removeLast();
      _datas.removeLast();
      //_calculate();
    });
  }

void _Gant() {
    int cal = 0, st = 0, _tt = 0;
    _cardv.clear();
    _cardvs.clear();
    _readyq.clear();
    List<bool> vis;
    vis = new List<bool>.filled(_counter, false);
    while (cal != _counter) {
      _readyq.add(List.filled(_counter, false));
      var mn = 100, loc = 0;
      bool f = true;
      for (var i = 0; i < _counter; ++i) {
        if (_data[i][1] < mn && !vis[i] && st >= _data[i][0]) {
          mn = _data[i][1];
          loc = i;
          f = false;
        }
        if (!vis[i] && st >= _data[i][0]) {
          _readyq[_tt][i] = true;
        }
      }
      if (f) {
        st++;
        _readyq.removeLast();
        continue;
      }
      _cardv.add([0, 0, 0, 0]);
      _cardvs.add(['0', '0', '0', '0']);
      vis[loc] = true;
      _cardv[_tt][0] = loc;
      _cardv[_tt][1] = st;
      cal++;
      _data[loc][2] = st + _data[loc][1];
      st = _data[loc][2];
      _cardv[_tt][2] = st;
      _cardv[_tt][3] = 1;
      _data[loc][3] = _data[loc][2] - _data[loc][0];
      _data[loc][4] = _data[loc][3] - _data[loc][1];
      for (int i = 0; i < 5; ++i) _datas[loc][i] = _data[loc][i].toString();
      for (int i = 0; i < 4; ++i) _cardvs[_tt][i] = _cardv[_tt][i].toString();
      _tt++;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SRTN',style: TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold),),),
      body: Container(
        width: double.infinity,
          child: ListView(
            children: <Widget>[
              Padding(
                child: Align(
                  child: Text(
                    'I/O Device',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  alignment: Alignment.topRight,
                ),
                padding: EdgeInsets.only(right: 30),
              ),
              Padding(
                child: Align(
                  child: Switch(
                      value: false,
                      onChanged: (t) {
                        Navigator.pop(context);
                        // Navigator.of(context).push(FCFSIOBT());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SRTNIO()),//TBU
                        );
                      }),
                  alignment: Alignment.topRight,
                ),
                padding: EdgeInsets.only(right: 30),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text('P',
                                style: TextStyle(color: Colors.black)),
                            numeric: false),
                        DataColumn(
                            label: Text('AT',
                                style: TextStyle(color: Colors.black)),
                            numeric: true),
                        DataColumn(
                            label: Text('BT',
                                style: TextStyle(color: Colors.black)),
                            numeric: true),
                        DataColumn(
                            label: Text('CT',
                                style: TextStyle(color: Colors.black)),
                            numeric: true),
                        DataColumn(
                            label: Text('TAT',
                                style: TextStyle(color: Colors.black)),
                            numeric: true),
                        DataColumn(
                            label: Text('WT',
                                style: TextStyle(color: Colors.black)),
                            numeric: true),
                      ],
                      rows: _rowList,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: (ElevatedButton(
                      onPressed:         //TBU
                      _addrow,
                      
                      
                      child: Text(
                        'Add Process',
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context)=> (ElevatedButton
                        ( 
                        child: Text(
                          'Delete Process',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: (){
                          _RemoveRow();
                          // Scaffold.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text('Row Deleted'),
                          //     )
                         // );
                        },
                      )
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: (ElevatedButton(
                      
                      child: Text(
                        'Gantt Chart',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _Gant();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CARD(_cardvs, _readyq),
                        //     ));
                      },
                    )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: (ElevatedButton(
                     
                      child: Text(
                        'Visulization',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: null 
                      //_viz,
                    )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    padding: EdgeInsets.all(10),
                    //padding: EdgeInsets.fromLTRB(60, 25, 0, 0),
                    child: Text('AVg. TAT = ' 
                   // + _avg_tat.toStringAsFixed(2)
                   ,
                        style: TextStyle(color: Colors.black)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    padding: EdgeInsets.all(10),
                    //padding: EdgeInsets.fromLTRB(100, 25, 0, 0),
                    child: Text('AVg. WT = ' 
                    //+ _avg_wt.toStringAsFixed(2),
                        ,style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              Container(height: 700),
            ],
          ),
        ));
  }
  }
