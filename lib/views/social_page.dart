import 'package:flutter/material.dart';

class Post {
  String profilePicture, name, comment;
  int like;
  Post({
    required this.name,
    required this.comment,
    required this.profilePicture,
    required this.like,
  });
}

List<Post> postList = [
  Post(
    name: "Alya Gita",
    comment: "Mark Lee is the best psychologist I've ever known",
    profilePicture: "assets/images/orang1.png",
    like: 2,
  ),
  Post(
    name: "Sara Nadya",
    comment: "I would love to recommend dr.Lee Jeno for couple therapy, he's the best!",
    profilePicture: "assets/images/orang2.png",
    like: 1,
  ),
  Post(
    name: "Putri",
    comment: "dr.Huang is so kind",
    profilePicture: "assets/images/orang3.png",
    like: 5,
  ),
  Post(
    name: "Evita",
    comment: "dr.Jaemin can help my insomnia problem in two meetings!!",
    profilePicture: "assets/images/orang4.png",
    like: 7,
  ),
];

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xff004AAD),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "Trending",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xffF4F2F1),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "Most Likes",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xffF4F2F1),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "Latest",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: postList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 250, 176),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              postList[index].profilePicture,
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postList[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                postList[index].comment,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(postList[index].like.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff004AAD),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
