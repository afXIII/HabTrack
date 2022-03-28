# HabTrack

This is a habit tracking app made for experimenting with new SwiftUI features.

### How to clone:
To clone this project:
1- simply download this repo.
2- open the project in xcode
3- sign the app with your team apple id (if necessary)
4- run the app on at least the latest supported iOS or simluator (currently 14.0)

### TODO: 
- [ ] Add PIN security to app (additional to biometrics)
- [ ] CalendarView with colorful streak counts (consider changes to habit data structure)
- [ ] Fix dark mode support (maybe consider additional themes for the app)
- [ ] Datepicker for finite goal habits
- [ ] Cloud sync habits (currently considering server options & json data models for API)
- [ ] Cleaner project directory (should habits be classes/structs?)
- [x] Biometrics security (faceID and touchID)
- [x] Notifications permission request
- [x] Basic CRUD functionality of habits
- [x] Store user settings (@AppStorage)
- [x] Setup CoreData persistance layer for Habits (and maybe settings)