package purchase

// NeedsLicense determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
func NeedsLicense(kind string) bool {
	if kind == "car" { 
    	return true
    } else if kind == "truck" { 
    	return true
    }
	return false
}

// ChooseVehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
func ChooseVehicle(option1, option2 string) string {
	chosen := option1
    if option1 > option2 { 
        chosen = option2
    }

    return chosen + " is clearly the better choice."
}

// CalculateResellPrice calculates how much a vehicle can resell for at a certain age.
func CalculateResellPrice(originalPrice, age float64) float64 {
	modifier := 0.5
    if age < 3 { 
        modifier = 0.8
    } else if age < 10 {
        modifier = 0.7
    }
	return originalPrice * modifier
}
