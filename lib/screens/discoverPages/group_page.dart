import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  final String groupId;
  final bool isAdmin;

  const GroupPage({Key? key, required this.groupId, this.isAdmin = false})
      : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late Future<DocumentSnapshot> _groupFuture;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _groupFuture = FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .get();
    // sendQuizQuestionsToFirestore('Quiz1');
    // Add more questions
  }

  Future<List<Map<String, dynamic>>> getQuizData(String quizId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('quizzes')
        .doc(quizId)
        .collection('questions')
        .get();

    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  List<Map<String, dynamic>> generateQuizQuestions(String quizId) {
    List<Map<String, dynamic>> questions = [];

    switch (quizId) {
      case 'Quiz1':
        questions = [
          {
            'question': 'Christopher Columbus discovered America in 1492.',
            'answer': true
          },
          {
            'question': 'The Great Wall of China is visible from space.',
            'answer': false
          },
          {'question': 'The French Revolution began in 1789.', 'answer': true},
          {'question': 'Albert Einstein was born in Germany.', 'answer': true},
          {
            'question': 'The Battle of Waterloo took place in Belgium.',
            'answer': true
          },
          {
            'question': 'The first human flight occurred in the 18th century.',
            'answer': false
          },
          {
            'question':
                'The Pyramids of Giza were built during the Old Kingdom of Egypt.',
            'answer': true
          },
          {'question': 'The Titanic sank in 1911.', 'answer': false},
          {'question': 'Adolf Hitler was born in Austria.', 'answer': true},
          {'question': 'Machu Picchu is located in Peru.', 'answer': true},
        ];
        break;
      case 'Quiz2':
        // Add questions for quiz2
        break;
      case 'Quiz3':
        // Add questions for quiz3
        break;
      case 'Quiz4':
        // Add questions for quiz4
        break;
    }

    return questions;
  }

  Future<void> sendQuizQuestionsToFirestore(String quizId) async {
    List<Map<String, dynamic>> questions = generateQuizQuestions(quizId);
    CollectionReference questionsRef = FirebaseFirestore.instance
        .collection('quizzes')
        .doc(quizId)
        .collection('questions');

    for (int i = 0; i < questions.length; i++) {
      await questionsRef.doc('question$i').set(questions[i]);
    }
  }

  Widget quizSquare(BuildContext context, String quizId) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getQuizData(quizId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        List<Map<String, dynamic>> quizData = snapshot.data!;

        return GestureDetector(
          onTap: () async {
            int correctAnswers = 0;
            int incorrectAnswers = 0;
            int currentQuestion = 0;

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    if (currentQuestion < quizData.length) {
                      Map<String, dynamic> questionData =
                          quizData[currentQuestion];
                      return AlertDialog(
                        title: Text(questionData['question']),
                        content: LinearProgressIndicator(
                          value: currentQuestion / quizData.length,
                          backgroundColor: Colors.grey.shade300,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (questionData['answer']) {
                                  correctAnswers++;
                                } else {
                                  incorrectAnswers++;
                                }
                                currentQuestion++;
                              });
                            },
                            child: const Text('True'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (!questionData['answer']) {
                                  correctAnswers++;
                                } else {
                                  incorrectAnswers++;
                                }
                                currentQuestion++;
                              });
                            },
                            child: const Text('False'),
                          ),
                        ],
                      );
                    } else {
                      return AlertDialog(
                        title: const Text('Quiz Completed'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Correct answers: $correctAnswers'),
                            Text('Incorrect answers: $incorrectAnswers'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.check, color: Colors.green),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.white,
                    size: 48,
                  ),
                  Text(
                    quizId,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _groupFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        Map<String, dynamic> groupData =
            snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              groupData['groupName'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.check : Icons.add,
                  color: _isFavorite ? Colors.green : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ],
          ),
          body: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //Background Picture
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(groupData['groupBanner']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //Profile Picture
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.155,
                      left: 16,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white38,
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(groupData['groupPicture']),
                              fit: BoxFit.cover,
                            ),
                            // NetworkImage(groupData['profilePic']),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.4,
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    '${(groupData['members'] as List<dynamic>).length} Members',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: const Text(
                    'About Group',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    groupData['groupDescription'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: Colors.white,
                          indicatorColor: Colors.green,
                          tabs: [
                            Tab(
                              text: 'Challenges',
                            ),
                            Tab(
                              text: 'Explore',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  children: [
                                    quizSquare(context, 'Quiz1'),
                                    quizSquare(context, 'Quiz2'),
                                    quizSquare(context, 'Quiz3'),
                                    quizSquare(context, 'Quiz4'),
                                  ],
                                ),

//                                 GridView.count(
//   crossAxisCount: 2,
//   children: [
//     quizSquare(context, 'quiz1', 'https://your-historical-image-1-url.jpg'),
//     quizSquare(context, 'quiz2', 'https://your-historical-image-2-url.jpg'),
//     quizSquare(context, 'quiz3', 'https://your-historical-image-3-url.jpg'),
//     quizSquare(context, 'quiz4', 'https://your-historical-image-4-url.jpg'),
//   ],
// ),
                              ),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
