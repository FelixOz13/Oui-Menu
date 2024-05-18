import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset >= 500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Inicio'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/woodenbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                onTap: () {
                  _showImageDialog('images/ouimenu6.png');
                },
                child: _buildImageCard('images/ouimenu6.png'),
              ),
              InkWell(
                onTap: () {
                  _showImageDialog('images/ouimenu2.png');
                },
                child: _buildImageCard('images/ouimenu2.png'),
              ),
              InkWell(
                onTap: () {
                  _showImageDialog('images/ouimenu4.jpg');
                },
                child: _buildImageCard('images/ouimenu4.jpg'),
              ),
              InkWell(
                onTap: () {
                  _showImageDialog('images/ouimenu5.png');
                },
                child: _buildImageCard('images/ouimenu5.png'),
              ),
              InkWell(
                onTap: () {
                  _showImageDialog('images/ouimenu3.png');
                },
                child: _buildImageCard('images/ouimenu3.png'),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Visibility(
              visible: _showScrollToTopButton,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.arrow_upward),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InteractiveViewer(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          maxScale: 5.0,
        ),
      ),
    );
  }

  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
