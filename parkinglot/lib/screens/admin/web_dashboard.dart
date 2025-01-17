class AdminWebDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Overview'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.approval),
                label: Text('Pending Approvals'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.history),
                label: Text('History'),
              ),
            ],
            onDestinationSelected: (index) {
              // Handle navigation
            },
          ),
          Expanded(
            child: AdminDashboardContent(),
          ),
        ],
      ),
    );
  }
}