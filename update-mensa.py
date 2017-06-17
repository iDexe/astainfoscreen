import urllib.request
import json

week = json.loads(urllib.request.urlopen("http://openmensa.org/api/v2/canteens/6/days/").read())

#Find out the next day of five, where the mensa is opened
for day in week:
    if day['closed'] == False:
        break

NextdayMeals = json.loads(urllib.request.urlopen( "http://openmensa.org/api/v2/canteens/6/days/" + day['date'] + "/meals").read())
print(NextdayMeals)

with open('NextdayMeals.json', 'w', encoding='utf8') as outfile:
    json.dump(NextdayMeals, outfile, indent=4, ensure_ascii=False)
