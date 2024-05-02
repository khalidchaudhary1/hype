import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:overlap_stack/overlap_stack.dart';

import '../view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const TextWidget(
          title: "HYPE",
          fontWeight: FontWeight.w800,
          fontSize: 23,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(Images.home),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(Images.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(Images.profile),
                ),
                SizedBox(
                  width: size.width * .7,
                  height: 44,
                  child: TextFieldWidget(
                      controller: searchController,
                      hintText: "Take a step forward ",
                      suffix: Image.asset(Images.image)),
                )
              ],
            ),
            height20,
            SizedBox(
              height: size.height * .7,
              child: ListView.builder(
                itemCount: postList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var post = postList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(post.userProfile),
                            ),
                            width10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    TextWidget(
                                      title: post.name,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    width5,
                                    TextWidget(
                                      title: post.type == 'poll'
                                          ? " create a poll"
                                          : '',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.grey.shade400,
                                    ),
                                    TextWidget(
                                      title: post.type == 'initiative'
                                          ? " create an initiative"
                                          : '',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                      color: Colors.grey.shade400,
                                    ),
                                  ],
                                ),
                                TextWidget(
                                  title: post.time,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: bodyTextColor,
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz_outlined,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        height20,
                        post.type == 'initiative' ||
                                post.type == 'poll' ||
                                post.type == 'multi'
                            ? const SizedBox()
                            : TextWidget(
                                fontWeight: FontWeight.w400, title: post.desc),
                        height10,
                        post.type == 'image'
                            ? Image.asset(post.post)
                            : post.type == 'initiative'
                                ? initiativeMethod(post, size)
                                : post.type == 'poll'
                                    ? pollMethod(post, size)
                                    : post.type == 'multi'
                                        ? multiImagesMethod(size, post, index)
                                        : TextButton(
                                            onPressed: () {},
                                            child: TextWidget(
                                              title: post.post,
                                              color: Colors.blue,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            )),
                        height10,
                        post.type != 'initiative' && post.type != 'poll'
                            ? Row(
                                children: [
                                  const SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: Card(
                                      shape: StadiumBorder(),
                                      color: Colors.red,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                  TextWidget(
                                    title: "${post.likes} likes",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: bodyTextColor,
                                  ),
                                  const Spacer(),
                                  TextWidget(
                                    title: "${post.comments} comments",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: bodyTextColor,
                                  ),
                                  width10,
                                  TextWidget(
                                    title: "${post.shares} shares",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: bodyTextColor,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        post.type != 'initiative' && post.type != 'poll'
                            ? Divider(
                                color: Colors.grey.shade800,
                              )
                            : const SizedBox(),
                        post.type != 'initiative' && post.type != 'poll'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButtonWidget(
                                      title: "Like",
                                      image: Images.like,
                                      press: () {}),
                                  TextButtonWidget(
                                      title: "Comment",
                                      image: Images.comment,
                                      press: () {}),
                                  TextButtonWidget(
                                      title: "Share",
                                      image: Images.share,
                                      press: () {}),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox multiImagesMethod(Size size, PostModel post, int index) {
    return SizedBox(
        width: size.width * .85,
        height: size.height * .48,
        child: MasonryGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          itemCount: post.multipleImages.length,
          itemBuilder: (context, index) {
            return Image.asset(
              post.multipleImages[index],
              height: index == 2 ? size.height * .306 : size.height * .15,
              fit: BoxFit.cover,
            );
          },
        ));
  }

  Card initiativeMethod(PostModel post, Size size) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height5,
          Padding(
            padding: padding10,
            child: Image.asset(Images.initiative),
          ),
          height5,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextWidget(
                fontWeight: FontWeight.w400,
                title: post.type == 'initiative' ? post.desc : ''),
          ),
          height10,
          Container(
            width: size.width,
            height: size.height * .25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(Images.vidImage))),
            child: Align(
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.black45, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ))),
          ),
          Padding(
            padding: padding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Images.valunteer),
                Container(
                  color: Colors.black12,
                  width: size.width * .28,
                  height: 40,
                  child: OverlapStack.builder(
                    minSpacing: 0.5,
                    maxSpacing: 0.8,
                    leadIndex: 4,
                    itemLimit: 12,
                    itemCount: 98,
                    itemBuilder: (context, i) {
                      return CircleAvatar(
                        radius: 15,
                        foregroundImage: NetworkImage(
                          'https://i.pravatar.cc/50?u=$i',
                        ),
                      );
                    },
                    infoBuilder: (context, remaining) {
                      return CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        child: Text('+$remaining'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card pollMethod(PostModel post, Size size) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey.shade900,
      child: Padding(
          padding: padding10,
          child: Column(
            children: [
              height10,
              TextWidget(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  title: post.type == 'poll' ? post.desc : ''),
              height10,
              SizedBox(
                height: size.height * .2,
                child: ListView.builder(
                  itemCount: post.poll.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              title: '50%',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            width10,
                            TextWidget(
                              title: post.poll[index],
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            width10,
                            index == 1
                                ? const SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Card(
                                      color: Colors.blue,
                                      shape: StadiumBorder(),
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        height5,
                        Container(
                          height: 10,
                          width: index == 0
                              ? size.width * .6
                              : index == 1
                                  ? size.width * .4
                                  : size.width * .5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: index == 0
                                ? const Color(0xff11CD95)
                                : index == 1
                                    ? const Color(0xff37C9EE)
                                    : const Color(0xff9456F6),
                          ),
                        ),
                        height10
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * .23,
                    color: Colors.black12,
                    height: 40,
                    child: OverlapStack.builder(
                      minSpacing: 0.5,
                      maxSpacing: 0.8,
                      align: OverlapStackAlign.start,
                      leadIndex: 3,
                      itemLimit: 3,
                      itemCount: 3,
                      infoBuilder: (context, remaining) {
                        return const SizedBox();
                      },
                      itemBuilder: (context, i) {
                        return CircleAvatar(
                          radius: 15,
                          foregroundImage: NetworkImage(
                            'https://i.pravatar.cc/50?u=$i',
                          ),
                        );
                      },
                    ),
                  ),
                  const TextWidget(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: bodyTextColor,
                      title: "Total votes: 29"),
                  const TextWidget(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: bodyTextColor,
                      title: "●"),
                  const TextWidget(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: bodyTextColor,
                      title: "5 Days Left")
                ],
              ),
              height5
            ],
          )),
    );
  }
}

class PostModel {
  final String userProfile,
      name,
      time,
      desc,
      likes,
      comments,
      shares,
      post,
      type;
  final String? views;
  final List<String> multipleImages, poll;

  PostModel(
      {required this.userProfile,
      required this.name,
      required this.time,
      this.views = '',
      required this.desc,
      required this.poll,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.post,
      required this.type,
      required this.multipleImages});
}

List<PostModel> postList = [
  PostModel(
      poll: [],
      userProfile: Images.aisha,
      name: "Aisha Rodriguez",
      time: '1h ago',
      desc: "We will Never forget 💔 We will NEVER stop sharing",
      likes: '24',
      comments: '275',
      shares: '138',
      post: Images.pine,
      type: 'image',
      multipleImages: []),
  PostModel(
      poll: [],
      userProfile: Images.layla,
      name: "Layla Martinez",
      time: '1h ago',
      desc:
          "Support new member recruitment: opt-in and we’ll cocreate + promote a series of 3 creative tweets and aim for 82 retweets.",
      likes: '98',
      comments: '75',
      shares: '18',
      post: 'https://twitter.com/laylamatinez/post1901-929',
      type: 'link',
      multipleImages: []),
  PostModel(
      poll: ["Python", "Javascript", "Go"],
      userProfile: Images.leslie,
      name: "Leslie Alexander",
      time: '1h ago',
      desc: "What programming language do you use during the coding interview?",
      likes: '',
      comments: '',
      shares: '',
      post: '',
      type: 'poll',
      multipleImages: []),
  PostModel(
      poll: [],
      userProfile: Images.omar,
      name: "Omaar Kareem",
      time: '1h ago',
      desc:
          "Promote lung health education\nSupport new member recruitment: opt-in and we’ll cocreate + promote a series of 3 creative tweets and aim for 82 retweets.",
      likes: '',
      comments: '',
      shares: '',
      post: '',
      type: 'initiative',
      multipleImages: []),
  PostModel(
      poll: [],
      userProfile: Images.omar,
      name: "Layla Martinez",
      time: '1h ago',
      desc:
          "Promote lung health education.\nSupport new member recruitment: opt-in and we’ll cocreate + promote a series of 3 creative tweets and aim for 82 retweets.",
      likes: '24',
      comments: '275',
      shares: '138',
      post: '',
      views: '95',
      type: 'multi',
      multipleImages: [
        Images.l1,
        Images.l2,
        Images.l4,
        Images.l3,
        Images.l5,
      ]),
];
