class Unit {
  final String name;
  final Unit standardUnit;
  final Function(double referenceUnitValue) getConvertedValue;
  final Function(double referenceUnitValue) getStandardizedValue;

  Unit(this.name, this.standardUnit, this.getConvertedValue,
      this.getStandardizedValue);
}
