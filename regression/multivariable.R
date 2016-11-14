n = 100; x = rnorm(n); x2 = rnorm(n); x3 = rnorm(n)

## Generate the data
y = 1 + x + x2 + x3 + rnorm(n, sd = .1)

## Get the residuals having removed X2 and X3 from X1 and Y
ey = resid(lm(y ~ x2 + x3))
ex = resid(lm(x ~ x2 + x3))
## Fit regression through the origin with the residuals

sum(ey * ex) / sum(ex ^ 2)
## Double check with lm

coef(lm(ey ~ ex - 1))
## Fit the full linear model to show that it agrees

coef(lm(y ~ x + x2 + x3))
