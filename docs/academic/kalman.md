# Kalman Filter

The model of Kalman filter with fixed system and measurement model:

$$
\begin{aligned}
p(x_n) &= p(x_n|z_n) \left(\prod_{i=1}^n p(z_i|z_{i-1})\right)p(z_0)\\
&= \mathcal{N}(x_n|Az_n, \Sigma)
    \left(\prod_{i=1}^n \mathcal{N}(z_n|Az_{n-1},\Gamma)\right)
    \mathcal{N}(z_0|\mu_0,P_0).
\end{aligned}
$$

|Notations   |Descriptions   |
|:-:|---|
|$\mathcal{N}$| Gaussian distribution of a random variable parameterized by mean and covariance.|
|$z_n$ | Random variable of internal state.  |
|$\mu_n$| Mean parameter of internal state.|
|$P_n$|Covariance parameter of internal state.|
|$A$| System matrix. |
|$\Gamma$|Covariance matrix of system noise.|
|$x_n$|Random variable of observation.|
|$C$|Measurement matrix.|
|$\Sigma$|Covariance matrix of measurement noise.|

## Prediction

Given the distribution of $z_{n-1}$,

$$
p(z_{n-1}|...) = \mathcal{N}(z_{n-1}|\mu_{n-1}, P_{n-1}),
$$

the distribution of next internal state is

$$
\begin{aligned}
p(z_n|...) &= \int p(z_n|z_{n-1})p(z_{n-1}|...){\rm d}z_{n-1}\\
&= \mathcal{N}(z_n|A\mu_{n-1}, AP_{n-1}A^{\top}+\Gamma).
\end{aligned}
$$

## Filtering

Given the distribution of $z_n$,

$$
p(z_n|...) = \mathcal{N}(z_n|\mu_n, P_n),
$$

and a new observation $x_n$, the posterior distribution of $z_n$ is

$$
\begin{aligned}
p(z_n|x_n, ...) &\propto p(x_n|z_n)p(z_n|...)\\
&= \mathcal{N}(z_n|\mu_n + K_n(x_n - C\mu_n), (I - K_nC)P_n),
\end{aligned}
$$

where Kalman gain matrix $K_n$ is

$$
K_n = P_nC(CP_nC^{\top} + \Sigma)^{-1}.
$$

## Example

### Scalar

Let $A = 1$, $C=1$, $\mu_0 = 0$, $P_0 = 1$, prediction step and filtering step will be,

$$
\begin{aligned}
    {\rm Prediction} & \begin{cases}
        \mu_n &\leftarrow \mu_{n-1}\\
        P_n &\leftarrow P_{n-1} + \Gamma & \text{(Sum)}
    \end{cases}\\
    {\rm Filtering~} & \begin{cases}
        \mu_n \leftarrow \frac{\Sigma\mu_n + P_nx_n}{P_n + \Sigma} & \text{(Interpolation)}\\
        P_n \leftarrow \frac{P_n\Sigma}{P_n + \Sigma} & \text{(Harmonic sum)}.
    \end{cases}
\end{aligned}
$$
