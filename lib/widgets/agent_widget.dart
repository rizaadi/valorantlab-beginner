import 'package:flutter/material.dart';
import 'package:valorantlab/models/agent_model.dart';
import 'package:valorantlab/agent_page.dart';

class AgentWidget extends StatelessWidget {
  const AgentWidget({
    super.key,
    required this.agent,
  });

  final AgentModel agent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AgentPage(agent: agent)));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Image.network(agent.displayIcon),
      ),
    );
  }
}
