//import Foundation
//
struct Ingredient {
    let name: String
}

let ingredients = [
    Ingredient(name: "potato"),
    Ingredient(name: "peanut"),
    Ingredient(name: "milk"),
    Ingredient(name: "egg"),
    Ingredient(name: "soy"),
    Ingredient(name: "wheat"),
    Ingredient(name: "fish"),
    Ingredient(name: "shellfish"),
    Ingredient(name: "tree nuts"),
    Ingredient(name: "almond"),
    Ingredient(name: "apple"),
    Ingredient(name: "apricot"),
    Ingredient(name: "artichoke"),
    Ingredient(name: "asparagus"),
    Ingredient(name: "avocado"),
    Ingredient(name: "banana"),
    Ingredient(name: "barley"),
    Ingredient(name: "basil"),
    Ingredient(name: "beef"),
    Ingredient(name: "beet"),
    Ingredient(name: "bell pepper"),
    Ingredient(name: "blackberry"),
    Ingredient(name: "blueberry"),
    Ingredient(name: "broccoli"),
    Ingredient(name: "brussels sprout"),
    Ingredient(name: "cabbage"),
    Ingredient(name: "carrot"),
    Ingredient(name: "cauliflower"),
    Ingredient(name: "celery"),
    Ingredient(name: "cherry"),
    Ingredient(name: "chicken"),
    Ingredient(name: "chickpea"),
    Ingredient(name: "chili pepper"),
    Ingredient(name: "chocolate"),
    Ingredient(name: "cilantro"),
    Ingredient(name: "cinnamon"),
    Ingredient(name: "clam"),
    Ingredient(name: "clove"),
    Ingredient(name: "coconut"),
    Ingredient(name: "cod"),
    Ingredient(name: "coffee"),
    Ingredient(name: "corn"),
    Ingredient(name: "cranberry"),
    Ingredient(name: "cucumber"),
    Ingredient(name: "cumin"),
    Ingredient(name: "date"),
    Ingredient(name: "duck"),
    Ingredient(name: "eggplant"),
    Ingredient(name: "fennel"),
    Ingredient(name: "fig"),
    Ingredient(name: "garlic"),
    Ingredient(name: "ginger"),
    Ingredient(name: "goat cheese"),
    Ingredient(name: "grape"),
    Ingredient(name: "grapefruit"),
    Ingredient(name: "green bean"),
    Ingredient(name: "green onion"),
    Ingredient(name: "guava"),
    Ingredient(name: "halibut"),
    Ingredient(name: "ham"),
    Ingredient(name: "hazelnut"),
    Ingredient(name: "honey"),
    Ingredient(name: "honeydew"),
    Ingredient(name: "horseradish"),
    Ingredient(name: "hot pepper"),
    Ingredient(name: "kiwi"),
    Ingredient(name: "lamb"),
    Ingredient(name: "leek"),
    Ingredient(name: "lemon"),
    Ingredient(name: "lentil"),
    Ingredient(name: "lettuce"),
    Ingredient(name: "lime"),
    Ingredient(name: "lobster"),
    Ingredient(name: "macadamia nut"),
    Ingredient(name: "mango"),
    Ingredient(name: "maple syrup"),
    Ingredient(name: "melon"),
    Ingredient(name: "mushroom"),
    Ingredient(name: "mustard"),
    Ingredient(name: "nutmeg"),
    Ingredient(name: "oat"),
    Ingredient(name: "olive"),
    Ingredient(name: "onion"),
    Ingredient(name: "orange"),
    Ingredient(name: "oregano"),
    Ingredient(name: "papaya"),
    Ingredient(name: "paprika"),
    Ingredient(name: "parsley"),
    Ingredient(name: "peach"),
    Ingredient(name: "pear"),
    Ingredient(name: "peas"),
    Ingredient(name: "pecan"),
    Ingredient(name: "pepper"),
    Ingredient(name: "pineapple"),
    Ingredient(name: "pistachio"),
    Ingredient(name: "plum"),
    Ingredient(name: "pomegranate"),
    Ingredient(name: "pork"),
    Ingredient(name: "potato"),
    Ingredient(name: "prawn"),
    Ingredient(name: "pumpkin"),
    Ingredient(name: "quinoa"),
    Ingredient(name: "radish"),
    Ingredient(name: "raspberry"),
    Ingredient(name: "red onion"),
    Ingredient(name: "rice"),
    Ingredient(name: "rosemary"),
    Ingredient(name: "saffron"),
    Ingredient(name: "salmon"),
    Ingredient(name: "scallion"),
    Ingredient(name: "sesame"),
    Ingredient(name: "shrimp"),
    Ingredient(name: "spinach"),
    Ingredient(name: "squash"),
    Ingredient(name: "strawberry"),
    Ingredient(name: "sweet potato"),
    Ingredient(name: "thyme"),
    Ingredient(name: "tofu"),
    Ingredient(name: "turkey"),
    Ingredient(name: "vanilla"),
    Ingredient(name: "walnut"),
    Ingredient(name: "watermelon"),
    Ingredient(name: "zucchini")
]

//import Foundation
//
//struct Ingredient {
//    let name: String
//}
//
//let ingredients: [String: [Ingredient]] = [
//    "peanut": [Ingredient(name: "peanut"), Ingredient(name: "almond"), Ingredient(name: "hazelnut")],
//    "milk": [Ingredient(name: "milk"), Ingredient(name: "cheese"), Ingredient(name: "yogurt")],
//    // Add other allergies and their corresponding ingredients here...
//]

//class User {
//    var allergies: [String]
//    
//    init(allergies: [String]) {
//        self.allergies = allergies
//    }
//}
//
//func getUnsafeIngredients(for user: User) -> [Ingredient] {
//    var unsafeIngredients: [Ingredient] = []
//    
//    for allergy in user.allergies {
//        if let ingredients = allergyIngredients[allergy] {
//            unsafeIngredients.append(contentsOf: ingredients)
//        }
//    }
//    
//    return unsafeIngredients
//}
//
//let user = User(allergies: ["peanut", "milk"])
//let unsafeIngredients = getUnsafeIngredients(for: user)
//
//print(unsafeIngredients)  // This will print all ingredients that include "peanut" and "milk"