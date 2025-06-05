package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, mins int) int {
    if mins == 0 {
    	mins = 2
    }
    return len(layers) * mins
}

// TODO: define the 'Quantities()' function
func Quantities(layers []string) (noodles int, sauce float64) {
    for i := 0; i < len(layers); i++ {
        if(layers[i] == "sauce") {
            sauce += 0.2
        } else if (layers[i] == "noodles") {
            noodles += 50
        }
    }
	return noodles, sauce
    
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendsIngredients []string, recipeIngredients []string) {
    recipeIngredients[len(recipeIngredients) - 1] = friendsIngredients[len(friendsIngredients) - 1]
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64 {
    newQuantities := make([]float64, len(quantities))
    for i := 0; i < len(quantities); i++ {
        newQuantities[i] = (quantities[i] / 2) * float64(portions)
    }
	return newQuantities
}
