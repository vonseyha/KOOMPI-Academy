import 'package:flutter/material.dart';

class ContentFregement extends StatefulWidget {
  @override
  _ContentFregementState createState() => _ContentFregementState();
}

class _ContentFregementState extends State<ContentFregement> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: _buildFregementContent(context),
    );
  }

  Widget _buildFregementContent(BuildContext context){
    return Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                            width: 500.0,
                            color: Colors.white,
                            child: Center(
                              child: new Text(
                                'Google Chrome',
                                style: new TextStyle(
                                  fontFamily: 'Quicksand,sans-serif',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            color: Colors.white,
                            child: new Text(
                              'កម្មវិធី Google Chrome ឬជាទូទៅគ្រាន់តែ Chrome កម្មវិធីគឺជាកម្មវិធីបណ្តាញដែលដំណើរការលើកម្មវិធីរុករកអ៊ីនធឺណិត Google Chrome ។ កម្មវិធី Chrome អាចទទួលបានពី Chrome Web Store ដែលកម្មវិធីបន្ថែមនិងធីមអាចតំឡើងឬទិញបាន។ កម្មវិធី Chrome អាចទទួលបានពី Chrome Web Store ដែលកម្មវិធីបន្ថែមនិងធីមអាចតំឡើងឬទិញបាន។',
                              style: new TextStyle(
                                fontFamily: 'Quicksand,sans-serif!important',
                                color: Colors.black38,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ],   
    );
  }
}