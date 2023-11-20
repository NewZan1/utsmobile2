import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<String> _filteredList;
  String _keywords = '';
  final List<String> _originList = [
    'Alisson Becker',
    'Antoine Griezmann',
    'Bukayo Saka',
    'Bernardo Silva',
    'Bruno Fernandes',
    'Casemiro',
    'Cesc Fabregas',
    'Cristiano Ronaldo',
    'David Silva',
    'David Beckham',
    'Eden Hazard',
    'Eric Cantona',
    'Esteban Cambiasso',
    'Francesco Totti',
    'Fernando Torres',
    'Gianluigi Buffon',
    'Giorgio Chiellini',
    'Gerd Muller',
    'Harry Kane',
    'Hugo Lloris',
    'Iniesta',
    'Ivan Rakitic',
    'Ilkay Gundogan',
    'Johan Cruyff',
    'Joe Gomez',
    'Kevin De Bruyne',
    'Kylian Mbappe',
    'Karim Benzema',
    'Lionel Messi',
    'Luca Modric',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredList = [];
    _originList.sort();
    _searchController.addListener(() {
      debugPrint('search value : ${_searchController.text}');
      setState(() => _keywords = _searchController.text);
      _search();
    });
    super.initState();
  }

  void _search() {
    _filteredList.clear();
    for (int i = 0; i < _originList.length; i++) {
      String item = _originList[i];
      if (item.toLowerCase().contains(_keywords.toLowerCase())) {
        _filteredList.add(item);
      }
    }
  }

  Widget _buildList({required List<String> list}) => Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                list[index],
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const Divider(height: 2, color: Colors.blue),
          itemCount: list.length,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          ),
          _buildList(list: _keywords.isEmpty ? _originList : _filteredList)
        ],
      ),
    );
  }
}
