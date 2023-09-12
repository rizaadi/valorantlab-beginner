class AgentModel {
  final String name;
  final String displayIcon;
  final String displayFull;
  final String description;
  final List<Abilities> abilities;

  AgentModel(
    this.name,
    this.displayIcon,
    this.displayFull,
    this.description,
    this.abilities,
  );
}

class Abilities {
  final String name;
  final String description;
  final String displayIcon;

  Abilities(this.name, this.description, this.displayIcon);
}
