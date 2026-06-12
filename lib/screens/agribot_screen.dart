import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isBot;

  Message({required this.text, required this.isBot});
}

class AgriBotScreen extends StatefulWidget {
  const AgriBotScreen({Key? key}) : super(key: key);

  @override
  State<AgriBotScreen> createState() => _AgriBotScreenState();
}

class _AgriBotScreenState extends State<AgriBotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [
    Message(
      text: "Hello! I'm your AgriBot Assistant. How can I help you with your farm today?",
      isBot: true,
    ),
  ];

  final List<String> _suggestions = [
    "Soil Health Tips",
    "Diagnose Crop Disease",
    "Market Prices",
    "Watering Schedule",
    "Intercropping Advice",
    "Fertilizer Guide",
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSendMessage(String query) {
    if (query.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text: query, isBot: false));
    });
    _messageController.clear();
    _scrollToBottom();

    // Simulate typing delay
    Future.delayed(const Duration(milliseconds: 600), () {
      final response = _getAgriResponse(query);
      if (mounted) {
        setState(() {
          _messages.add(Message(text: response, isBot: true));
        });
        _scrollToBottom();
      }
    });
  }

  String _getAgriResponse(String query) {
    final q = query.toLowerCase();

    if (q.contains("soil health") || q.contains("soil tips") || q.contains("healthy soil")) {
      return "🌱 Soil Health Tips:\n\n1. Test your soil pH regularly (optimal range is 6.0 - 7.5 for most crops).\n2. Add organic compost or manure to improve soil organic matter and water retention.\n3. Practice crop rotation with legumes to naturally fix nitrogen.\n4. Avoid excessive tilling to protect soil structure and beneficial microbes.";
    } else if (q.contains("soil")) {
      return "🌱 Soil Information:\n\n• Loamy Soil: Rich in organic matter, ideal drainage, and nutrients. Fits almost all crops.\n• Clay Soil: High water retention. Great for Rice/Paddy, but prone to waterlogging.\n• Sandy Soil: Fast drainage, low nutrient retention. Good for tuber crops or when mixed with organic compost.\n• Alluvial Soil: Highly fertile river basin deposits. Perfect for wheat and sugarcane.";
    } else if (q.contains("disease") || q.contains("diagnose") || q.contains("sick")) {
      return "🍂 Crop Disease Diagnosis:\n\nCommon symptoms and treatments:\n• Yellow spots on leaves: Often a sign of nitrogen deficiency or fungal infection (use organic copper-based fungicide).\n• Root rot: Caused by overwatering or poor drainage. Reduce irrigation and improve aeration.\n• White powdery coating: Powdery mildew. Apply neem oil or sulfur-based sprays.\n• Wilting stems: Could be bacterial wilt or water stress. Isolate affected plants.";
    } else if (q.contains("price") || q.contains("market") || q.contains("cost")) {
      return "📊 Market Prices (Tamil Nadu/Coimbatore Region):\n\n• Paddy/Rice: ₹2,100 - ₹2,300 per quintal\n• Wheat: ₹2,200 - ₹2,400 per quintal\n• Tomato: ₹25 - ₹35 per kg\n• Cotton: ₹6,500 - ₹7,200 per quintal\n\n*Prices fluctuate daily based on local market supply and demand.";
    } else if (q.contains("water") || q.contains("watering") || q.contains("irrigation") || q.contains("rain")) {
      return "💧 Irrigation & Watering Advice:\n\n• Clay Soil: Retains water well. Irrigate less frequently but deeply.\n• Sandy Soil: Drains quickly. Requires frequent, light watering.\n• Best time: Irrigate early morning or late evening to minimize evaporation losses.\n• Consider Drip Irrigation: Saves up to 50% water and delivers moisture directly to roots.";
    } else if (q.contains("intercrop") || q.contains("companion") || q.contains("suggestion")) {
      return "🌾 Intercropping & Companion Planting:\n\n• Wheat companions: Chickpeas (fixes nitrogen) or Mustard (repels pests).\n• Tomato companions: Marigold (controls root-knot nematodes) or Basil (improves flavor/growth).\n• Maize/Corn companions: Climbing beans (adds nitrogen) and pumpkins (covers soil to prevent weeds).\n• Sugarcane companions: Soybeans or mung beans grow quickly in row gaps.";
    } else if (q.contains("fertilizer") || q.contains("urea") || q.contains("nitrogen") || q.contains("potassium") || q.contains("npk")) {
      return "🧪 Fertilizer & Nutrient Guide:\n\n• Nitrogen (N): Promotes leafy growth. Use Urea or compost.\n• Phosphorus (P): Crucial for root development and flowering. Use DAP or bone meal.\n• Potassium (K): Enhances disease resistance and fruit quality. Use MOP (Muriate of Potash).\n• NPK Ratio: Check crop-specific recommendations (e.g. 4:2:1 for cereal crops).";
    } else if (q.contains("wheat")) {
      return "🌾 Wheat Cultivation Guide:\n\n• Soil: Prefers well-drained loamy or alluvial soils.\n• Temperature: Cool growing season (15-20°C) and warm ripening stage.\n• Companion: Plant with Chickpea/Gram or Mustard.\n• Pest control: Watch for rust diseases; use resistant seed varieties.";
    } else if (q.contains("rice") || q.contains("paddy")) {
      return "🌾 Rice/Paddy Cultivation Guide:\n\n• Soil: Heavy clay or clay loam soils that retain standing water.\n• Climate: Hot and humid tropical conditions (25-35°C).\n• Water: Needs abundant water; keep 5-10cm of standing water in early stages.\n• Companion: Plant cowpeas along field borders/bunds.";
    } else if (q.contains("tomato")) {
      return "🍅 Tomato Cultivation Guide:\n\n• Soil: Loamy or sandy soil with excellent drainage and pH of 6.0-6.8.\n• Climate: Mild temperatures (20-28°C). Sensitive to frost.\n• Companion: Basil and Marigolds.\n• Tip: Stake or cage tomato plants to keep fruit off the ground and prevent rotting.";
    } else if (q.contains("cotton")) {
      return "☁️ Cotton Cultivation Guide:\n\n• Soil: Deep alluvial or black clay soils (regur soil).\n• Climate: Warm climate (21-30°C) with at least 180 frost-free days.\n• Companion: Groundnut or cowpea.\n• Tip: Avoid waterlogging as cotton roots are highly sensitive to standing water.";
    } else if (q.contains("sugarcane")) {
      return "🎋 Sugarcane Cultivation Guide:\n\n• Soil: Deep rich loamy soils, well-drained and retentive of moisture.\n• Climate: Hot and humid tropical climate (20-30°C).\n• Growth: Long duration crop (10-12 months).\n• Companion: Intercrop with short-duration legumes like soybean or mung bean.";
    } else if (q.contains("pest") || q.contains("insect") || q.contains("bug")) {
      return "🐛 Pest & Insect Control:\n\n1. Aphids/Whiteflies: Use neem oil spray or yellow sticky traps.\n2. Nematodes: Intercrop with Marigolds which naturally repel root worms.\n3. Caterpillars: Apply Bacillus thuringiensis (Bt) or spray soap water.\n4. Encourage beneficial insects like ladybugs and lacewings which eat pests.";
    } else if (q.contains("weather") || q.contains("forecast")) {
      return "☀️ Weather and Agriculture:\n\nWeather affects planting, spraying, and harvesting times:\n• Clear skies: Ideal for harvesting, sowing, and foliar sprays.\n• High humidity: Increases risks of fungal diseases (powdery mildew, blight).\n• Rainy weather: Avoid applying fertilizers or pesticides as they will wash away.";
    } else if (q.contains("hi") || q.contains("hello") || q.contains("hey") || q.contains("greet")) {
      return "Hello! 👋 I'm AgriBot, your smart agricultural assistant. How can I help you with your crops, soil, weather, or farming tips today?";
    } else if (q.contains("thanks") || q.contains("thank you")) {
      return "You're very welcome! Happy farming! 🌾 If you have more questions, just let me know.";
    } else if (q.contains("help") || q.contains("what can you do") || q.contains("features")) {
      return "I can help you with:\n\n• Crop cultivation guides (Wheat, Rice, Tomato, etc.)\n• Pest & disease identification and treatment\n• Soil health, pH, and fertilizer recommendations\n• Watering/Irrigation advice\n• Live market price estimates\n• Intercropping suggestions\n\nAsk me anything! 🚜";
    } else {
      return "I specialize in agricultural queries. 🌾 Could you ask me about crops, pests, soil types, weather, watering schedules, or fertilizers?";
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = const Color(0xFF22C55E);
    final lightGreenBg = const Color(0xFFE8F5E9);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: lightGreenBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                color: primaryGreen,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'AgriBot Assistant',
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages history list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                if (message.isBot) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: lightGreenBg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.smart_toy_outlined,
                            color: primaryGreen,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'AgriBot',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  message.text,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF334155),
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              message.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),

          // Suggestion Chips Row
          Container(
            height: 44,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _suggestions[index];
                return GestureDetector(
                  onTap: () => _handleSendMessage(suggestion),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        suggestion,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Input Bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: primaryGreen.withOpacity(0.4), width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: "Ask about crops, pests, or weather...",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                border: InputBorder.none,
                              ),
                              onSubmitted: _handleSendMessage,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.send, color: Colors.white, size: 18),
                              onPressed: () => _handleSendMessage(_messageController.text),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
