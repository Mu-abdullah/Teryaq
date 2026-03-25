import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Today', 'Upcoming', 'Completed'];
  int _currentIndex = 0;
  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const Text(
                'Dr. Sarah Johnson',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_active, size: 28),
            color: const Color(0xFF2C3E50),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3498DB), Color(0xFF2C3E50)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('12', 'Patients'),
          _buildStatItem('4', 'Appointments'),
          _buildStatItem('2', 'Urgent'),
          _buildStatItem('8', 'Follow Up'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.white.withValues(alpha:0.8)),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton(Icons.calendar_today, 'Schedule'),
              _buildActionButton(Icons.assignment, 'Prescription'),
              _buildActionButton(Icons.videocam, 'Telehealth'),
              _buildActionButton(Icons.medication, 'Medications'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha:0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: const Color(0xFF3498DB), size: 28),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildPatientCard(
    String name,
    String status,
    String time,
    String reason,
  ) {
    Color statusColor;
    switch (status) {
      case 'Waiting':
        statusColor = Colors.orange;
        break;
      case 'In Progress':
        statusColor = Colors.blue;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    reason,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsSection() {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  "Today's Appointments",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, size: 24),
                  onPressed: () {
                    setState(() {
                      _showSearch = !_showSearch;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_showSearch)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search patients...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),
            ),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF3498DB),
            labelColor: const Color(0xFF2C3E50),
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Today Tab
                ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    _buildPatientCard(
                      'Robert Johnson',
                      'Waiting',
                      '09:30 AM',
                      'Fever & headache',
                    ),
                    _buildPatientCard(
                      'Emily Davis',
                      'In Progress',
                      '10:15 AM',
                      'Annual checkup',
                    ),
                    _buildPatientCard(
                      'Michael Wilson',
                      'Waiting',
                      '11:00 AM',
                      'Back pain',
                    ),
                    _buildPatientCard(
                      'Sophia Martinez',
                      'Waiting',
                      '01:30 PM',
                      'Allergy symptoms',
                    ),
                    _buildPatientCard(
                      'David Anderson',
                      'Completed',
                      '08:45 AM',
                      'Vaccination',
                    ),
                  ],
                ),
                // Upcoming Tab
                ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    _buildPatientCard(
                      'Jennifer Lee',
                      'Scheduled',
                      '10:00 AM',
                      'Follow up',
                    ),
                    _buildPatientCard(
                      'Thomas Brown',
                      'Scheduled',
                      '11:30 AM',
                      'Blood test results',
                    ),
                    _buildPatientCard(
                      'Lisa Taylor',
                      'Scheduled',
                      '02:15 PM',
                      'Consultation',
                    ),
                  ],
                ),
                // Completed Tab
                ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    _buildPatientCard(
                      'David Anderson',
                      'Completed',
                      '08:45 AM',
                      'Vaccination',
                    ),
                    _buildPatientCard(
                      'James Miller',
                      'Completed',
                      'Yesterday',
                      'Physical exam',
                    ),
                    _buildPatientCard(
                      'Emma Wilson',
                      'Completed',
                      'Yesterday',
                      'Prescription refill',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediCare Dashboard'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildStatsCard(),
            _buildQuickActions(),
            const Divider(height: 20, thickness: 1),
            _buildAppointmentsSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF3498DB),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Patients'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3498DB),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
