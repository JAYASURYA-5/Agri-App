import 'package:flutter/material.dart';
import '../widgets/weather_card.dart';
import '../widgets/live_data_card.dart';
import '../widgets/intercrop_card.dart';
import '../widgets/quick_action_button.dart';
import 'weather_forecast_screen.dart';
import 'intercrop_advisor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Greeting
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF22C55E), width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=120&q=80',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Arigrow',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8F5E9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.brightness_2_outlined, // Moon icon
                          color: Color(0xFF22C55E),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8F5E9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none, // Bell icon
                          color: Color(0xFF22C55E),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Greeting Text
                  RichText(
                    text: const TextSpan(
                      text: 'Good Morning, \n',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Jayasurya K!',
                          style: TextStyle(
                            color: Color(0xFF22C55E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Weather Card (Coimbatore)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FDF9), // Extremely soft green-tinted card background
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE8F5E9), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Farmer Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=800&q=80',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Coimbatore location
                          Row(
                            children: const [
                              Icon(Icons.location_on, color: Color(0xFF22C55E), size: 20),
                              SizedBox(width: 6),
                              Text(
                                'COIMBATORE',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF374151),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Current Weather',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '31°C',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Overcast',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // No rain expected
                          Row(
                            children: const [
                              Icon(Icons.check_box, color: Color(0xFF22C55E), size: 20),
                              SizedBox(width: 6),
                              Text(
                                'No rain expected',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Humidity & Wind Speed row
                          Row(
                            children: [
                              // Humidity
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.opacity, color: Color(0xFF22C55E), size: 24),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Humidity',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '48%',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Wind Speed
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.air, color: Color(0xFF22C55E), size: 24),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Wind Speed',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '13 km/h',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // View Detailed Forecast Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WeatherForecastScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.calendar_today, color: Colors.black, size: 18),
                              label: const Text(
                                'View Detailed Forecast',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00FF66), // Vibrant neon green
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Intercrop Update Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFFCD34D),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.warning_rounded,
                          color: Color(0xFFEAB308),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Latest update on intercrop\nsuggestions',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Check intercrop suggestions for\npest control.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IntercropAdvisorScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF22C55E),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'View Suggestions',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Live Data Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Live Data',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFC2FBD7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.smart_toy_outlined, // Robot icon
                          color: Color(0xFF22C55E),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.35,
                    children: const [
                      LiveDataCard(
                        icon: Icons.water_drop,
                        iconColor: Color(0xFF06B6D4),
                        title: 'Soil Moisture',
                        value: '62%',
                        status: 'Optimal',
                        backgroundColor: Color(0xFFECF9FF),
                      ),
                      LiveDataCard(
                        icon: Icons.thermostat,
                        iconColor: Color(0xFFFF6B35),
                        title: 'Temperature',
                        value: '24°C',
                        status: 'Optimal',
                        backgroundColor: Color(0xFFFFF5ED),
                      ),
                      LiveDataCard(
                        icon: Icons.opacity,
                        iconColor: Color(0xFF06B6D4),
                        title: 'Humidity',
                        value: '68%',
                        status: 'Optimal',
                        backgroundColor: Color(0xFFECF9FF),
                      ),
                      LiveDataCard(
                        icon: Icons.science,
                        iconColor: Color(0xFFA855F7),
                        title: 'Soil pH',
                        value: '6.8',
                        status: 'Optimal',
                        backgroundColor: Color(0xFFF3E8FF),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Intercrop Suggestion Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Intercrop Suggestion',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'View Report',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF22C55E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const IntercropCard(
                    cropHealth: '92%',
                    healthDescription:
                        'Your crops are in excellent\ncondition. Minimal stress detected\nacross all zones.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9,
                    children: const [
                      QuickActionButton(
                        icon: Icons.school,
                        label: 'LMS',
                        color: Color(0xFFE8EAF6),
                        iconColor: Color(0xFF3F51B5),
                      ),
                      QuickActionButton(
                        icon: Icons.photo_camera_outlined,
                        label: 'Disease\nDetection',
                        color: Color(0xFFFFEBEE),
                        iconColor: Color(0xFFE53935),
                      ),
                      QuickActionButton(
                        icon: Icons.article_outlined,
                        label: 'Notes',
                        color: Color(0xFFFFFDE7),
                        iconColor: Color(0xFFFBC02D),
                      ),
                      QuickActionButton(
                        icon: Icons.newspaper_outlined,
                        label: 'News',
                        color: Color(0xFFFFF3E0),
                        iconColor: Color(0xFFF57C00),
                      ),
                      QuickActionButton(
                        icon: Icons.verified_user_outlined,
                        label: 'Scheme',
                        color: Color(0xFFE8F8F5),
                        iconColor: Color(0xFF00BFA5),
                      ),
                      QuickActionButton(
                        icon: Icons.trending_up,
                        label: 'Market\nPrices',
                        color: Color(0xFFFFF8E1),
                        iconColor: Color(0xFFFFB300),
                      ),
                      QuickActionButton(
                        icon: Icons.credit_card_outlined,
                        label: 'Finance',
                        color: Color(0xFFEDE7F6),
                        iconColor: Color(0xFF673AB7),
                      ),
                      QuickActionButton(
                        icon: Icons.calendar_month_outlined,
                        label: 'Crop\nCalendar',
                        color: Color(0xFFE0F7FA),
                        iconColor: Color(0xFF00ACC1),
                      ),
                      QuickActionButton(
                        icon: Icons.pets,
                        label: 'Livestock',
                        color: Color(0xFFFBE9E7),
                        iconColor: Color(0xFFFF5722),
                      ),
                      QuickActionButton(
                        icon: Icons.hub_outlined,
                        label: 'AgriHub',
                        color: Color(0xFFE8F5E9),
                        iconColor: Color(0xFF4CAF50),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'LMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Livestock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF22C55E),
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
}
