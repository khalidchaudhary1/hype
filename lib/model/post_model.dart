import '../view/view.dart';

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
