import 'package:flutter/material.dart';
import 'package:gridview_film/FilmDetay.dart';
import 'package:gridview_film/Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Filmler>> filmleriGetir() async{
    var filmlistesi = <Filmler>[] ;
    var f1 = Filmler(1, 20.0, "Anadoluda", "anadoluda.png");
    var f2 = Filmler(2, 25.0, "Django", "django.png");
    var f3 = Filmler(3, 10.0, "Inception", "inception.png");
    var f4 = Filmler(4, 12.0, "Interstellar", "interstellar.png");
    var f5 = Filmler(5, 25.99, "The Hate Fuleight", "thehatefuleight.png");
    var f6 = Filmler(6, 20.99, "The Pianist", "thepianist.png");
    filmlistesi.add(f1);
    filmlistesi.add(f2);
    filmlistesi.add(f3);
    filmlistesi.add(f4);
    filmlistesi.add(f5);
    filmlistesi.add(f6);
    return filmlistesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlistesi=snapshot.data;
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,

            ),
            itemCount: filmlistesi?.length,
            itemBuilder: (context,indeks){
            var film = filmlistesi![indeks];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfasi(film: film)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("resimler/${film.film_resim_adi}"),
                      Text("${film.film_adi}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("${film.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 15,color: Colors.blue),)
                    ],
                  ),
                ),
              ),
            );

            });
            
          }else{
            return Center();
          }
        },

      ),
    );
  }
}
