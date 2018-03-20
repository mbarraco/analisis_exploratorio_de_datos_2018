
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
print(paste('result is', toString(result)))

result = 0
for (i in 1:15){
    range = Map(Curry(func_3, x=i), 1:i)
    result = result + Reduce(function(x,y) {x + y}, range)
}
print(paste('result is', toString(result)))


Reduce(function(x,y) {x + y}, Map(function(i) {Reduce(function(x,y) {x + y}, Map(Curry(func_3, x=i), 1:i))}, 1:15 ))


print(
    paste('result is', toString(result))
)

