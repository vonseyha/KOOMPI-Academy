import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/datas.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/graphQLVideoConf.dart';
import 'package:koompi_academy_project/API%20Server/homeQuery/query.dart';
import 'package:koompi_academy_project/UI/Submainpage/DisplayVideoScreen/displayVideoScreen.dart';

class SampleGrid extends StatefulWidget {
  const SampleGrid({Key key}) : super(key: key);

  @override
  _SampleGridState createState() => _SampleGridState();
}

class _SampleGridState extends State<SampleGrid> {
  List<VideoDatas> list = List<VideoDatas>();
  GraphqlVideoConf graphqlVideoConf = GraphqlVideoConf();
  String exts;
  String ext = "svg";
  bool isCheck = false;

  void fillList() async {
    QueryData queryData = QueryData();
    GraphQLClient client = graphqlVideoConf.clientToQuery();
    QueryResult result = await client
        .query(QueryOptions(documentNode: gql(queryData.getVideoSection())));
    if (!result.hasException) {
      for (var i = 0; i < result.data["courses"].length; i++) {
        setState(() {
          list.add(VideoDatas(
            result.data["courses"][i]["id"],
            result.data["courses"][i]["title"],
            result.data["courses"][i]["feature_image"],
            result.data["courses"][i]["views"],
            result.data["courses"][i]["user"]["fullname"],
            result.data["courses"][i]["user"]["avatar"],
          ));
          exts = result.data["courses"][i]["feature_image"];
          print('++++++++++++++++++$exts');
          // for (var i = 0; i < exts.length; i++) {
          //   List<String> res = exts.split('.');
          //   print("+++++++++++++++++++++++++++++++${res[3]}");
          //   if (res == ext) {
          //     isCheck = true;
          //   }
          // }
          // print(exts);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PortfolioTutorialDetailPage(
                    course_Id: list[index].getId())));
            // _buildRippleEffectNavigation(context,list[index].getId());
            print("Click To Viceo Play");
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color(0xFFc3c4c5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: 170.0,
                        fit: BoxFit.cover,
                        image:
                            // isCheck
                            //     ? SvgPicture.network("${list[index].getImage()}")
                            //     :
                            NetworkImage("${list[index].getImage()}"),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10.0),
                          bottomStart: Radius.circular(10.0)),
                      color: Color(0xFFeff1f2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 10.0, left: 20),
                          child: Text(
                            "${list[index].getTitle()}",
                            style: new TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://avatars0.githubusercontent.com/u/41331389?s=280&v=4"),
                                  ),
                                ),
                                title: Text(
                                  "${list[index].getFullname()}",
                                  style: new TextStyle(
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                ),
                                subtitle: Text(
                                    '${list[index].getView()} views | 1 month ago',
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0xFF4d6890),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRippleEffectNavigation(BuildContext context, String videoUrl) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.5),
          onTap: () {
            Navigator.of(context).push(
              _createTutorialDetailRoute(videoUrl),
            );
          },
        ),
      ),
    );
  }

  PageRoute<Object> _createTutorialDetailRoute(videoUrl) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) =>
          PortfolioTutorialDetailPage(
        course_Id: videoUrl,
      ),
    );
  }
}
