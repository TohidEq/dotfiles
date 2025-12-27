#!/usr/bin/env python

import json
import requests
from datetime import datetime


WEATHER_CODES_old = {
    '113': '☀️ ',
    '116': '⛅ ',
    '119': '☁️ ',
    '122': '☁️ ',
    '143': '☁️ ',
    '176': '🌧️',
    '179': '🌧️',
    '182': '🌧️',
    '185': '🌧️',
    '200': '⛈️ ',
    '227': '🌨️',
    '230': '🌨️',
    '248': '☁️ ',
    '260': '☁️ ',
    '263': '🌧️',
    '266': '🌧️',
    '281': '🌧️',
    '284': '🌧️',
    '293': '🌧️',
    '296': '🌧️',
    '299': '🌧️',
    '302': '🌧️',
    '305': '🌧️',
    '308': '🌧️',
    '311': '🌧️',
    '314': '🌧️',
    '317': '🌧️',
    '320': '🌨️',
    '323': '🌨️',
    '326': '🌨️',
    '329': '❄️ ',
    '332': '❄️ ',
    '335': '❄️ ',
    '338': '❄️ ',
    '350': '🌧️',
    '353': '🌧️',
    '356': '🌧️',
    '359': '🌧️',
    '362': '🌧️',
    '365': '🌧️',
    '368': '🌧️',
    '371': '❄️',
    '374': '🌨️',
    '377': '🌨️',
    '386': '🌨️',
    '389': '🌨️',
    '392': '🌧️',
    '395': '❄️ '
}

WEATHER_CODES = {
	'113': " ",
	'116': "󰖕 ",
	'119': "󰖐 ",
	'122': " ",
	'143': " ",
	'176': "󰖗 ",
	'179': " ",
	'182': " ",
	'185': "󰖖 ",
	'200': " ",
	'227': "󰖒 ",
	'230': "󰖒 ",
	'248': " ",
	'260': " ",
	'263': " ",
	'266': " ",
	'281': " ",
	'284': " ",
	'293': " ",
	'296': " ",
	'299': " ",
	'302': " ",
	'305': " ",
	'308': " ",
	'311': " ",
	'314': " ",
	'317': " ",
	'320': "󰙿 ",
	'323': "󰙿 ",
	'326': "󰙿 ",
	'329': "󰼶 ",
	'332': "󰼶 ",
	'335': "󰼶 ",
	'338': "󰼶 ",
	'350': " ",
	'353': " ",
	'356': " ",
	'359': " ",
	'362': " ",
	'365': " ",
	'368': " ",
	'371': " ",
	'374': "󰼶 ",
	'377': "󰼶 ",
	'386': "󰼶 ",
	'389': "󰼶 ",
	'392': " ",
	'395': " "
}

data = {}


weather = requests.get("https://wttr.in/Rasht?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)

tempint = int(weather['current_condition'][0]['FeelsLikeC'])
extrachar = ''
if tempint > 0 and tempint < 10:
    extrachar = '+'


data['text'] = ''+ \
    extrachar+weather['current_condition'][0]['FeelsLikeC']+"° " + \
    WEATHER_CODES[weather['current_condition'][0]['weatherCode']] 

data['tooltip'] = f"\n<b> {weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_F']}°</b>\n"
data['tooltip'] += f" Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f" Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f" Humidity: {weather['current_condition'][0]['humidity']}%\n"

clock_icons = ["󱑊", "󱐿", "󱑀", "󱑁", "󱑂", "󱑃", "󱑄", "󱑅", "󱑆", "󱑇", "󱑈", "󱑉", "󱑊", "󱐿", "󱑀", "󱑁", "󱑂", "󱑃", "󱑄", "󱑅", "󱑆", "󱑇", "󱑈", "󱑉", "󱑊"]

for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "  امروز , "
        #data['tooltip'] += "  Today , "
    elif i == 1:
        data['tooltip'] += "  فردا , "
        #data['tooltip'] += "  Tomorrow , "
    else:
        data['tooltip'] += "  پسفردا , "        
	#data['tooltip'] += " The Day After Tomorrow , "
        # There is no short word for Pasfarda in English XD
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f"   {day['maxtempF']}°  {day['mintempF']}° "
    data['tooltip'] += f"  {day['astronomy'][0]['sunrise']}    {day['astronomy'][0]['sunset']}  \n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        clock_icon_index = int(format_time(hour['time']))
        clock_icon_char = clock_icons[clock_icon_index]
        data['tooltip'] += f"  {clock_icon_char}  {format_time(hour['time'])}:00 {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}  \n"


print(json.dumps(data))
