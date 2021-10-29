import 'package:flutter/material.dart';

import '../../config/asset.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      leading: const Icon(Icons.arrow_back_ios_new),
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      expandedHeight: 220,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        child: FlexibleSpaceBar(
          stretchModes: const [StretchMode.zoomBackground],
          collapseMode: CollapseMode.pin,
          background: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ImageNetwork.parallaxImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      SizedBox(height: 56),
                      CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.playlist_add,
                            size: 16,
                            color: Colors.black,
                          )),
                      SizedBox(height: 8),
                      CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.share,
                            size: 16,
                            color: Colors.black,
                          )),
                      SizedBox(height: 8),
                      CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.download,
                            size: 16,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.hiking, color: Colors.white),
                      const Spacer(),
                      for (int i = 0; i < 5; i++)
                        const Icon(Icons.star_border_outlined,
                            color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
