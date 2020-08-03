import 'package:flutter/material.dart';
import 'package:koompi_academy_project/Model/CardContentModel/cardViewModel.dart';

class HomeTab extends StatelessWidget {
  final List<VideoModel> videos = [
    VideoModel(
        videoThubmnail: "http://i3.ytimg.com/vi/hKAUnriFxCE/hqdefault.jpg",
        title: "Two Coders YouTube video",
        channelName: "Two Coders",
        videoUploadDate: "1 month ago",
        videoViews: "1K views",
        channelImage:
            "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
    VideoModel(
        videoThubmnail: "http://i3.ytimg.com/vi/zf1kS7RvOck/hqdefault.jpg",
        title: "Two Coders YouTube video",
        channelName: "Two Coders",
        videoUploadDate: "1 month ago",
        videoViews: "1K views",
        channelImage:
            "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
    VideoModel(
        videoThubmnail: "http://i3.ytimg.com/vi/IM_3f4tGNRk/hqdefault.jpg",
        title: "Two Coders YouTube video",
        channelName: "Two Coders",
        videoUploadDate: "1 month ago",
        videoViews: "1K views",
        channelImage:
            "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
    VideoModel(
        videoThubmnail: "http://i3.ytimg.com/vi/CgO6QE79yTc/hqdefault.jpg",
        title: "Two Coders YouTube video",
        channelName: "Two Coders",
        videoUploadDate: "1 month ago",
        videoViews: "1K views",
        channelImage:
            "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
    VideoModel(
        videoThubmnail: "http://i3.ytimg.com/vi/GmCafgp4mbY/hqdefault.jpg",
        title: "Two Coders YouTube video",
        channelName: "Two Coders",
        videoUploadDate: "1 month ago",
        videoViews: "1K views",
        channelImage:
            "https://myphsar-ror.s3.ap-south-1.amazonaws.com/production_store/71bc0f27e89f0ff46f5e85bde940e985.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (ctx, i) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Color(0xFFffffff),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(videos[i].videoThubmnail),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: NetworkImage(videos[i].channelImage),
                        ),
                      ),
                      title: Text(videos[i].title),
                      subtitle: Text(
                          "${videos[i].channelName} . ${videos[i].videoViews} . ${videos[i].videoUploadDate}"),
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
}
