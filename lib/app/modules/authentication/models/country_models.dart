class CountryModels {
  String svgPath;
  String countryCode;
  String country;

  CountryModels(this.countryCode, this.svgPath, this.country);
}

final countries = [
  CountryModels('+1', 'assets/svg/canada.svg', 'Canada'),
  CountryModels('+234', 'assets/svg/nigeria.svg', 'Nigeria'),
  CountryModels('+223', 'assets/svg/ghana.svg', 'Ghana'),
  CountryModels('+254', 'assets/svg/kenya.svg', 'Kenya'),
  CountryModels('+44', 'assets/svg/england.svg', 'England'),
  CountryModels('+250', 'assets/svg/rwanda.svg', 'Rwanda'),
];
