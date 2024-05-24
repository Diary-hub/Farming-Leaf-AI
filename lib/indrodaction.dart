import 'package:flutter/material.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:flutter_application_1/Models/sing%20in/login.dart';

class indrodaction extends StatefulWidget {
  @override
  State<indrodaction> createState() => _showState();
}

class _showState extends State<indrodaction> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentindex = 0;
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: cons.primaryColor, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndictor() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentindex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SingIn())),
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentindex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image:
                    'https://media.istockphoto.com/id/183219309/photo/wheat-grain.jpg?s=612x612&w=0&k=20&c=AeLsMFpBN16g8ZEtCOZt38N45wgOMPrb-sOogmP88og=',
                title: cons.titleOne,
                description: cons.descriptionOne,
              ),
              createPage(
                image:
                    'https://img.pikbest.com/png-images/qiantu/hand-painted-watercolor-wheat-cartoon-transparent_2620235.png!sw800',
                title: cons.titletwo,
                description: cons.descriptiontwo,
              ),
              createPage(
                image:
                    'https://st.depositphotos.com/1000561/2130/i/450/depositphotos_21304905-stock-photo-wheat-isolated.jpg',
                title: cons.titlethree,
                description: cons.descriptionthree,
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            left: 30,
            child: Row(
              children: _buildIndictor(),
            ),
          ),
          Positioned(
              bottom: 70,
              right: 30,
              child: Container(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentindex < 3) {
                          currentindex++;
                          if (currentindex < 3) {
                            _pageController.nextPage(
                                duration: Duration(microseconds: 300), curve: Curves.easeIn);
                          } else {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => SingIn()));
                          }
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    )),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cons.primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const createPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 350,
          child: Image.network(image),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: cons.primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
