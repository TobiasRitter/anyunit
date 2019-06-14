class SqliteAttribute {
  /// gets the actual variable value
  final Function getValue;

  /// sets the actual variable value
  final Function(dynamic) setValue;

  /// sqlite column name
  String name;

  /// sqlite definition of type and constraints
  String definition;

  SqliteAttribute(this.getValue, this.setValue, this.name, this.definition);

  /// returns the attribute in the format for an insert query
  String toString() {
    return "$name $definition";
  }
}
