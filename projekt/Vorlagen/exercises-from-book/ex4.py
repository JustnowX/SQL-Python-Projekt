#total cars
cars = 100
#platz für personen pro auto
space_in_car = 4.0
#fahrer eines autos
drivers = 30
#beifahrer
passengers = 90
#autos die nicht gefahren werden
cars_not_driven = cars - drivers

cars_driven = drivers
carpool_capacity = cars_driven * space_in_car
avarage_passengers_per_car = passengers / cars_driven

print("there are", cars, "cars available")
print("there are only", drivers,"drivers available")
print("there will be", cars_not_driven,"empty cars")
print("we can transport", carpool_capacity, "people today")
print("we have", passengers, "to carpool today")
print("we need to put about", avarage_passengers_per_car,"in each car")
