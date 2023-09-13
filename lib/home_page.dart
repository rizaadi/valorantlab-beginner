import 'package:flutter/material.dart';
import 'package:valorantlab/models/agent_model.dart';
import 'package:valorantlab/style/colors.dart';
import 'package:valorantlab/widgets/agent_widget.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text(
              'Logout',
              style: TextStyle(color: valorantWhite, fontWeight: FontWeight.w500),
            ),
            content: const Text(
              'Are you sure want to logout ?',
              style: TextStyle(color: valorantWhite),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: valorantWhite),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'OK',
                  style: TextStyle(color: valorantRed),
                ),
              ),
            ],
            backgroundColor: valorantBlack,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: valorantRed,
          foregroundColor: valorantWhite,
          title: Text(
            username,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: valorantBlack,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AGENT",
                  style: TextStyle(
                    fontSize: 35,
                    color: valorantWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Duelist",
                  style: TextStyle(
                    fontSize: 20,
                    color: valorantWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: agentDuelist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => AgentWidget(agent: agentDuelist[index]),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Sentinels",
                  style: TextStyle(
                    fontSize: 20,
                    color: valorantWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: agentSentinel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => AgentWidget(agent: agentSentinel[index]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final agentDuelist = [
  AgentModel(
    'Raze',
    'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/displayicon.png',
    'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/fullportrait.png',
    'Raze explodes out of Brazil with her big personality and big guns. With her blunt-force-trauma playstyle, she excels at flushing entrenched enemies and clearing tight spaces with a generous dose of \"boom.\"',
    [
      Abilities(
        'Blast Pack',
        'INSTANTLY throw a Blast Pack that will stick to surfaces. RE-USE the ability after deployment to detonate, damaging and moving anything hit.',
        'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/abilities/ability1/displayicon.png',
      ),
      Abilities(
        'Paint Shells',
        'EQUIP a cluster grenade. FIRE to throw the grenade, which does damage and creates sub-munitions, each doing damage to anyone in their range. ALT FIRE to lob. Paint Shells charge resets every two kills.',
        'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/abilities/ability2/displayicon.png',
      ),
      Abilities(
        'Boom Bot',
        'EQUIP a Boom Bot. FIRE will deploy the bot, causing it to travel in a straight line on the ground, bouncing off walls. The Boom Bot will lock on to any enemies in its frontal cone and chase them, exploding for heavy damage if it reaches them.',
        'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/abilities/grenade/displayicon.png',
      ),
      Abilities(
        'Showstopper',
        'EQUIP a rocket launcher. FIRE to shoot a rocket that does massive area damage on contact with anything.',
        'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/abilities/ultimate/displayicon.png',
      ),
    ],
  )
];
final agentSentinel = [
  AgentModel(
    'Cypher',
    'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/displayicon.png',
    'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/fullportrait.png',
    'The Moroccan information broker, Cypher is a one-man surveillance network who keeps tabs on the enemy\'s every move. No secret is safe. No maneuver goes unseen. Cypher is always watching.',
    [
      Abilities(
        'Cyber Cage',
        'INSTANTLY toss the cyber cage in front of Cypher. ACTIVATE to create a zone that blocks vision and plays an audio cue when enemies pass through it',
        'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/abilities/ability1/displayicon.png',
      ),
      Abilities(
        'Spycam',
        'EQUIP a spycam. FIRE to place the spycam at the targeted location. RE-USE this ability to take control of the camera\'s view. While in control of the camera, FIRE to shoot a marking dart. This dart will Reveal the location of any player struck by the dart. This ability can be picked up to be REDEPLOYED.',
        'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/abilities/ability2/displayicon.png',
      ),
      Abilities(
        'Trapwire',
        'EQUIP a trapwire. FIRE to place a destructible and covert tripwire at the targeted location, creating a line that spans between the placed location and the wall opposite. Enemy players who cross a tripwire will be Tethered, Revealed, and Concussed after a short period if they do not destroy the device in time. This ability can be picked up to be REDEPLOYED.',
        'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/abilities/grenade/displayicon.png',
      ),
      Abilities(
        'Neural Theft',
        'INSTANTLY use on a targeted dead enemy to download information on their team.  After a brief delay, the location of all living enemy players will be Revealed twice.',
        'https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/abilities/ultimate/displayicon.png',
      ),
    ],
  )
];
