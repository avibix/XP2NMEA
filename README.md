# Привет!


Приложение для передачи GPS данных из авиасимулятора X-Plane в навигационное приложение [Пронебо](https://t.me/s/pronebo_club) или [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) по локальной сети.

#### Пронебо
1. Скачай и установи плагин [FlyWithLua](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) в свой авиасимулятор. Скопируй файл NMEA.lua в подкаталог *X:/X-Plane/Resourses/Plugins/FlyWithLua/Scripts/* ;
2. Установи [Пронебо](https://t.me/s/pronebo_club) на свой смартфон;
3. Запускай XP2NMEA.exe. В окне появится IP адрес и порт компьютера;
4. В приложении Пронебо заходи в Настройки => Настройки ГлоНаСС / GPS => Внешний GPS и бародатчик => TCP/UDP IP: *IP адрес компьютера*, порт *10110* => Сохранить.
❗В версии 7.4 отключи автоматическое соединение с внешним GPS❗;
6. Запускай X-Plane и загружайся в аэропорту
7. В окне ГлоНаСС / GPS в верхнем левом углу нажимай три точки => Вид карты => Подключить GPS => UDP/TCP GPS;
8. Проверь в XP2NMEA.exe, что Пронебо подключилось.
   
#### GPS Connector
1. Скачай и установи плагин [FlyWithLua](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) в свой авиасимулятор. Скопируй файл NMEA.lua в подкаталог *X:/X-Plane/Resourses/Plugins/FlyWithLua/Scripts/* 
2. Скачай [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) на свой смартфон;
3. Запускай XP2NMEA.exe. В окне появится IP адрес и порт компьютера;
4. В приложении GPS Connector нажимай ⚙️ => GNSS Input => Select NMEA input sourse => TCP/IP: вводи *IP адрес компьютера*, порт *10110* => Сохранить;
5. В приложении GPS Connector нажимай ⚙️ => Mock location => Set Mock Location *ON*;
6. На главном экране приложение будет писать TCP/IP Feature is not Licensed! Не переживай - приложение работает стабильно;
7. В параметрах разработчика Android не забудь выбрать приложение для фиктивных местоположений GPS Connector. Таким образом будет подменять GPS данные;
8. Запускай X-Plane и загружайся в аэропорту;
9. Проверь в XP2NMEA.exe, что GPS Connector подключилось. С помощью GPS Connector можно летать по [Aircom](https://aircom24.ru/)
 

## Известные проблемы
Если используешь Пронебо 7.4 - обязательно сделай бэкап настроек и отключи автоматическое соединение с внешним GPS (Если установить тумблер, при этом отсутствует связь с источником данных, то приложение виснет). В 7.3 такой проблемы не замечено

## Переходные положения
Программа с аналогичным функционалом для MSFS2020 [*click*](https://github.com/mihai-dinculescu/msfs-2020-gps-link)
