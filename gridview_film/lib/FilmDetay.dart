import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview_film/Filmler.dart';

class DetaySayfasi extends StatefulWidget {

  Filmler film;

  DetaySayfasi({required this.film});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.film.film_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyat}" ,style: TextStyle(color: Colors.blue,fontSize:30)),
            ElevatedButton(onPressed: (){
              print("${widget.film.film_adi} Kiralandı");
            }, child: Text("Kirala"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
