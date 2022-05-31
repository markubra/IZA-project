
# Dokumentace WeatherApp -- IZA

**Autor:** Marko Kubrachenko
**Login:** xkubra00
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

## TODO v budoucnu

*  Obraz  ikony  se  nezobrazuje  v  LauchScreen  (pouze  v  simulaci)  
*  Přidání  předpovědi  počasí  pro  nadcházející  dny  
*  Přidání  ještě  více  animací  pro  "oživení"  aplikace

