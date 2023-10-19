import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey MD"),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 150, // Ajustez la hauteur du carrousel selon vos besoins
              autoPlay: true, // Défilement automatique
              autoPlayInterval: Duration(seconds: 2), // Intervalle entre les diapositives
            ),
            items: [
              CarouselItem("assets/images/1.jpeg"),
              CarouselItem("assets/images/2.jpeg"),
              CarouselItem("assets/images/3.jpeg"),
              CarouselItem("assets/images/4.jpeg"),
              // Ajoutez plus d'éléments de carrousel avec des images ici
            ],
          ),
          SizedBox(height: 50), // Espacement entre le carrousel et le bouton
          ElevatedButton(
            onPressed: () {
              // Ajoutez votre logique de déconnexion ici
            },
            child: Text("Déconnexion"),
          ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;

  CarouselItem(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}