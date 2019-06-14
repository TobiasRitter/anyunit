class Unit {
  final String name;
  final Function(double referenceUnitValue) getConvertedValue;
  final Function(double referenceUnitValue) getStandardizedValue;

  Unit(this.name, this.getConvertedValue, this.getStandardizedValue);
}
