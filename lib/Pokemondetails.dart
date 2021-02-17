import 'package:flutter/material.dart';
import 'screens/Pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 90.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(color: Colors.white,  fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}" , style: TextStyle(color: Colors.white,fontSize: 17.0),),
                  Text("Weight: ${pokemon.weight}", style: TextStyle(color: Colors.white,fontSize: 17.0),),
                  Text(
                    "Types",
                    style: TextStyle(color: Colors.white, fontSize: 18.0 ,fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                            backgroundColor: Colors.deepPurple[300],
                            label: Text(t , style: TextStyle(color: Colors.white, fontSize: 17.0),),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold , fontSize: 17.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            backgroundColor: Colors.pink[300],
                            label: Text(
                              t,
                              style: TextStyle(fontSize: 17.0,color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Next Evolution",
                      style: TextStyle(color: Colors.white ,fontSize: 17.0,fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[Text("This is the final Evolution", style: TextStyle(color:Colors.white, fontSize: 17.0))]
                        : pokemon.nextEvolution
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.green[500],
                                  label: Text(
                                    n.name,
                                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                ))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 170.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img),
                          colorFilter: ColorFilter.srgbToLinearGamma()
                          )),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}
