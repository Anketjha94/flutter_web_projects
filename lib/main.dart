import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(home: PortfolioApp(), debugShowCheckedModeBanner: false),
);

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF00D2FF);
    const Color bgDark = Color(0xFF050A18);
    const Color cardBg = Color(0xFF0F172A);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        backgroundColor: bgDark.withOpacity(0.9),
        elevation: 0,
        title: const Text(
          "Portfolio",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          _navItem("Home", () => _scrollToSection(_homeKey)),
          _navItem("About", () => _scrollToSection(_aboutKey)),
          _navItem("Projects", () => _scrollToSection(_projectsKey)),
          _navItem("Skills", () => _scrollToSection(_skillsKey)),
          _navItem("Contact", () => _scrollToSection(_contactKey)),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HERO SECTION ---
            Container(
              key: _homeKey,
              height: 600,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _tag("Welcome to my portfolio"),
                        const SizedBox(height: 20),
                        const Text(
                          "Hi, I'm Anket kumar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        const Text(
                          "Flutter Developer",
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'In Flutter development,'
                          'Lorem ipsum" is used as placeholder text for UI design and testing. '
                          'You can generate this text easily using dedicated packages from pub.dev or '
                          'via built-in shortcuts in code editors. ',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        // Wrap prevents the "92 pixels overflow" error
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            _actionBtn(
                              "View My Work",
                              primaryBlue,
                              Colors.black,
                            ),
                            _actionBtn(
                              "Get In Touch",
                              Colors.transparent,
                              Colors.white,
                              border: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 200,
                        backgroundColor: Colors.white10,
                        backgroundImage: const AssetImage(
                          'assets/images/Akshay3.jpeg',
                        ), // LOCAL ASSET
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- ABOUT ME SECTION ---
            Container(key: _aboutKey, child: _sectionHeader("About Me")),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text(
                'A Lorem Ipsum generator for Flutter developers is a must-have tool for efficiently creating placeholder text during app development.'
                ' It helps developers quickly focus on the design and functionality of their app, while still ensuring that the layout looks good with text in place. '
                'Whether you need a basic generator or one with advanced features, there is a variety of options available to suit your needs.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            _buildFeatureGrid(cardBg, primaryBlue),

            //--- PROJECTS SECTION ---
            Container(key: _projectsKey, child: _sectionHeader("Featured Projects")),
            _buildProjectGrid(cardBg, primaryBlue),

            // --- SKILLS SECTION ---
            Container(key: _skillsKey, child: _sectionHeader("My Skills")),
            _buildSkillsSection(cardBg, primaryBlue),

            // --- CONTACT SECTION ---
            Container(key: _contactKey, child: _sectionHeader("Get In Touch")),
            _buildContactSection(cardBg, primaryBlue),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // --- UI Helper Components ---
  Widget _navItem(String title, VoidCallback onTap) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextButton(
      onPressed: onTap,
      child: Text(title, style: const TextStyle(color: Colors.white70)),
    ),
  );

  Widget _tag(String txt) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFF00D2FF).withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(txt, style: const TextStyle(color: Color(0xFF00D2FF))),
  );

  Widget _actionBtn(String txt, Color bg, Color text, {bool border = false}) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(30),
          border: border ? Border.all(color: Colors.white24) : null,
        ),
        child: Text(
          txt,
          style: TextStyle(color: text, fontWeight: FontWeight.bold),
        ),
      );

  Widget _sectionHeader(String title) => Padding(
    padding: const EdgeInsets.only(top: 80, bottom: 20),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 4,
          width: 60,
          color: const Color(0xFF00D2FF),
        ),
      ],
    ),
  );

  Widget _buildFeatureGrid(Color cardBg, Color accent) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          _infoCard(Icons.code, "Clean Code", cardBg, accent),
          _infoCard(Icons.palette, "UI/UX Design", cardBg, accent),
          _infoCard(Icons.speed, "Fast Performance", cardBg, accent),
          _infoCard(Icons.group, "Team Player", cardBg, accent),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, Color bg, Color accent) =>
      Container(
        width: 250,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, color: accent, size: 40),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget _buildProjectGrid(Color cardBg, Color accent) {
     //List of local asset paths
    final List<String> projectAssetPaths = [
     'assets/images/Education.jpg',
      'assets/images/food1.jpg',
      'assets/images/news.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          3,
          (index) => Container(
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior:
                Clip.antiAlias, // Important for rounded corners on images
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    projectAssetPaths[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.white10,
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white24,
                      ),
                    ),
                  ),
               ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project ${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Built with Flutter & Firebase",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsSection(Color cardBg, Color accent) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _skillCategory(
              "Mobile Development",
              ["Flutter", "Dart", "Provider/Riverpod", "Firebase"],
              accent,
              cardBg,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _skillCategory(
              "Tools & Others",
              ["Git", "Docker", "Figma", "CI/CD"],
              accent,
              cardBg,
            ),
          ),
        ],
      ),
    );
  }

  Widget _skillCategory(
    String title,
    List<String> skills,
    Color accent,
    Color bg,
  ) => Container(
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...skills.map(
          (s) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s, style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: 0.8,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation(accent),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildContactSection(Color bg, Color accent) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.white54),
                  title: Text(
                    "Akshayjha9694@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.white54),
                  title: Text(
                    "Bihar, India",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    hintStyle: const TextStyle(color: Colors.white24),
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _actionBtn("Send Message", accent, Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
