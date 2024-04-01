import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'modul/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Maserati Store',
      home: HomePage(),
    );
  }
}

class ExampleButton extends StatelessWidget {
  final String text;
  const ExampleButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20),);
  }
}

class ExampleTextField extends StatelessWidget {
  final String HintText;
  final int MAXLength;
  const ExampleTextField({Key? key, required this.HintText, required this.MAXLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.lock),
          hintText: HintText
      ),
      maxLength: MAXLength,
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(

                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.network('https://img.freepik.com/premium-vector/orchid-vector-illustration-style_717774-38482.jpg?w=2000'),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  height: 10,
                  alignment: FractionalOffset(0.0, 0.8),
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box_sharp),
                        border: OutlineInputBorder(),
                        hintText: 'Введите логин:'
                    ),
                    maxLength: 30,
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                    width: 200,
                    height: 10,
                    alignment: FractionalOffset(0.0, 0.02),
                    color: Colors.white,
                    child: ExampleTextField(HintText: 'Введите пароль:', MAXLength: 30)
                )
            ),
            Expanded(
                child: Container(

                  alignment: FractionalOffset(0.5, 0.01),
                  margin: EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                      child: ExampleButton(text: 'Войти'),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login())
                        );
                      }
                  ),
                )
            ),
            Expanded(child: Container(
                alignment: FractionalOffset(0.5, 0.01),
                child: ElevatedButton(
                    child: ExampleButton(text: 'Зарегистрироваться'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration())
                      );
                    }
                )
            )
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text('Регистрация'),),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mondo dei Fiori',
        style: TextStyle(fontStyle: FontStyle.italic, height: 5, fontSize: 20),
      ),
      ),
        body: GridView.builder(
        padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25,
          ),
          itemCount: flowersList.length,
          itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 7,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers(
                    name: flowersList[index].name,
                    price: flowersList[index].price,
                    description: flowersList[index].description,
                    specifications: flowersList[index].specifications,
                    //video: flowersList[index].video,
                    fimage: fimageList[index].fimage,
                  ),
                ),
              );
              },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.network(
                  flowersList[index].image,
                  height: 90,
                  width: 90,
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          );
          },
        ),
    );
  }
}


class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Авторизация'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  alignment: FractionalOffset(0.5, 2),
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Пароль',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  alignment: FractionalOffset(0.5, 1),
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.https),
                        hintText: 'Пароль',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  alignment: FractionalOffset(0.5, 0.001),
                  margin: EdgeInsets.only(bottom: 8),
                  child: TextField(style: TextStyle(fontSize: 20, color: Colors.black
                  ),
                    decoration: InputDecoration(hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        prefixIcon: Icon(Icons.https),
                        hintText: 'Повторите пароль',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        )
                    ),
                  ),
                )
            ),
            Expanded(

                child: Container(
                    alignment: FractionalOffset(0.5, 0.01),
                    child: ElevatedButton(
                        child: ExampleButton(text: 'Зарегистрироваться'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())
                          );
                        }
                    )
                )
            )

          ],
        ),
      ),


    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.name_product1, required this.photo_path1, required this.desciption_product1, required this.id_product1, required this.price_prpduct1}) : super(key: key);
  final String name_product1;
  final String photo_path1;
  final String desciption_product1;
  final double price_prpduct1;
  final int id_product1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name_product1,
            style: TextStyle(fontSize: 20, color: Colors.red[900]),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8) ,
          children: <Widget>[
            Container(
              child: Image.network(photo_path1),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Артикул: ${id_product1.toString()}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Полное название продукта: ${name_product1}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Описание товара: ${desciption_product1}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('Цена товара: ${price_prpduct1.toString()}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
          ],

        )
    );
  }
}


class DescriptionFlovers extends StatefulWidget {
  final String name;
  final String price;
  final String description;
  final String specifications;
  //final String video;
  final List<String> fimage;

  const DescriptionFlovers({
    Key? key,
    required this.name,
    required this.price,
    required this.description,
    required this.specifications,
    //required this.video,
    required this.fimage,
  }) : super(key: key);

  @override
  _DescriptionFloversState createState() => _DescriptionFloversState();
}

class _DescriptionFloversState extends State<DescriptionFlovers> {
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    //YoutubePlayerController controller = YoutubePlayerController(
    //initialVideoId: widget.video,
    //flags: const YoutubePlayerFlags(
    //autoPlay: false,
    //));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240
      ),
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,

                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: widget.fimage.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image.network(widget.fimage[index]),
                );
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25
                  ),
                  color: const Color.fromARGB(255, 230, 230, 230,
                  ),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20
                ),
                height: 170,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name, //Название товара
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 15
                    ),
                    Text(
                      widget.price, //Цена товара
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25
            ),
            Center(
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25
                  ),
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                height: 200, //высота
                width: 400, //ширина
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 17),
                      const Text(
                        "Описание:",
                        style:  TextStyle(fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20
                      ),
                      Text(
                        widget.description, //Описание Товара
                        style: const TextStyle(fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25
            ),

            const SizedBox(height: 25
            ),
            const SizedBox(height: 25
            ),
          ],
        ),
      ),
    );
  }
}