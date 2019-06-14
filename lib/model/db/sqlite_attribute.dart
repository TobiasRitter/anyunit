class SqliteAttribute {
  /// references to the actual variable value
  final Function getValue;
  final Function(dynamic) setValue;

  /// sqlite column name
  String name;

  /// sqlite definition of type and constraints
  String definition;

  SqliteAttribute(this.getValue, this.setValue, this.name, this.definition);

  String toString() {
    return "$name $definition";
  }
}
