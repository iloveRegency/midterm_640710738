import 'package:flutter/material.dart';

const studentId = '640710738';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'สัตว์อะไรมีสี่ขา?',
      'options': ['แมว', 'ไก่', 'นก', 'งู'],
      'correctIndex': 0,
    },
    {
      'question': 'จังหวัดกรุงเทพมหานครเป็นเมืองหลวงของประเทศอะไร?',
      'options': ['ประเทศจีน', 'ประเทศลาว', 'ประเทศไทย', 'ประเทศญึ่ปุ่น'],
      'correctIndex': 2,
    },
    {
      'question': 'ปลาอะไร ขี้เกียจ?',
      'options': ['ปลาวาฬ (วานให้คนอื่นทำ ไม่ทำเอง)', 'ปลาค้าบบบบบ', 'ปลากระป๋อง', 'ปลานีโม่'],
      'correctIndex': 0,
    },
    {
      'question': 'ล้างจานยังไงมือไม่เปียก?',
      'options': ['ใช้พ่อไปล้าง', 'บังคับให้พี่สาวล้างให้', 'กินแล้วแช่ให้แม่ล้างอิอิ', 'กินแล้วล้างเอง'],
      'correctIndex': 2,
    },
    {
      'question': 'โรคอะไรถูกที่สุด?',
      'options': ['30บาทรักษาทุกโรค', 'โรคหัวใจ', 'โรคขี้กลัว', 'โรคระบาดไงคร๊าบบบ'],
      'correctIndex': 3,
    },
    {
      'question': 'มดอะไรใหญ่กว่ามด เอ็กซ์?',
      'options': ['มด XXXL', 'มด XL', 'มด S', 'มด L'],
      'correctIndex': 0,
    },
    {
      'question': 'ตัวย่อภาษาอังกฤษของประเทศไทยคืออะไร?',
      'options': ['TL', 'TH', 'HT', 'HL'],
      'correctIndex': 1,
    },
    {
      'question': 'รหัสโทรศัพท์ของประเทศไทยคืออะไร?',
      'options': ['+22', '+00', '+66', '+44'],
      'correctIndex': 2,
    },{
      'question': 'ภัยธรรมชาติข้อใดเกี่ยวข้องกับแผ่นดินไหว?',
      'options': ['วาตภัย', 'อุทกภัย', 'สึนามิ', 'อสุนีบาตภัย'],
      'correctIndex': 2,
    },{
      'question': 'การเกิดภัยธรรมชาติส่งผลกระทบต่อสังคมอย่างไร?',
      'options': ['ทำให้เราเสียชีวิต', 'ทำให้เราได้รับบาดเจ็บ', 'ทำให้เราเกิดความเครียด', 'ทำให้สาธารณูปโภคเสียหาย'],
      'correctIndex': 3,
    },


  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_colorful.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              studentId,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            _buildQuizView(currentPage),
            Spacer(),
            _buildButtonPanel(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizView(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < questions.length) {
      final questionData = questions[pageIndex];
      final question = questionData['question'] as String;
      final options = questionData['options'] as List<String>;
      final questionNumber = pageIndex + 1;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent, // สีพื้นหลังสำหรับสี่เหลี่ยม
              borderRadius: BorderRadius.circular(10.0), // ขอบมนสีเขียว
            ),
            padding: EdgeInsets.all(16.0), // ขอบสี่เหลี่ยม
            child: Column(
              children: [
                Text(
                  'คำถามที่ $questionNumber ถึง 10',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            question,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 16),
                        for (var i = 0; i < options.length; i++)
                          _buildOptionButton(
                            i,
                            options[i],
                            i == questionData['correctIndex'],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Center(child: Text('ไม่มีคำถาม'));
    }
  }


  Widget _buildOptionButton(int index, String text, bool isCorrect) {
    final optionIcons = ['A', 'B', 'C', 'D']; //ปุ่ม A B C D

    return ElevatedButton(
      onPressed: () {
        _handleAnswer(currentPage, index);
      },
      style: ElevatedButton.styleFrom(
        primary: isCorrect ? Colors.green : Colors.blue,
        onPrimary: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              optionIcons[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.black : Colors.black, // กำหนดสีให้ไอคอนตามเงื่อนไข
              ),
            ),
          ),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isCorrect ? Colors.black : Colors.black, // กำหนดสีของข้อความตามเงื่อนไข
              ),
            ),
          ),
          if (isCorrect)
            Icon(
              Icons.check_box,
              color: Colors.yellowAccent,
            ),
        ],
      ),
    );
  }

  Widget _buildButtonPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              _changePage(-1);
            },
            child: Text('Back'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // เปลี่ยนสีพื้นหลัง
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // เปลี่ยนสีของข้อความ
            )
        ),
        ElevatedButton(
            onPressed: () {
              _changePage(1);
            },
            child: Text('Next'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent), // เปลี่ยนสีพื้นหลัง
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // เปลี่ยนสีของข้อความ
            )
        ),
      ],
    );
  }

  void _changePage(int delta) {
    final newPage = currentPage + delta;
    if (newPage >= 0 && newPage < questions.length) {
      setState(() {
        currentPage = newPage;
      });
    }
  }

  void _handleAnswer(int questionIndex, int selectedOptionIndex) {
    final questionData = questions[questionIndex];
    final correctIndex = questionData['correctIndex'] as int;

    if (selectedOptionIndex == correctIndex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('คำตอบถูกต้อง!'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('คำตอบผิด! ลองอีกครั้ง'),
          duration: Duration(seconds: 2),
        ),
      );
      return; // ไม่ทำการเปลี่ยนหน้าถ้าเลือกคำตอบผิด
    }

    _changePage(1); // เปลี่ยนหน้าถ้าคำตอบถูก
  }

}

