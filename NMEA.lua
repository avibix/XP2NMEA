local defaultIP = "127.0.0.1"
local defaultPort = 16969
local IP = defaultIP
local Port = defaultPort
local last_time_sent = 0
local send_interval = 0.1 -- 10 p/s

-- Structure to hold current plane situation
local data = {}

dataref("groundspeed", "sim/flightmodel/position/groundspeed")
dataref("truetrack", "sim/flightmodel/position/psi")
dataref("variation", "sim/flightmodel/position/magnetic_variation")
dataref("magtrack", "sim/flightmodel/position/magpsi")
dataref("altitude", "sim/flightmodel/position/elevation")
dataref("pitch", "sim/flightmodel/position/theta")
dataref("roll", "sim/flightmodel/position/phi")
dataref("zulu_time_sec", "sim/time/zulu_time_sec")


-- create socket
local socket = require "socket"
local udp = socket.udp()
udp:settimeout(0)
udp:setpeername(IP, Port)

function sendUDP(txt)
    udp:send(txt)
end

local function isValidNumber(x)
    return x == x and x ~= nil
end

local function getSimDateTime()
    local now_utc = os.time(os.date("!*t"))
    local midnight = now_utc - (now_utc % 86400)
    local sim_time = midnight + zulu_time_sec
    local t = os.date("!*t", sim_time)
    return t
end

function readData()
    if not (isValidNumber(LATITUDE) and isValidNumber(LONGITUDE)) then
        return false
    end
    local total_seconds = zulu_time_sec
    local hr = math.floor(total_seconds / 3600)
    local mi = math.floor((total_seconds % 3600) / 60)
    local se = math.floor(total_seconds % 60)
    data.time = string.format("%02d%02d%02d", hr, mi, se)

    local t = getSimDateTime()
    data.day = t.day
    data.month = t.month
    data.year = t.year
    data.date = string.format("%02d%02d%02d", data.day, data.month, data.year % 100)

    data.lat = LATITUDE
    data.lon = LONGITUDE
    data.alt = altitude
    data.gs = groundspeed * 1.943844
    data.tt = truetrack
    data.var = variation
    data.mt = magtrack
    data.pitch = pitch
    data.roll = roll

    local degLat = math.floor(math.abs(data.lat))
    local minLat = (math.abs(data.lat) - degLat) * 60
    local NS = data.lat >= 0 and 'N' or 'S'
    data.lat_formatted = string.format("%02d%07.4f,%s", degLat, minLat, NS)

    local degLon = math.floor(math.abs(data.lon))
    local minLon = (math.abs(data.lon) - degLon) * 60
    local EW = data.lon >= 0 and 'E' or 'W'
    data.lon_formatted = string.format("%03d%07.4f,%s", degLon, minLon, EW)

    data.var_formatted = string.format("%2.2f,%s", math.abs(data.var), data.var >= 0 and 'W' or 'E')
    data.alt_formatted = string.format("%1.1f", data.alt)
end

function composeNMEA()

    local now = os.clock()
    if now - last_time_sent < send_interval then return end
    last_time_sent = now

    readData()

    local GPRMC = string.format("GPRMC,%s,A,%s,%s,%4.1f,%05.1f,%s,%s", 
        data.time, data.lat_formatted, data.lon_formatted, data.gs, data.tt, data.date, data.var_formatted)
    local GPRMC_full = string.format("$%s", GPRMC)

    local GPGGA = string.format("GPGGA,%s,%s,%s,1,10,0.9,%s,M,0.0,M,,", 
        data.time, data.lat_formatted, data.lon_formatted, data.alt_formatted)
    local GPGGA_full = string.format("$%s", GPGGA)

    local GPGSA = string.format("GPGSA,A,3,01,02,03,04,05,06,07,08,09,10,11,12,1.2,0.9,1.5")
    local GPGSA_full = string.format("$%s", GPGSA)

    local GPGLL = string.format("GPGLL,%s,%s,%s,A", 
        data.lat_formatted, data.lon_formatted, data.time)
    local GPGLL_full = string.format("$%s", GPGLL)

    local GPVTG = string.format("GPVTG,%05.1f,T,%05.1f,M,%4.1f,N,%4.1f,K", 
        data.tt, data.mt, data.gs, data.gs * 1.852)
    local GPVTG_full = string.format("$%s", GPVTG)

    local GPGSV_1 = "GPGSV,2,1,10,01,80,090,42,02,70,045,40,03,60,180,38,04,50,270,35"
    local GPGSV_2 = "GPGSV,2,2,10,05,40,315,30,06,30,000,25,07,20,135,20,08,10,225,15,09,05,045,10"
    local GPGSV_full1 = string.format("$%s", GPGSV_1)
    local GPGSV_full2 = string.format("$%s", GPGSV_2)

    local PGRMZ = string.format("PGRMZ,%s,f", data.alt_formatted)
    local PGRMZ_full = string.format("$%s", PGRMZ)

    local GPHDT = string.format("GPHDT,%05.1f,T", data.tt)
    local GPHDT_full = string.format("$%s", GPHDT)

    local NMEA = string.format("%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n", GPRMC_full, GPGGA_full, GPGSA_full, GPGLL_full, GPVTG_full, GPGSV_full1, GPGSV_full2, PGRMZ_full, GPHDT_full)

    sendUDP(NMEA)
end

do_every_frame("composeNMEA()")