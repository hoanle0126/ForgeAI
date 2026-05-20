import argparse
import os
import time
from pathlib import Path

import pandas as pd
import requests

try:
    from dotenv import load_dotenv
except ModuleNotFoundError:
    load_dotenv = None

BASE_DIR = Path(__file__).parent
BASE_URL = "https://api.nal.usda.gov/fdc/v1/foods/search"
TARGET_ROWS = 2000
PAGE_SIZE = 200
DATA_TYPES = ["Foundation", "SR Legacy", "Survey (FNDDS)"]

NUTRIENTS = {
    "208": "calories",
    "203": "protein_g",
    "204": "fat_g",
    "205": "carbs_g",
    "291": "fiber_g",
    "269": "sugar_g",
    "307": "sodium_mg",
}

SEED_KEYWORDS = [
    "chicken breast", "egg", "white rice", "brown rice", "oats", "banana", "apple",
    "sweet potato", "potato", "tofu", "salmon", "tuna", "beef", "pork", "milk",
    "greek yogurt", "broccoli", "spinach", "carrot", "peanut butter", "almonds",
    "turkey", "shrimp", "beans", "lentils", "peas", "corn", "orange", "berry",
    "grape", "mango", "pineapple", "melon", "tomato", "cabbage", "lettuce",
    "pepper", "onion", "walnut", "cashew", "seed", "avocado", "chicken",
    "fish", "rice", "yogurt", "cheese", "pasta", "noodles", "bread",
]

WHOLE_FOOD_KEYWORDS = {
    "chicken breast", "egg", "white rice", "brown rice", "oats", "banana", "apple",
    "sweet potato", "potato", "tofu", "salmon", "tuna", "beef", "pork", "milk",
    "greek yogurt", "broccoli", "spinach", "carrot", "peanut butter", "almonds",
}

BLOCKLIST_TERMS = {
    "babyfood", "baby toddler", "baby ", "gerber", "pudding", "chips", "candy", "candies",
    "chocolate", "taquito", "burrito", "burger", "pizza", "lasagna", "hot pocket",
    "fast foods", "restaurant", "snack", "dessert", "sweetened", "flavored", "marshmallow",
    "breakfast bar", "shake", "drink", "beverage", "cocktail", "liqueur", "alcohol",
    "coated", "breaded", "stuffed", "sausage", "luncheon", "fried", "sandwich",
}

CATEGORY_BLOCKLIST = {
    "Baby Foods", "Fast Foods", "Restaurant Foods", "Sweets", "Alcoholic Beverages",
    "Snacks", "Candy",
}

PREFERRED_TERMS = {
    "egg": {"egg white", "scrambled egg", "omelet", "whole egg", "egg, raw", "egg, cooked"},
    "banana": {"banana, raw", "bananas, raw", "raw banana", "bananas, ripe", "banana, ripe"},
    "milk": {"milk, whole", "milk, lowfat", "milk, reduced fat", "milk, nonfat", "milk, skim", "milk, fluid"},
    "oats": {"oats", "oatmeal", "rolled oats", "oat bran", "cooked oats"},
    "white rice": {"rice, white, cooked", "rice, white, long-grain", "rice, white,"},
    "brown rice": {"rice, brown, cooked", "rice, brown, long-grain"},
    "chicken breast": {"chicken breast"},
    "salmon": {"salmon, raw", "salmon, cooked", "salmon, canned", "salmon, baked"},
    "greek yogurt": {"yogurt, greek, plain", "yogurt, greek, nonfat", "yogurt, greek, low fat"},
}

CATEGORY_PREFERENCES = {
    "egg": {"Eggs and omelets", "Dairy and Egg Products"},
    "banana": {"Fruits and Fruit Juices", "Fruit"},
    "milk": {"Milk, reduced fat", "Milk, whole", "Milk, lowfat", "Dairy and Egg Products"},
    "oats": {"Cereal Grains and Pasta", "Cooked cereals"},
    "white rice": {"Rice", "Cereal Grains and Pasta"},
    "brown rice": {"Rice", "Cereal Grains and Pasta"},
    "chicken breast": {"Chicken, whole pieces", "Poultry Products"},
    "salmon": {"Fish", "Finfish and Shellfish Products"},
    "greek yogurt": {"Yogurt, Greek", "Dairy and Egg Products"},
}

PRICE_LEVEL_HINTS = {
    "egg": "low", "white rice": "low", "brown rice": "low", "banana": "low",
    "apple": "low", "oats": "low", "milk": "low", "chicken breast": "medium",
    "beef": "medium", "pork": "medium", "greek yogurt": "medium", "broccoli": "medium",
    "spinach": "medium", "tofu": "medium", "almonds": "medium", "peanut butter": "medium",
    "salmon": "high", "shrimp": "high", "tuna": "medium",
}

VIETNAMESE_NAME_HINTS = {
    "chicken breast": "ức gà", "egg": "trứng", "white rice": "cơm trắng",
    "brown rice": "gạo lứt", "oats": "yến mạch", "banana": "chuối", "apple": "táo",
    "sweet potato": "khoai lang", "potato": "khoai tây", "tofu": "đậu phụ",
    "salmon": "cá hồi", "tuna": "cá ngừ", "beef": "thịt bò", "pork": "thịt heo",
    "milk": "sữa", "greek yogurt": "sữa chua Hy Lạp", "broccoli": "bông cải xanh",
    "spinach": "rau bina", "carrot": "cà rốt", "peanut butter": "bơ đậu phộng",
    "almonds": "hạnh nhân",
}

MEAL_TYPE_HINTS = {
    "egg": "breakfast", "greek yogurt": "breakfast", "oats": "breakfast",
    "banana": "snack", "apple": "snack", "almonds": "snack", "peanut butter": "snack",
}

ALLERGEN_HINTS = {
    "egg": "egg", "milk": "milk", "greek yogurt": "milk", "cheese": "milk",
    "salmon": "fish", "tuna": "fish", "shrimp": "shellfish", "almonds": "tree_nut",
    "peanut butter": "peanut", "tofu": "soy",
}


def load_api_key() -> str:
    if load_dotenv is not None:
        load_dotenv(BASE_DIR / ".env")
    api_key = os.getenv("FDC_API_KEY")
    if not api_key:
        raise ValueError("Missing FDC_API_KEY. Please add it to model_ai/.env.")
    return api_key


def value_or_zero(value) -> float:
    return 0.0 if pd.isna(value) or value is None else float(value)


def canonical_keyword(keyword: str) -> str:
    return {
        "almond": "almonds",
        "peanut": "peanut butter",
        "yogurt": "greek yogurt",
        "rice": "white rice",
        "fish": "salmon",
        "turkey": "chicken breast",
    }.get(keyword, keyword)


def build_keywords() -> list[str]:
    keywords = [canonical_keyword(item) for item in SEED_KEYWORDS]
    keywords_path = BASE_DIR / "food_keywords.txt"
    if keywords_path.exists():
        keywords.extend(canonical_keyword(line.strip()) for line in keywords_path.read_text(encoding="utf-8").splitlines() if line.strip())
    keywords = list(dict.fromkeys(keywords))
    return sorted(keywords, key=lambda item: (item not in WHOLE_FOOD_KEYWORDS, item))


def extract_nutrients(food: dict) -> dict:
    result = {"calories": None, "protein_g": None, "fat_g": None, "carbs_g": None, "fiber_g": None, "sugar_g": None, "sodium_mg": None}
    for item in food.get("foodNutrients", []):
        nutrient_number = str(item.get("nutrientNumber", "")).strip()
        nutrient_name = (item.get("nutrientName") or "").lower()
        unit_name = str(item.get("unitName", "")).lower()
        value = item.get("value")
        if nutrient_number in NUTRIENTS:
            result[NUTRIENTS[nutrient_number]] = value
        elif "energy" in nutrient_name and "kcal" in unit_name:
            result["calories"] = value
        elif "protein" in nutrient_name:
            result["protein_g"] = value
        elif "carbohydrate" in nutrient_name:
            result["carbs_g"] = value
        elif "total lipid" in nutrient_name or nutrient_name == "fat":
            result["fat_g"] = value
        elif "fiber" in nutrient_name:
            result["fiber_g"] = value
        elif "sugars" in nutrient_name:
            result["sugar_g"] = value
        elif "sodium" in nutrient_name:
            result["sodium_mg"] = value
    return result


def is_allowed_food(keyword: str, description: str, category: str) -> bool:
    text = f"{description} {category}".lower()
    if any(term in text for term in BLOCKLIST_TERMS) or category in CATEGORY_BLOCKLIST:
        return False
    if keyword == "egg" and any(term in text for term in ["goose", "duck", "quail"]):
        return False
    if keyword == "banana" and ("pepper" in text or "smoothie" in text or "fruit salad" in text or "dehydrated" in text or "powder" in text):
        return False
    if keyword == "white rice" and ("wheat" in text or "uncooked" in text or "raw" in text):
        return False
    if keyword == "milk" and any(term in text for term in ["cheese", "protein supplement", "muscle milk", "powder", "dried", "dry,"]):
        return False
    if keyword == "greek yogurt" and any(term in text for term in ["strawberry", "blueberry", "raspberry", "peach", "apricot", "lemon", "coconut", "vanilla", "fruit"]):
        return False
    if keyword in WHOLE_FOOD_KEYWORDS:
        preferred_terms = PREFERRED_TERMS.get(keyword, set())
        preferred_categories = CATEGORY_PREFERENCES.get(keyword, set())
        has_preferred_term = any(term in text for term in preferred_terms)
        has_preferred_category = category in preferred_categories
        if preferred_terms or preferred_categories:
            return has_preferred_term or has_preferred_category
    return True


def infer_diet_tags(row: dict) -> str:
    tags = []
    text = f"{row.get('food_category') or ''} {row.get('description') or ''}".lower()
    if value_or_zero(row.get("protein_g")) >= 15:
        tags.append("high_protein")
    if value_or_zero(row.get("calories")) <= 120:
        tags.append("low_calorie")
    if value_or_zero(row.get("fiber_g")) >= 5:
        tags.append("high_fiber")
    if any(word in text for word in ["vegetable", "fruit", "bean", "lentil", "tofu", "nut", "seed"]):
        tags.append("plant_forward")
    return "|".join(tags)


def infer_meal_type(keyword: str, description: str, category: str) -> str:
    if keyword in MEAL_TYPE_HINTS:
        return MEAL_TYPE_HINTS[keyword]
    text = f"{description} {category}".lower()
    if any(word in text for word in ["breakfast", "oat", "egg", "cereal", "yogurt"]):
        return "breakfast"
    if any(word in text for word in ["nut", "fruit"]):
        return "snack"
    return "meal"


def infer_allergens(keyword: str, description: str, category: str) -> str:
    if keyword in ALLERGEN_HINTS:
        return ALLERGEN_HINTS[keyword]
    text = f"{description} {category}".lower()
    allergens = []
    checks = {
        "milk": ["milk", "cheese", "yogurt", "dairy"], "egg": ["egg"],
        "fish": ["fish", "salmon", "tuna"], "shellfish": ["shrimp", "crab", "lobster"],
        "peanut": ["peanut"], "tree_nut": ["almond", "walnut", "cashew", "pecan"],
        "wheat": ["wheat", "bread", "pasta", "noodle"], "soy": ["soy", "tofu"],
    }
    for label, words in checks.items():
        if any(word in text for word in words):
            allergens.append(label)
    return "|".join(allergens)


def quality_score(keyword: str, row: dict) -> float:
    description = str(row.get("description") or "").lower()
    category = str(row.get("food_category") or "")
    score = value_or_zero(row.get("protein_g")) * 3
    score += value_or_zero(row.get("fiber_g")) * 1.5
    score -= value_or_zero(row.get("sugar_g")) * 1.2
    score -= value_or_zero(row.get("sodium_mg")) / 250
    if keyword in WHOLE_FOOD_KEYWORDS:
        score += 20
    if any(term in description for term in PREFERRED_TERMS.get(keyword, set())):
        score += 25
    if category in CATEGORY_PREFERENCES.get(keyword, set()):
        score += 10
    return round(score, 4)


def normalize_row(keyword: str, food: dict) -> dict | None:
    keyword = canonical_keyword(keyword)
    description = str(food.get("description") or "")
    category = str(food.get("foodCategory") or "")
    if not is_allowed_food(keyword, description, category):
        return None
    nutrients = extract_nutrients(food)
    if any(nutrients[name] is None for name in ["calories", "protein_g", "fat_g", "carbs_g"]):
        return None
    row = {
        "keyword": keyword,
        "fdc_id": food.get("fdcId"),
        "description": description,
        "data_type": food.get("dataType"),
        "food_category": category,
        "serving_size": 100,
        "serving_unit": "g",
        **nutrients,
    }
    if not (0 <= value_or_zero(row["calories"]) <= 900 and 0 <= value_or_zero(row["protein_g"]) <= 80 and 0 <= value_or_zero(row["fat_g"]) <= 100 and 0 <= value_or_zero(row["carbs_g"]) <= 100):
        return None
    row["diet_tags"] = infer_diet_tags(row)
    row["meal_type"] = infer_meal_type(keyword, description, category)
    row["allergens"] = infer_allergens(keyword, description, category)
    row["price_level"] = PRICE_LEVEL_HINTS.get(keyword, "")
    row["vietnamese_name"] = VIETNAMESE_NAME_HINTS.get(keyword, "")
    row["quality_score"] = quality_score(keyword, row)
    return row


def fetch_page(session: requests.Session, api_key: str, keyword: str, page_number: int) -> list[dict]:
    response = session.post(
        BASE_URL,
        params={"api_key": api_key},
        json={"query": keyword, "dataType": DATA_TYPES, "pageSize": PAGE_SIZE, "pageNumber": page_number},
        timeout=30,
    )
    if response.status_code != 200:
        print(f"[ERROR] {keyword} page {page_number}: {response.status_code} - {response.text[:180]}")
        return []
    return response.json().get("foods", [])


def collect_rows(target_rows: int) -> list[dict]:
    api_key = load_api_key()
    rows = []
    seen_fdc_ids = set()
    session = requests.Session()
    keywords = build_keywords()
    per_keyword_target = max(20, target_rows // len(keywords))
    max_pages = 10

    for page_number in range(1, max_pages + 1):
        if len(rows) >= target_rows:
            break
        for keyword in keywords:
            if len(rows) >= target_rows:
                break
            if sum(1 for row in rows if row["keyword"] == keyword) >= per_keyword_target and page_number > 1:
                continue
            foods = fetch_page(session, api_key, keyword, page_number)
            if not foods:
                continue
            added = 0
            for food in foods:
                fdc_id = food.get("fdcId")
                if not fdc_id or fdc_id in seen_fdc_ids:
                    continue
                row = normalize_row(keyword, food)
                if row is None:
                    continue
                rows.append(row)
                seen_fdc_ids.add(fdc_id)
                added += 1
                if len(rows) >= target_rows or sum(1 for item in rows if item["keyword"] == canonical_keyword(keyword)) >= per_keyword_target:
                    break
            print(f"{keyword} page {page_number}: +{added}, total={len(rows)}")
            time.sleep(0.08)

    if len(rows) < target_rows:
        for keyword in keywords:
            if len(rows) >= target_rows:
                break
            for page_number in range(1, max_pages + 1):
                foods = fetch_page(session, api_key, keyword, page_number)
                if not foods:
                    break
                added = 0
                for food in foods:
                    fdc_id = food.get("fdcId")
                    if not fdc_id or fdc_id in seen_fdc_ids:
                        continue
                    row = normalize_row(keyword, food)
                    if row is None:
                        continue
                    rows.append(row)
                    seen_fdc_ids.add(fdc_id)
                    added += 1
                    if len(rows) >= target_rows:
                        break
                print(f"fill {keyword} page {page_number}: +{added}, total={len(rows)}")
                if len(rows) >= target_rows or len(foods) < PAGE_SIZE:
                    break
                time.sleep(0.08)
    return rows


def export_dataset(target_rows: int, output_path: Path) -> pd.DataFrame:
    rows = collect_rows(target_rows)
    df = pd.DataFrame(rows)
    if not df.empty:
        df = df.drop_duplicates(subset=["fdc_id"])
        df = df.sort_values(["keyword", "quality_score", "description"], ascending=[True, False, True]).head(target_rows)
        df = df.drop(columns=["quality_score"])
    output_path.parent.mkdir(parents=True, exist_ok=True)
    df.to_csv(output_path, index=False, encoding="utf-8-sig")
    whole_food_rows = int(df["keyword"].isin(WHOLE_FOOD_KEYWORDS).sum()) if not df.empty else 0
    print(f"Quality summary: rows={len(df)} unique_keywords={df['keyword'].nunique() if not df.empty else 0} whole_food_rows={whole_food_rows}")
    return df


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target-rows", type=int, default=TARGET_ROWS)
    parser.add_argument("--output", type=Path, default=BASE_DIR / "foods_usda.csv")
    args = parser.parse_args()
    df = export_dataset(args.target_rows, args.output)
    print(f"Done! Exported {len(df)} cleaned real USDA/FDC rows to {args.output}")


if __name__ == "__main__":
    main()
