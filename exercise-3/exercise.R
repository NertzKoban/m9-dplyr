# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
require(fueleconomy)
require(dplyr)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
just.acura <- filter(vehicles, make == 'Acura')
best.hwy.mpg <- filter(just.acura, hwy == max(hwy))
best.model <- select(best.hwy.mpg, id)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.model <- select(
                filter(
                  filter(vehicles, make == 'Acura'), 
                hwy == max(hwy)), 
              id)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.model <- filter(vehicles, make == 'Acura') %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
