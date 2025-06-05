// Package weather forecasts the current weather condition of various cities in Goblinocus.
package weather

// CurrentCondition specifies the current weather in the most recently forecast location.
var CurrentCondition string

// CurrentLocation specifies the location that the most recent forecast specified.
var CurrentLocation string

// Forecast outputs the current weathers conditions in a given location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
