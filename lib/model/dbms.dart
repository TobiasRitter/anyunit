import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/unit.dart';

/// object providing basic read and write functionality for the database
class DBMS {
  /// returns the set of available units for conversion from the database
  static Set<Category> load() {
    return <Category>{
      Category(
        name: "Weight",
        units: <Unit>{
          Unit(
            name: "g",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "kg",
            getConvertedValue: (val) => val / 1000,
            getStandardizedValue: (val) => val * 1000,
          ),
          Unit(
            name: "lbs",
            getConvertedValue: (val) => val / 453.592,
            getStandardizedValue: (val) => val * 453.592,
          ),
        },
      ),
      Category(
        name: "Temperature",
        units: <Unit>{
          Unit(
            name: "kelvin",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "celcius",
            getConvertedValue: (val) => val - 273.15,
            getStandardizedValue: (val) => val + 273.15,
          ),
          Unit(
            name: "fahrenheit",
            getConvertedValue: (val) => (val - 273.15) * 9 / 5 + 32,
            getStandardizedValue: (val) => (val - 32) * 5 / 9 + 273.15,
          ),
        },
      ),
      Category(
        name: "Distance",
        units: <Unit>{
          Unit(
            name: "m",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "cm",
            getConvertedValue: (val) => val * 100,
            getStandardizedValue: (val) => val / 100,
          ),
          Unit(
            name: "km",
            getConvertedValue: (val) => val / 1000,
            getStandardizedValue: (val) => val * 1000,
          ),
          Unit(
            name: "mile",
            getConvertedValue: (val) => val / 1609.344,
            getStandardizedValue: (val) => val * 1609.344,
          ),
          Unit(
            name: "nautic mile",
            getConvertedValue: (val) => val / 1852,
            getStandardizedValue: (val) => val * 1852,
          ),
          Unit(
            name: "in",
            getConvertedValue: (val) => val * 39.37,
            getStandardizedValue: (val) => val / 39.37,
          ),
          Unit(
            name: "ft",
            getConvertedValue: (val) => val * 3.281,
            getStandardizedValue: (val) => val / 3.281,
          ),
          Unit(
            name: "yard",
            getConvertedValue: (val) => val * 1.094,
            getStandardizedValue: (val) => val / 1.094,
          ),
        },
      ),
      Category(
        name: "Speed",
        units: <Unit>{
          Unit(
            name: "m/s",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "km/h",
            getConvertedValue: (val) => val * 3.6,
            getStandardizedValue: (val) => val / 3.6,
          ),
          Unit(
            name: "mph",
            getConvertedValue: (val) => val * 2.237,
            getStandardizedValue: (val) => val / 2.237,
          ),
          Unit(
            name: "knots",
            getConvertedValue: (val) => val * 1.944,
            getStandardizedValue: (val) => val / 1.944,
          ),
        },
      ),
      Category(
        name: "Volume",
        units: <Unit>{
          Unit(
            name: "m³",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "cm³",
            getConvertedValue: (val) => val * 1000,
            getStandardizedValue: (val) => val / 1000,
          ),
          Unit(
            name: "dm³",
            getConvertedValue: (val) => val * 1000000,
            getStandardizedValue: (val) => val / 1000000,
          ),
          Unit(
            name: "l",
            getConvertedValue: (val) => val * 1000000,
            getStandardizedValue: (val) => val / 1000000,
          ),
        },
      ),
    };
  }

  /// saves a set of units to the database
  static void save(Set<Category> categories) {}
}
