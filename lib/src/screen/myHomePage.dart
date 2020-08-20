import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CustomGradientButton(
            texto: Text("Sing in"),
            ancho: 100,
            altura: 40,
            colores: [Colors.blue, Colors.blue],
            poscisionInicial: Alignment.centerLeft,
            poscisionFinal: Alignment.centerRight,
            funcion: ()=>print("No hace nada"),
            iconoApp: Icon(Icons.person),
          ),//CustomGradiant
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ]//Children
      ),//Column
    );//Scaffold
  }//Build
}//Class

class CustomGradientButton extends StatelessWidget{
  final Text texto;
  final double ancho;
  final double altura;
  final List<Color> colores;
  final Alignment poscisionFinal;
  final Alignment poscisionInicial;
  final Function funcion;
  final Icon iconoApp;
  final Icon iconoFinal;

  const CustomGradientButton(
  {Key key,
    @required this.texto,
    @required this.ancho,
    @required this.altura,
    @required this.colores,
    @required this.poscisionFinal,
    @required this.poscisionInicial,
    @required this.funcion,
    this.iconoApp,
    this.iconoFinal,})
  : super(key:key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: funcion,
      child: Container(
        width: ancho,
        height: altura,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(altura/2)),
          gradient: LinearGradient(
            colors: colores,
            begin: poscisionInicial,
            end: poscisionFinal,
            ),//gradiante
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(2,-2),
              blurRadius: altura*.1,
              spreadRadius: 1,
            )//shadow
          ]
        ),//decoration
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            iconoApp ?? Container(),
            texto,
            iconoFinal ?? Offstage(),
          ],//widget
        )//child
      ),//container
    );
  }
}
