import Foundation
struct Information: Identifiable, Hashable {
  let id = UUID()
  var allergy: String
  var ingredients: [String]
}

let allergyInformation = [
    Information(allergy: "Peanut", ingredients: [
            "Peanuts (Arachis hypogaea)",
            "Peanut butter",
            "Peanut flour",
            "Peanut oil (unless highly refined)",
            "Peanut butter chips",
            "Peanut butter cookies",
            "Peanut candies",
            "Trail mix (often contains peanuts)",
            "Granola bars (may contain peanuts)",
            "Energy bars (may contain peanuts)",
            "Protein bars (may contain peanuts)",
            "Chocolate bars (may contain peanuts)",
            "Candy bars (may contain peanuts)",
            "Cookies (may contain peanuts)",
            "Cakes (may contain peanuts)",
            "Muffins (may contain peanuts)",
            "Pastries (may contain peanuts)",
            "Ice cream (may contain peanuts or peanut butter swirls)",
            "Salad dressings (may contain peanut butter or satay sauce)",
            "Sauces (may contain peanut butter or satay sauce)",
            "Marinades (may contain peanut butter or satay sauce)",
            "Hummus (may contain peanut butter or tahini - check label)",
            "Satay (peanut sauce)",
            "Asian stir-fries (may contain peanuts or peanut sauce)",
            "Thai curries (may contain peanuts or peanut sauce)",
            "Peanut sauces",
            "Nougat",
            "Marzipan (may contain peanuts)",
            "Beer nuts (contain peanuts)",
            "Mixed nuts (may contain peanuts)",
            "Foods labeled 'may contain peanuts'",
            "Dishes with unknown ingredients (exercise caution)",
            "Restaurants with a high risk of peanut contamination (e.g., peanut-heavy cuisines)",
            "Peanuts used in cooking oil (especially common in some Asian cuisines)",
            "Peanut butter (Arachis hypogaea paste)",
            "Peanut flour (ground Arachis hypogaea)",
            "Peanut oil (unless highly refined)",
            "Arachis hypogaea (scientific name for peanuts)",
            "Hydrolyzed peanut protein",
            "Groundnuts (another term for peanuts)",
            "Tahini (sesame seed paste - may be used in hummus - check label)",
            "Tree nuts (almonds - Prunus dulcis, walnuts - Juglans regia, cashews - Anacardium occidentale, etc.)",
            "Soybeans (Glycine max)",
            "Lupin (Lupinus spp.)"
]),Information(allergy: "Egg", ingredients: [
        "Chicken eggs (Gallus domesticus eggs)",
        "Duck eggs (Anas platyrhynchos eggs)",
        "Goose eggs (Anser anser eggs)",
        "Quail eggs (Coturnix coturnix eggs)",
        "Ostrich eggs (Struthio camelus eggs)",
        "Egg yolks",
        "Egg whites",
        "Liquid eggs",
        "Dried eggs",
        "Powdered eggs",
        "Egg noodles",
        "Mayonnaise (usually contains egg yolk)",
        "Salad dressings (may contain egg yolk or egg whites)",
        "Sauces (may contain egg yolk or egg whites)",
        "Marinades (may contain egg yolk or egg whites)",
        "Custard",
        "Pudding (may contain egg yolk or egg whites)",
        "French toast (dipped in egg)",
        "Pancakes (may contain egg)",
        "Waffles (may contain egg)",
        "Quiche",
        "Frittata",
        "Baked goods (may contain egg - check label)",
        "Breaded and fried foods (may contain egg wash)",
        "Meatloaf (may contain egg)",
        "Stuffing (may contain egg)",
        "Eggnog (made with eggs and milk)",
        "Meringue",
        "Marshmallows (may contain egg whites)",
        "Royal icing (made with egg whites)",
        "Albumen (another term for egg white)",
        "Lecithin (derived from egg yolk in some cases - check label)",
        "Ovovitellin (egg yolk protein)",
        "Ovalbumin (egg white protein)",
        "Lysozyme (enzyme sometimes derived from egg whites)",
        "Dishes with unknown ingredients (exercise caution)",
        "Restaurants with a high risk of egg contamination (e.g., bakeries)",
        "Eggs (chicken, duck, goose, quail, ostrich, etc.)",
        "Egg yolks",
        "Egg whites",
        "Liquid eggs",
        "Dried eggs",
        "Powdered eggs",
        "Mayonnaise",
        "Albumen",
        "Lecithin (if derived from egg yolk)",
        "Ovovitellin",
        "Ovalbumin",
        "Lysozyme (if derived from egg whites)"
]),Information(allergy: "Milk", ingredients: [
        "Cow's milk (Bos taurus milk)",
        "Goat's milk (Capra hircus milk)",
        "Sheep's milk (Ovis aries milk)",
        "Buffalo milk (Bubalus bubalis milk)",
        "Whole milk",
        "Skim milk",
        "Low-fat milk",
        "Condensed milk",
        "Evaporated milk",
        "Powdered milk",
        "Dry milk solids",
        "Non-dairy creamer (may contain milk derivatives - check label)",
        "Cheese (most cheeses contain milk protein - check label for exceptions)",
        "Yogurt (most yogurts contain milk protein - check label for exceptions)",
        "Butter",
        "Ghee (clarified butter)",
        "Ice cream (usually made with milk)",
        "Puddings (may contain milk)",
        "Custard (usually made with milk)",
        "Milk chocolate",
        "White chocolate (may contain milk derivatives - check label)",
        "Baked goods (may contain milk or milk derivatives - check label)",
        "Pancakes (may contain milk)",
        "Waffles (may contain milk)",
        "French toast (may contain milk)",
        "Cream sauces (usually made with milk)",
        "Soups (may contain milk or milk derivatives - check label)",
        "Mashed potatoes (may contain milk or butter)",
        "Marinades (may contain milk derivatives)",
        "Protein bars (may contain milk derivatives - check label)",
        "Processed meats (may contain milk derivatives - check label)",
        "Infant formula (made from cow's milk or soy)",
        "Casein (milk protein)",
        "Whey (milk protein)",
        "Lactose (milk sugar)",
        "Lactalbumin (milk protein)",
        "Lac globulin (milk protein)",
        "Butyric acid (fatty acid found in milk)",
        "Dishes with unknown ingredients (exercise caution)",
        "Restaurants with a high risk of milk contamination (e.g., bakeries, cheese shops)",
        "Milk (cow's, goat's, sheep's, buffalo's, etc.)",
        "Whole milk",
        "Skim milk",
        "Low-fat milk",
        "Condensed milk",
        "Evaporated milk",
        "Powdered milk",
        "Dry milk solids",
        "Non-dairy creamer (if contains milk derivatives)",
        "Cheese (except hard cheeses like cheddar, parmesan, swiss - check label)",
        "Yogurt (except some lactose-free yogurts - check label)",
        "Butter",
        "Ghee",
        "Ice cream",
        "Casein",
        "Whey",
        "Lactose",
        "Lactalbumin",
        "Lac globulin",
        "Butyric acid"
]),Information(allergy: "Kidney Beans", ingredients: [
        "Kidney beans (Phaseolus vulgaris)",
        "Red kidney beans",
        "Light red kidney beans",
        "Dark red kidney beans",
        "Chili beans (often contain kidney beans)",
        "Kidney bean soup",
        "Kidney bean salad",
        "Mixed bean dishes (may contain kidney beans)",
        "Burritos (may contain kidney beans)",
        "Tacos (may contain kidney beans)",
        "Chili (may contain kidney beans)",
        "Refried beans (may contain kidney beans)",
        "Baked beans (may contain kidney beans - check label)",
        "Kidney bean flour",
        "Other legumes (e.g., lentils, chickpeas, peanuts, soybeans) - consult an allergist for testing"
]),Information(allergy: "Fish and Shellfish", ingredients: [
        "Fin Fish (various species - consult an allergist for specific sensitivities)",
        "Salmon (Salmo salar)",
        "Tuna (Thunnus spp.)",
        "Cod (Gadus morhua)",
        "Trout (Oncorhynchus spp.)",
        "Haddock (Melanogrammus aeglefinus)",
        "Flounder (Paralichthys spp.)",
        "Tilapia (Oreochromis spp.)",
        "Shellfish (various species - consult an allergist for specific sensitivities)",
        "Shrimp (Penaeus spp.)",
        "Crab (Cancer spp.)",
        "Lobster (Homarus spp.)",
        "Clams (Veneridae spp.)",
        "Oysters (Crassostrea spp.)",
        "Mussels (Mytilus spp.)",
        "Scallops (Pecten spp.)",
        "Squid (Loligo spp.)",
        "Octopus (Octopus vulgaris)",
        "Fish sauce",
        "Oyster sauce",
        "Worcestershire sauce (may contain anchovies)",
        "Surimi (often made from fish)",
        "Fish oil supplements",
        "Fish broth or stock"
]),Information(allergy: "Palm Oil", ingredients: [
        "Palm oil (Elaeis guineensis)",
        "Palm kernel oil",
        "Palm kernel extract",
        "Palm fractions (e.g., palmitate)"
]),Information(allergy: "Avocado", ingredients: [
        "Avocado (Persea americana)",
        "Avocado oil (unless highly refined)",
        "Avocado butter",
        "Avocado puree",
        "Guacamole (made with avocado)",
        "Salsa (may contain avocado)",
        "Salad dressings (may contain avocado)",
        "Sauces (may contain avocado)",
        "Dips (may contain avocado)",
        "Smoothies (may contain avocado)",
        "Baked goods (may contain avocado - check label)",
        "Processed foods (may contain avocado oil - check label)"
]), Information(allergy: "Wheat", ingredients: [
    "Wheat (Triticum aestivum)",  // Common wheat
            "Durum wheat (Triticum durum)",
            "Spelt (Triticum spelta)",
            "Kamut (Triticum turgidum ssp. turanicum)",
            "Einkorn (Triticum monococcum)",
            "Wheat flour (all varieties - white, whole wheat, spelt flour, etc.)",
            "Wheat bran",
            "Wheat germ",
            "Semolina (made from durum wheat)",
            "Bread (all varieties unless wheat-free)",
            "Pasta (all varieties unless wheat-free)",
            "Cereals (may contain wheat - check label)",
            "Baked goods (cakes, cookies, pastries, etc. - unless wheat-free)",
            "Crackers",
            "Panko breadcrumbs",
            "Wheatgrass (Triticum aestivum)",
            "Seitan (wheat gluten protein)",
            "Wheat starch",
            "Wheat malt",
            "Wheat pasta sauce (may contain wheat flour)",
            "Soy sauce (may contain wheat - check label)",
            "Broth (may contain wheat - check label)",
            "Gravies (may contain wheat - check label)",
            "Sausages (may contain wheat fillers - check label)",
            "Processed meats (may contain wheat fillers or hydrolyzed wheat protein - check label)",
            "Breaded and fried foods (unless gluten-free breading is used)"
]),Information(allergy: "Crustaceans", ingredients: [
    "Shrimp (whole, dried, powdered)",
            "Crab (whole, meat, paste)",
            "Lobster (whole, meat, tail)",
            "Crawfish (whole, tails)",
            "Krill oil",
            "Shellfish broth or stock",
            "Fish sauce (may contain shrimp or krill)",
            "Shrimp paste (used in Southeast Asian cuisine)",
            "Crab paste (used in some Asian and European dishes)",
            "Remoulade sauce (may contain shrimp)",
            "Bisque (often made with lobster or crab)",
            "Etouffee (may contain crawfish)",
            "Paella (may contain shrimp or lobster)",
            "Gumbo (may contain shellfish)",
            "Lowcountry boil (may contain shrimp, crab, and other shellfish)",
            "Sushi and sashimi (may contain raw shrimp, crab, or lobster)",
    "Shrimp (Penaeus spp.)",
            "Crab (Cancer spp.)",
            "Lobster (Homarus spp.)",
            "Clams (Veneridae spp.) are not crustaceans (mollusks), but can be included for informational purposes.",
            "Oysters (Crassostrea spp.) are not crustaceans (mollusks), but can be included for informational purposes.",
            "Mussels (Mytilus spp.)",
            "Scallops (Pecten spp.)",
            "Barnacles (Balanomorpha spp.)",
            "Krill (Euphausiacea spp.)",
            "Sea lice (Copepoda spp.)",
            "Langoustine (Nephrops norvegicus)"
])

]
