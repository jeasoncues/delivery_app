import 'package:flutter/material.dart';
import 'package:momba/pages/login/login_controllers.dart';
import 'package:momba/pages/register/register_page.dart';
import 'package:momba/utils/my_colors.dart';
import 'package:momba/widgets/card_ofert_widget.dart';

import '../../widgets/text_category_widget.dart';
import '../../widgets/ubication_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController _con = new LoginController();
  int page_index = 0;
  final List<Widget> _tabList = [HomePage(), RegisterPage()];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.favorite, size: 30),
      const Icon(Icons.person, size: 30),
      const Icon(Icons.settings, size: 30)
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Container(
                  margin: const EdgeInsets.only(top: 55, bottom: 15),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.mode_of_travel_sharp,
                                color: MyColors.primaryColor,
                              ),
                              UbicationText(
                                text: "Piura - Piura 2090",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: MyColors.primaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Center(
                            child: Container(
                              width: 45,
                              height: 45,
                              child: Icon(
                                Icons.shopping_basket,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: MyColors.primaryColor),
                            ),
                          ),
                          SizedBox(width: 10),
                          Center(
                            child: Container(
                              width: 45,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: _con.logout,
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: MyColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            _search(),
            _textMejor(),
            CardOfert(),
            _textCategory(),
            Container(
              height: 200,
              child: ListView(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard()
                ],
              ),
            ),
            // _tabList.elementAt(page_index),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: MyColors.primaryColor,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: true,
                    currentIndex: page_index,
                    showUnselectedLabels: false,
                    onTap: (int index) {
                      setState(() {
                        page_index = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Inicio"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: "Favoritos"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Perfil"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: "Configuracion"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 100,
        height: 200,
        color: MyColors.primaryOpacityColor,
        child: Column(
          children: [
            Image.asset('assets/img/ecommerce.webp'),
            const SizedBox(height: 1),
            Text(
              'Express',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _textMejor() {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: TextCategory(
                  text: "Lo mejor para ti",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _textCategory() {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: TextCategory(
                  text: "Categorias",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: const TextField(
        decoration: InputDecoration(
            hintText: '¿Que quieres hoy?',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: Color(0xFFE70D32)),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Color(0xFFE70D32),
            )),
      ),
    );
  }
}
