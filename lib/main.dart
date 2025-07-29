import 'package:flutter/material.dart';

void main() => runApp(const MyDemoApp());

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        fontFamily: 'Kanit',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Kanit'),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            textStyle: const TextStyle(fontSize: 18, fontFamily: 'Kanit'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF1E3A8A),
            elevation: 4,
          ),
        ),
      ),
      title: 'AS-05: Button and Navigator',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigate(BuildContext context, Widget page, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าแรก',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kanit', color: Colors.white)),
        backgroundColor: Color(0xFF3B82F6),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDBEAFE), Color(0xFF93C5FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'ยินดีต้อนรับสู่แอปนักศึกษา',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 70),
                shadowColor: Color(0xFF1E3A8A).withOpacity(0.3),
              ),
              onPressed: () {
                _navigate(context, const SemesterSelectionPage(), 'ผลการเรียน');
              },
              child: const Text('ผลการเรียน 5 เทอม',
                  style: TextStyle(fontSize: 18, fontFamily: 'Kanit')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6366F1),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: () {
                _navigate(context, const LearningOutcomesPage(),
                    'ผลลัพธ์การเรียนรู้');
              },
              child: const Text('ผลลัพธ์การเรียนรู้',
                  style: TextStyle(fontSize: 18, fontFamily: 'Kanit')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5CF6),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: () {
                _navigate(context, const ProfilePage(), 'โปรไฟล์ส่วนตัว');
              },
              child: const Text('โปรไฟล์ส่วนตัว',
                  style: TextStyle(fontSize: 18, fontFamily: 'Kanit')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEF4444),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('ออกจากแอป',
                  style: TextStyle(fontSize: 18, fontFamily: 'Kanit')),
            ),
          ],
        ),
      ),
    );
  }
}

class SemesterSelectionPage extends StatelessWidget {
  const SemesterSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final semesters = [
      'เทอม 1 ปี 1',
      'เทอม 2 ปี 1',
      'เทอม 1 ปี 2',
      'เทอม 2 ปี 2',
      'เทอม 1 ปี 3',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('เลือกเทอม',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kanit', color: Colors.white)),
        backgroundColor: Color(0xFF3B82F6),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDBEAFE), Color(0xFF93C5FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: semesters.length,
          itemBuilder: (context, index) {
            final colors = [
              Color(0xFF3B82F6),
              Color(0xFF6366F1),
              Color(0xFF8B5CF6),
              Color(0xFFA855F7),
              Color(0xFFEC4899),
            ];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[index % colors.length],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 70),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GradesPage(semester: semesters[index]),
                    ),
                  );
                },
                child: Text(semesters[index],
                    style: const TextStyle(fontSize: 18, fontFamily: 'Kanit')),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Color(0xFF3B82F6),
        child: const Icon(Icons.arrow_back, color: Colors.white),
        tooltip: 'ย้อนกลับ',
      ),
    );
  }
}

class GradesPage extends StatelessWidget {
  final String semester;

  const GradesPage({super.key, required this.semester});

  @override
  Widget build(BuildContext context) {
    final grades = {
      'เทอม 1 ปี 1': [
        {
          'code': 'GEBSO503',
          'name': 'มนุษยสัมพันธ์',
          'credits': 3,
          'grade': 'C',
          'points': 6
        },
        {
          'code': 'GEBSC301',
          'name': 'เทคโนโลยีสารสนเทศที่จำเป็นในชีวิตประจำวัน',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE102',
          'name': 'พีชคณิตเชิงเส้นสำหรับวิศวกรรม',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'ENGSE207',
          'name': 'สถาปัตยกรรมซอฟต์แวร์',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGRA017',
          'name': 'ระบบอัตโนมัติในโรงงาน',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGSE502',
          'name': 'ระบบฝังตัวและระบบอินเทอร์เน็ตในทุกสิ่ง',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'BBAIS823',
          'name': 'การใช้โปรแกรมสำนักงานสมัยใหม่',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
      ],
      'เทอม 2 ปี 1': [
        {
          'code': 'GEBIN702',
          'name': 'นวัตกรรมและเทคโนโลยี',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE202',
          'name': 'ระบบปฏิบัติการและการจัดโครงแบบเครื่องแม่ข่าย',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'GEBLC103',
          'name': 'ภาษาอังกฤษเชิงวิชาการ',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGSE203',
          'name': 'การเขียนโปรแกรมสำหรับวิศวกรซอฟต์แวร์',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'ENGSE218',
          'name': 'โครงสร้างและสถาปัตยกรรมคอมพิวเตอร์',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGSE216',
          'name': 'โครงสร้างข้อมูลและขั้นตอนวิธี',
          'credits': 3,
          'grade': 'D',
          'points': 3
        },
        {
          'code': 'ENGSE206',
          'name': 'การกำหนดความต้องการและการออกแบบทางซอฟต์แวร์',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
      ],
      'เทอม 1 ปี 2': [
        {
          'code': 'ENGSE101',
          'name': 'คณิตศาสตร์ดิสครีต',
          'credits': 3,
          'grade': 'B',
          'points': 9
        },
        {
          'code': 'ENGSE100',
          'name': 'ความน่าจะเป็นและสถิติในงานวิศวกรรม',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE204',
          'name': 'การเขียนโปรแกรมเชิงวัตถุ',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'ENGSE205',
          'name': 'กระบวนการซอฟต์แวร์และการประกันคุณภาพ',
          'credits': 3,
          'grade': 'B',
          'points': 9
        },
        {
          'code': 'ENGSE219',
          'name': 'ระบบฐานข้อมูล',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'ENGSE503',
          'name': 'การประมวลผลภาพดิจิทัล และการมองเห็นโดยคอมพิวเตอร์',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'GEBHT601',
          'name': 'กิจกรรมเพื่อสุขภาพ',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
      ],
      'เทอม 2 ปี 2': [
        {
          'code': 'GEBSO503',
          'name': 'มนุษยสัมพันธ์',
          'credits': 3,
          'grade': 'C',
          'points': 6
        },
        {
          'code': 'GEBSC301',
          'name': 'เทคโนโลยีสารสนเทศที่จำเป็นในชีวิตประจำวัน',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE102',
          'name': 'พีชคณิตเชิงเส้นสำหรับวิศวกรรม',
          'credits': 3,
          'grade': 'C+',
          'points': 7.5
        },
        {
          'code': 'ENGSE207',
          'name': 'สถาปัตยกรรมซอฟต์แวร์',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGRA017',
          'name': 'ระบบอัตโนมัติในโรงงาน',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGSE502',
          'name': 'ระบบฝังตัวและระบบอินเทอร์เน็ตในทุกสิ่ง',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'BBAIS823',
          'name': 'การใช้โปรแกรมสำนักงานสมัยใหม่',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
      ],
      'เทอม 1 ปี 3': [
        {
          'code': 'ENGSE301',
          'name': 'Software Testing',
          'credits': 3,
          'grade': 'B',
          'points': 9
        },
        {
          'code': 'ENGSE302',
          'name': 'Web Development',
          'credits': 3,
          'grade': 'A-',
          'points': 11
        },
        {
          'code': 'ENGSE303',
          'name': 'Project Management',
          'credits': 3,
          'grade': 'B+',
          'points': 10.5
        },
        {
          'code': 'ENGSE304',
          'name': 'AI Fundamentals',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE305',
          'name': 'Network Security',
          'credits': 3,
          'grade': 'B',
          'points': 9
        },
        {
          'code': 'GEBSC401',
          'name': 'Ethics in IT',
          'credits': 3,
          'grade': 'A',
          'points': 12
        },
        {
          'code': 'ENGSE306',
          'name': 'Final Project',
          'credits': 3,
          'grade': 'A-',
          'points': 11
        },
      ],
    };

    final courses = grades[semester] ?? [];

    Color getGradeColor(String grade) {
      switch (grade) {
        case 'A':
        case 'A-':
          return Color(0xFF10B981);
        case 'B+':
        case 'B':
        case 'B-':
          return Color(0xFF3B82F6);
        case 'C+':
        case 'C':
          return Color(0xFFF59E0B);
        case 'D+':
        case 'D':
          return Color(0xFFEF4444);
        default:
          return Color(0xFF6B7280);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(semester,
            style: const TextStyle(
                fontSize: 20, fontFamily: 'Kanit', color: Colors.white)),
        backgroundColor: Color(0xFF3B82F6),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDBEAFE), Color(0xFF93C5FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              elevation: 6,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFF8FAFC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text('${course['code']} - ${course['name']}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('หน่วยกิต: ${course['credits']}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Kanit',
                            color: Color(0xFF6B7280))),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: getGradeColor(course['grade'].toString()),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('เกรด ${course['grade']}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Kanit',
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Color(0xFF3B82F6),
        child: const Icon(Icons.arrow_back, color: Colors.white),
        tooltip: 'ย้อนกลับ',
      ),
    );
  }
}

class LearningOutcomesPage extends StatelessWidget {
  const LearningOutcomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final outcomes = [
      {
        'year': 'ปี 1',
        'knowledge':
            'ความรู้พื้นฐานด้านคณิตศาสตร์, การเขียนโปรแกรม, และภาษาอังกฤษ',
        'skills':
            'สามารถเขียนโปรแกรมพื้นฐานด้วย Python, อ่านและเขียนภาษาอังกฤษได้ดีขึ้น',
        'color': Color(0xFF3B82F6),
      },
      {
        'year': 'ปี 2',
        'knowledge': 'ความรู้ด้านฐานข้อมูล, UI/UX, และแคลคูลัส',
        'skills':
            'ออกแบบฐานข้อมูลเบื้องต้น, สร้าง UI ที่ใช้งานง่าย, คำนวณแคลคูลัสขั้นสูง',
        'color': Color(0xFF8B5CF6),
      },
      {
        'year': 'ปี 3',
        'knowledge': 'ความรู้ด้านวิศวกรรมซอฟต์แวร์และความปลอดภัยไซเบอร์',
        'skills':
            'พัฒนาซอฟต์แวร์ตามกระบวนการ SDLC, ป้องกันภัยคุกคามทางไซเบอร์เบื้องต้น',
        'color': Color(0xFF10B981),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลลัพธ์การเรียนรู้',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kanit', color: Colors.white)),
        backgroundColor: Color(0xFF6366F1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDDD6FE), Color(0xFFA5B4FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: outcomes.length,
          itemBuilder: (context, index) {
            final outcome = outcomes[index];
            return Card(
              elevation: 6,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFF8FAFC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: outcome['color'] as Color,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          outcome['year'] as String,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F9FF),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF0EA5E9), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📚 ความรู้ที่ได้รับ',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0EA5E9)),
                            ),
                            SizedBox(height: 8),
                            Text(outcome['knowledge'] as String,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Kanit',
                                    height: 1.5)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF10B981), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🎯 ทักษะที่ได้รับ',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF10B981)),
                            ),
                            SizedBox(height: 8),
                            Text(outcome['skills'] as String,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Kanit',
                                    height: 1.5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Color(0xFF6366F1),
        child: const Icon(Icons.arrow_back, color: Colors.white),
        tooltip: 'ย้อนกลับ',
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์ส่วนตัว',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kanit', color: Colors.white)),
        backgroundColor: Color(0xFF8B5CF6),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE9D5FF), Color(0xFFC4B5FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8B5CF6).withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/profile.jpg', // ระบุ path ของภาพ
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'นายอิทธิพล โคตา',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                          color: Color(0xFF1F2937)),
                    ),
                    Text(
                      'รหัสนักศึกษา: 66543210035-2',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFF8FAFC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader(
                            '📧 ข้อมูลติดต่อ', Color(0xFF3B82F6)),
                        const SizedBox(height: 12),
                        _buildInfoRow('อีเมล', 'example@uni.ac.th'),
                        _buildInfoRow('เบอร์โทร', '081-234-5678'),
                        const SizedBox(height: 20),
                        _buildSectionHeader('❤️ ความชอบ', Color(0xFFEC4899)),
                        const SizedBox(height: 12),
                        _buildBulletPoint('ชอบเขียนโค้ดและพัฒนาแอป'),
                        _buildBulletPoint('ชอบเล่นเกมและดูหนัง'),
                        _buildBulletPoint('ชอบฟังเพลงและเดินทาง'),
                        const SizedBox(height: 20),
                        _buildSectionHeader('🎯 ความถนัด', Color(0xFF10B981)),
                        const SizedBox(height: 12),
                        _buildBulletPoint('การเขียนโปรแกรม Flutter และ Python'),
                        _buildBulletPoint('การออกแบบ UI/UX'),
                        _buildBulletPoint('การแก้ปัญหาเชิงตรรกะ'),
                        const SizedBox(height: 20),
                        _buildSectionHeader(
                            '⭐ ความสามารถพิเศษ', Color(0xFFF59E0B)),
                        const SizedBox(height: 12),
                        _buildBulletPoint('พัฒนาแอปข้ามแพลตฟอร์ม'),
                        _buildBulletPoint('การแก้ปัญหาด้านเทคนิคอย่างรวดเร็ว'),
                        _buildBulletPoint('การทำงานเป็นทีมและการนำเสนอ'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Color(0xFF8B5CF6),
        child: const Icon(Icons.arrow_back, color: Colors.white),
        tooltip: 'ย้อนกลับ',
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kanit',
          color: color,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Kanit',
                color: Color(0xFF6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFF6B7280),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Kanit',
                color: Color(0xFF374151),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
