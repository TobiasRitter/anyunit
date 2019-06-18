class Unit {
  /// the name of the unit
  final String name;

  /// converts a value of the standard unit into a value of the current unit
  final Function(
    double referenceUnitValue,
  ) getConvertedValue;

  /// converts a value of the current unit into a value of the standard unit
  final Function(
    double referenceUnitValue,
  ) getStandardizedValue;

  Unit(
    this.name,
    this.getConvertedValue,
    this.getStandardizedValue,
  );
}
