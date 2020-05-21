# Recursive Bayesian Estimation

## Hidden Markov Model

Hidden Markov model (HMM):

$$
p(x_n) = p(x_n|z_n) \left(\prod_{i=1}^n p(z_i|z_{i-1})\right) p(z_0),
$$

|Notation|Description|
|---|---|
|$z_0$|Initial hidden random variable.|
|$z_n$|Hidden random variable at step $n$.|
|$x_n$|Observed random variable at step $n$.|

## Prediction

Estimating hidden random variable $z_n$ given a probablity distribution of previous hidden random variable $z_{n-1}$.

$$
p(z_n|...) = \int p(z_n|z_{n-1})p(z_{n-1}|...) {\rm d}z_{n-1}
$$

## Filtering

Updating estimation of a hidden random variable $z_n$ given a corresponding observation $x_n=X_n$.

$$
p(z_n|x_n=X_n, ...) \propto p(x_n=X_n|z_n)p(z_n | ...)
$$

## Smoothing

Updating estimation of hidden random variables $\{z_n\}_{n=0}^N$
given an entire observation sequence $\{x_n\}_{n=0}^N$.

$$
\begin{aligned}
    p(z_n|x_1,...,x_N) &= \int p(z_n, z_{n+1}|x_1,...,x_N) {\rm d}z_{n+1}\\
    &= \int p(z_n|z_{n+1}, x_1,...,x_N) p(z_{n+1}|x_1,...,x_N) {\rm d}z_{n+1}\\
    &= \int p(z_n|z_{n+1}, x_1,...,x_n) p(z_{n+1}|x_1,...,x_N) {\rm d}z_{n+1}\\
    &= \int \frac{p(z_{n+1}|z_n)p(z_n|x_1,...,x_n)}
    {p(z_{n+1}|x_1,...,x_n)} p(z_{n+1}|x_1,...,x_N) {\rm d}z_{n+1}\\
    &= p(z_n|x_1,...,x_n) \int
    \frac{p(z_{n+1}|x_1,...,x_N) p(z_{n+1}|z_n)}{p(z_{n+1}|x_1,...,x_n)}
    {\rm d}z_{n+1}
\end{aligned}
$$
