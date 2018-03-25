#  Import libraries
library(functional)


#  Helper functions
print_result = function(ej, result){
    print(sprintf("Ejercicio %i - resultado: %f", ej, result))
}


#  Exercises

#  Ejercicio 3: 3 different implementations

ejercicio=3
func_3 = function(x, z){
    result = 1 / (x+ z^2 + 2)
    return(result)
}

result = 0
for (i in 1:15){
    for (j in 1:i) {
        result = result + func_3(i, j)
    }
}
print_result(ejercicio, result)

result = 0
for (i in 1:15){
    range = Map(Curry(func_3, x=i), 1:i)
    result = result + Reduce(function(x,y) {x + y}, range)
}
print_result(ejercicio, result)

Reduce(function(x,y) {x + y}, Map(function(i) {Reduce(function(x,y) {x + y}, Map(Curry(func_3, x=i), 1:i))}, 1:15 ))
print_result(ejercicio, result)


#  Ejercicio 4
ejercicio = 4
result = i = 0
while(result <= 1000000){
    result = result + i
    i = i + 1
}
print_result(ejercicio, i)

#  Ejercicio 5 
result = Reduce(function(x,y) {x + y}, runif(100, 0, 1))
print_result(5, result)


#  Ejercicio 11
x = seq(-500, 500, length=1000)	
plot(x, Map(function(x) {sin(x)}, x), type="l")
matplot(x, Map(function(x) {sin(x)^2}, x),add=T)


#  Ejericio 14 - TODO: consultar
people_count = 20
experiment_count = 100

two_people = function(birthdays) {
    for (i in 1:100){
        for (j in 1:(length(birthdays)-1)) {
            if (birthdays[j] == birthdays[j+1]) return(1)
        }
    }
    return(0)
}

count = 0
for (i in 1:experiment_count) {
  birthdays = sort(sample(1:365, people_count, replace=TRUE))
  count = count + two_people(birthdays)
}
prob = sum(count) / experiment_count
print_result(14, prob)
print(sprintf('Theoretical result: %f', 1 - prod(365:347) / 365^19))

#  Ejercicio 15

#  Define a function that updates the available money by evaluating a bet result. 
get_bet_result = function() {
  color = sample(c('r','n','v'), size=1, replace=TRUE, prob=c(18/37,18/37,1/37))[]
  if (color == 'r') {
    return(1)
  } else {
    return(-1)
  }
}

results = c()
for (i in 1:100) {
    available_money = 100
    play_count = 0
    while (available_money > 0) {
      available_money = available_money + get_bet_result()
      play_count = play_count + 1
    }
    results[i] = play_count
}
hist(results)
print_result(15, mean(results))






