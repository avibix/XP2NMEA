# X-Plane to NMEA

**X-Plane to NMEA** application to stream GPS data from **X-Plane** to navigation apps like [Pronebo](https://t.me/s/pronebo_club) or [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) over your local network.

---

## 📲 Supported Apps

- [Pronebo](https://t.me/s/pronebo_club)
- [GPS Connector (Android)](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector)


## ✈️ Pronebo Setup

1. Install the [FlyWithLua plugin](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) for X-Plane.
2. Copy `NMEA.lua` into:
    ```
    X:/X-Plane/Resources/Plugins/FlyWithLua/Scripts/
    ```
3. Install **Pronebo** on your smartphone.
4. Launch `XP2NMEA.exe` — your PC's IP address and port will be displayed.
5. In **ProNebo**, navigate to:
    ```
    Settings → GLONASS / GPS Settings → External GPS and baro sensor
    ```
   Enter:
    - **TCP/UDP IP**: your computer’s IP address
    - **Port**: `10110`
    - Press **Save**

⚠ **Important (Pronebo 7.4 only):**  
Disable **Auto-connect to External GPS** — if enabled while no data source is connected, the app may freeze. 

6. Launch X-Plane and load into an airport.
7. In **GLONASS / GPS** window:
    ```
    Tap 3 dots → Map view → Connect GPS → UDP/TCP GPS
    ```
8. Verify that **Pronebo** is connected inside `XP2NMEA.exe`.

## 🛩️ GPS Connector Setup

1. Install the [FlyWithLua plugin](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) for X-Plane.
2. Copy `NMEA.lua` into:
    ```
    X:/X-Plane/Resources/Plugins/FlyWithLua/Scripts/
    ```
3. Install [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) on your smartphone.
4. Launch `XP2NMEA.exe` — your PC's IP address and port will be displayed.
5. In **GPS Connector**:
    ```
    ⚙️ → GNSS Input → Select NMEA input source → TCP/IP
    ```
   Enter:
    - **IP**: your computer’s IP address
    - **Port**: `10110`
    - Press **Save**
6. In **GPS Connector**:
    ```
    ⚙️ → Mock location → Set Mock Location ON
    ```
7. The app may display:
    ```
    "TCP/IP Feature is not Licensed!"
    ```
   — Don't worry, the app works normally.
8. In **Android Developer Options**, set **GPS Connector** as the mock location provider.
9. Launch X-Plane and load into an airport.
10. Verify that **GPS Connector** is connected inside `XP2NMEA.exe`.

You can also use GPS Connector to fly on [Aircom](https://aircom24.ru/).

## ⚠ Known Issues

- **Pronebo 7.4:**
  - Always back up your settings.
  - Disable *Auto-connect to External GPS* to prevent app freezes when data source is unavailable.
- **Pronebo 7.3:**  
  - No issues reported.

## 🛠 Requirements

- **X-Plane 11/12**
- **FlyWithLua NG plugin**
- **XP2NMEA.exe**
- Smartphone with **Pronebo** or **GPS Connector**

Enjoy your flights!

---

# X-Plane to NMEA

**X-Plane to NMEA** - утилита для передачи GPS-данных из симулятора **X-Plane** в навигационные приложения [Пронебо](https://t.me/s/pronebo_club) и [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) по локальной сети.


## 📲 Поддерживаемые приложения

- [Пронебо](https://t.me/s/pronebo_club)
- [GPS Connector (Android)](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector)


## ✈️ Настройка Пронебо

1. Установите плагин [FlyWithLua](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) для X-Plane.
2. Скопируйте скрипт `NMEA.lua` в папку:
    ```
    X:/X-Plane/Resources/Plugins/FlyWithLua/Scripts/
    ```
3. Установите приложение **Пронебо** на смартфон.
4. Запустите `XP2NMEA.exe` — в окне появится IP-адрес и порт компьютера.
5. В приложении **Пронебо** откройте:
    ```
    Настройки → Настройки ГЛОНАСС / GPS → Внешний GPS и бародатчик
    ```
   Введите:
    - **TCP/UDP IP**: IP-адрес компьютера
    - **Порт**: `10110`
    - Нажмите **Сохранить**

⚠ **Важно (только для Пронебо 7.4):**  
Отключите **автоматическое соединение с внешним GPS**, иначе приложение может зависнуть при отсутствии источника данных.

6. Запустите X-Plane и загрузитесь в аэропорту.
7. В окне **ГЛОНАСС / GPS**:
    ```
    Нажмите три точки → Вид карты → Подключить GPS → UDP/TCP GPS
    ```
8. Убедитесь, что соединение установлено (проверяется в `XP2NMEA.exe`).


## 🛩️ Настройка GPS Connector

1. Установите плагин [FlyWithLua](https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/) для X-Plane.
2. Скопируйте скрипт `NMEA.lua` в папку:
    ```
    X:/X-Plane/Resources/Plugins/FlyWithLua/Scripts/
    ```
3. Установите [GPS Connector](https://play.google.com/store/apps/details?id=de.pilablu.gpsconnector) на смартфон.
4. Запустите `XP2NMEA.exe` — в окне появится IP-адрес и порт компьютера.
5. В приложении **GPS Connector**:
    ```
    ⚙️ → GNSS Input → Select NMEA input source → TCP/IP
    ```
   Введите:
    - **IP**: IP-адрес компьютера
    - **Порт**: `10110`
    - Нажмите **Сохранить**
6. В приложении **GPS Connector**:
    ```
    ⚙️ → Mock location → Set Mock Location ON
    ```
7. На главном экране появится сообщение:
    ```
    "TCP/IP Feature is not Licensed!"
    ```
   — не обращайте внимания, приложение работает стабильно.
8. В настройках разработчика Android выберите **GPS Connector** как приложение для фиктивного местоположения.
9. Запустите X-Plane и загрузитесь в аэропорту.
10. Убедитесь, что соединение установлено (проверяется в `XP2NMEA.exe`).

С помощью GPS Connector можно также летать на [Aircom](https://aircom24.ru/).


## ⚠ Известные особенности

- **Пронебо 7.4:**
  - Сделайте резервную копию настроек.
  - Обязательно отключайте *автоматическое соединение с внешним GPS*, чтобы избежать зависания при отсутствии источника данных.

## ✈ Также доступно для MSFS2020

Аналогичное приложение для **Microsoft Flight Simulator 2020** доступно [здесь](https://github.com/mihai-dinculescu/msfs-2020-gps-link).

## 🛠 Требования

- **X-Plane 11/12**
- **FlyWithLua NG**
- **XP2NMEA.exe**
- Смартфон с установленным **Пронебо** или **GPS Connector**

---

Приятных полётов!
