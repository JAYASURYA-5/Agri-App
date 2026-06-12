import 'package:flutter/material.dart';
import '../widgets/weather_card.dart';
import '../widgets/live_data_card.dart';
import '../widgets/intercrop_card.dart';
import '../widgets/quick_action_button.dart';
import 'weather_forecast_screen.dart';

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
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF3B82F6),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Arigrow',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 14, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                'Good Afternoon',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.schedule,
                          color: Color(0xFF22C55E),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_active,
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
                      text: 'Good Afternoon, ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Google\nUser',
                          style: TextStyle(
                            color: Color(0xFF22C55E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Field Image (placeholder)
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=800&q=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Weather Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'SALEM, INDIA',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const WeatherCard(
                    location: 'Salem, India',
                    temperature: '32',
                    condition: 'Partly Cloudy',
                    noRain: true,
                  ),
                ],
              ),
            ),

            // Second Location Weather
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'NEW DELHI',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const WeatherCard(
                    location: 'New Delhi',
                    temperature: '30',
                    condition: 'Mainly Clear',
                    noRain: true,
                    showDetails: true,
                    humidity: '69',
                    windSpeed: '11 km/h',
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WeatherForecastScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'View Detailed Forecast',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
                        onPressed: () {},
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.bluetooth_connected,
                          color: Color(0xFF22C55E),
                          size: 20,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: const [
                      QuickActionButton(
                        icon: Icons.school,
                        label: 'LMS',
                        color: Color(0xFFE0E7FF),
                        iconColor: Color(0xFF6366F1),
                      ),
                      QuickActionButton(
                        icon: Icons.camera_alt,
                        label: 'Disease\nDetection',
                        color: Color(0xFFFEE2E2),
                        iconColor: Color(0xFFEF4444),
                      ),
                      QuickActionButton(
                        icon: Icons.description,
                        label: 'Notes',
                        color: Color(0xFFFEF3C7),
                        iconColor: Color(0xFFEAB308),
                      ),
                      QuickActionButton(
                        icon: Icons.newspaper,
                        label: 'News',
                        color: Color(0xFFFEE2E2),
                        iconColor: Color(0xFFEF4444),
                      ),
                      QuickActionButton(
                        icon: Icons.security,
                        label: 'Scheme',
                        color: Color(0xFFD1FAE5),
                        iconColor: Color(0xFF10B981),
                      ),
                      QuickActionButton(
                        icon: Icons.trending_up,
                        label: 'Market\nPrices',
                        color: Color(0xFFFEF3C7),
                        iconColor: Color(0xFFEAB308),
                      ),
                      QuickActionButton(
                        icon: Icons.wallet,
                        label: 'Finance',
                        color: Color(0xFFE0E7FF),
                        iconColor: Color(0xFF6366F1),
                      ),
                      QuickActionButton(
                        icon: Icons.calendar_today,
                        label: 'Crop\nCalendar',
                        color: Color(0xFFCFFAFE),
                        iconColor: Color(0xFF06B6D4),
                      ),
                      QuickActionButton(
                        icon: Icons.pets,
                        label: 'Livestock',
                        color: Color(0xFFFED7AA),
                        iconColor: Color(0xFFEA580C),
                      ),
                      QuickActionButton(
                        icon: Icons.hub,
                        label: 'AgriHub',
                        color: Color(0xFFD1FAE5),
                        iconColor: Color(0xFF10B981),
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
