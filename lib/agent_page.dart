import 'package:flutter/material.dart';
import 'package:valorantlab/models/agent_model.dart';
import 'package:valorantlab/style/colors.dart';
import 'package:valorantlab/widgets/abilities_widget.dart';

class AgentPage extends StatefulWidget {
  final AgentModel agent;
  const AgentPage({super.key, required this.agent});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  bool _isLove = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agent.name),
        centerTitle: true,
        backgroundColor: valorantBlack,
        foregroundColor: valorantRed,
        actions: [
          IconButton(
            icon: Icon(_isLove ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              setState(() {
                _isLove = !_isLove;
              });
            },
          ),
        ],
      ),
      backgroundColor: valorantBlack,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  children: widget.agent.abilities.map((abiliti) => AbilitiesWidget(abilities: abiliti)).toList(),
                ),
                Expanded(
                  child: Image.network(widget.agent.displayFull),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 20,
                color: valorantWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.agent.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: valorantWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
