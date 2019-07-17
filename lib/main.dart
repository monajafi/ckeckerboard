import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checkerboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Checkerdboard(),
    );
  }
}

class Checkerdboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Checkers(),
    );
  }
}

class Checkers extends StatelessWidget {
  final N_ROWS = 8;
  final N_COLUMNS = 8;
  Widget checker(int column,int row) {
    BorderSide checkerSide = BorderSide(color: Colors.black, width: 1);
    Border checkerBorder;
    if (column == N_ROWS - 1) {
      checkerBorder = row == N_COLUMNS - 1 ? 
        Border(top: checkerSide, left: checkerSide,right: checkerSide, bottom: checkerSide):
        Border(top: checkerSide, left: checkerSide, bottom: checkerSide); 
    } else if (row == N_COLUMNS - 1) {
      checkerBorder = Border(top: checkerSide, right: checkerSide, left: checkerSide);
    } else {
      checkerBorder = Border(top: checkerSide, left: checkerSide);
    }
    return Center(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (row + column).isOdd ? Colors.black38: Colors.white,
          border: checkerBorder,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(N_ROWS, (column) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(N_COLUMNS, (row) {
              return checker(column, row);
            }),
          );
        }));
  }
}
