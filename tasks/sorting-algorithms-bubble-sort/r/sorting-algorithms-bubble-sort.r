bubblesort <- function(v) {
  itemCount <- length(v)
  repeat {
    hasChanged <- FALSE
    itemCount <- itemCount - 1
    for(i in 1:itemCount) {
      if ( v[i] > v[i+1] ) {
        t <- v[i]
        v[i] <- v[i+1]
        v[i+1] <- t
        hasChanged <- TRUE
      }
    }
    if ( !hasChanged ) break;
  }
  v
}

executeTask <- function(i) {


v <- c(16+i,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85)
bubblesort (v)
	return(i)
}

r = 0
for(i in 0:1000000000) {
	r = executeTask(i)
}