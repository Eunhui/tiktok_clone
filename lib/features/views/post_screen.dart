import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/view_models/post_view_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  static const String routeURL = '/post';
  static const String routeName = 'post';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '🔥MOOD🔥',
            style: TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Gaps.v20,
              Text(
                "How do you feel?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Sizes.size20),
              ),
              Gaps.v20,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white, // 배경색을 설정합니다.
                  borderRadius: BorderRadius.circular(12.0), // 테두리를 둥글게 만듭니다.
                  border: Border.all(
                    color: Colors.black, // 테두리 색상을 설정합니다.
                    width: 1.0, // 테두리 두께를 설정합니다.
                  ),
                ),
                child: TextField(
                  controller: _controller,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write it down here!',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("🔥"),
              ),
              Gaps.v20,
              SizedBox(
                width: 500,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink.shade400,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      //await PostViewModel.uploadPost(_controller.text, "🔥");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Post uploaded successfully')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  },
                  child: const Text("Post"),
                ),
              )
            ],
          ),
        ));
  }
}
