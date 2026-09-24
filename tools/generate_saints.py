import json
from datetime import date, timedelta

def generate_365_template():
    start_date = date(2024, 1, 1) # 2024 is a leap year so it includes Feb 29
    end_date = date(2024, 12, 31)

    calendar_data = []
    current = start_date

    while current <= end_date:
        date_key = current.strftime("%m-%d")

        day_entry = {
            "feastDate": date_key,
            "saints": [
                {
                    "id": f"saint_{date_key.replace('-', '_')}",
                    "name": f"Saint of {current.strftime('%B %d')}",
                    "feastDate": date_key,
                    "isPrimary": True,
                    "isSolemnity": False,
                    "liturgicalRank": "memorial",
                    "imagePath": "assets/saints/placeholder.jpg",
                    "shortBio": f"Commemorated on {current.strftime('%B %d')}.",
                    "fullStory": f"Full story for the saint of {current.strftime('%B %d')}.",
                    "patronage": ["Faithful"],
                    "quote": None,
                    "birthYear": None,
                    "deathYear": None,
                    "canonizationYear": None,
                    "tags": ["Saint", current.strftime('%B')]
                }
            ]
        }
        calendar_data.append(day_entry)
        current += timedelta(days=1)

    with open("assets/data/saints_365.json", "w", encoding="utf-8") as f:
        json.dump(calendar_data, f, indent=2, ensure_ascii=False)

    print("Generated 366-day template in assets/data/saints_365.json")

if __name__ == "__main__":
    generate_365_template()