import 'package:flutter/material.dart';
import 'package:valorantlab/models/agent_model.dart';
import 'package:valorantlab/style/colors.dart';

class AbilitiesWidget extends StatelessWidget {
  final Abilities abilities;
  const AbilitiesWidget({
    super.key,
    required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: valorantBlack,
            builder: (context) => Container(
                  padding: const EdgeInsets.all(20),
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.network(
                        abilities.displayIcon,
                        height: 70,
                        width: 70,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        abilities.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: valorantWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        abilities.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: valorantWhite,
                        ),
                      ),
                    ],
                  ),
                ));
      },
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: valorantBlackSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(abilities.displayIcon),
      ),
    );
  }
}
