import 'package:api_news/controllers/post_controller.dart';
import 'package:api_news/views/widgets/post_data.dart';
import 'package:api_news/views/widgets/post_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final PostController _postController = Get.put(PostController());
  @override
  void initState() {
    _postController.getAllPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // var token = box.read('token');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PostField(
              controller: _textEditingController,
              hintText: 'What do you want to ask?',
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10)),
                onPressed: () async {
                  await _postController.createPost(
                    body: _textEditingController.text.trim(),
                  );
                  _textEditingController.clear();
                  _postController.getAllPosts();
                },
                child: Obx(() {
                  return _postController.isLoading.value
                      ? const CircularProgressIndicator()
                      : Text(
                          "Post",
                        );
                })),
            const SizedBox(
              height: 20,
            ),
            Text("POSTS",
                style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return _postController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _postController.posts.value.length,
                      itemBuilder: ((context, index) {
                        return PostData(
                            post: _postController.posts.value[index]);
                      }),
                    );
            }),
          ]),
        ),
      ),
    );
  }
}
