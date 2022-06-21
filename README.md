
# Dokumentace WeatherApp

**Autor:** Marko Kubrachenko
**Nasazení aplikace:** iOS 15.4

## Popis

Aplikace  `WeatherApp`  slouží  k  zobrazování  aktuálního  počasí.  Kostrou  aplikace  je  `TabView`,  kde  první  záložka  zobrazuje  počasí  pro  aktuální  polohu  uživatele  a  druhá  má  v  sobě  seznam  míst,  které  uživatel  může  libovolně  přidávat  a  mazat.  Seznam  míst  je  implementován  pomocí  `NavigationView`  a  `NavigationLink`  pro  zobrazení  počasí  pro  konkrétní  místo.  Perzistenci  seznamu  jsem  zajistil  prostřednictvím  `CoreData`.  Pro  získávání  polohy  uživatele  jsem  použil  `CoreLocation`.  Informaci  o  počasí  získávám  asynchronně  z  OpenWeather  API.

### Příklad práce aplikace:
https://drive.google.com/file/d/1tQwsGEXrnvQdhi6a_YbHpVtL5uYfVccY/view?usp=sharing

## Technologie

* `SwiftUI`
* `Foundation`
* `CoreData`
* `CoreLocation`
* `CoreLocationUI`
