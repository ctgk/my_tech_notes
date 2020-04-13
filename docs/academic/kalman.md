# Kalman Filter

The model of Kalman filter with fixed system and measurement model:

$$
\begin{aligned}
p(x_n, z_n, \cdots, z_0) &= p(x_n|z_n) \left[\prod_{i=1}^n p(z_i|z_{i-1})\right]p(z_0)\\
&= \mathcal{N}(x_n|Cz_n, \Sigma)
    \left[\prod_{i=1}^n \mathcal{N}(z_i|Az_{i-1},\Gamma)\right]
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
|$M[i,j]$|Element of matrix $M$ at $i^\text{th}$ row $j^\text{th}$ column.|

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
K_n = P_nC^\top(CP_nC^\top + \Sigma)^{-1}.
$$

## Example

### Scalar

Let $A = 1$, $C=1$, prediction step and filtering step will be,

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

### Classical Mechanics

Let the time update of position $r$ and velocity ${\dot r}$ be

$$
\begin{cases}
    r_n &\leftarrow r_{n-1} + {\dot r}_{n-1}\Delta t + {1\over2}a(\Delta t)^2\\
    {\dot r}_{n} &\leftarrow {\dot r}_{n-1} + a\Delta t.
\end{cases}
$$

Let our internal state be

$$
\mu_n = \left[\begin{array}{c}
    r_n\\
    {\dot r}_n
\end{array}\right],
$$

then the prediction step is

$$
\begin{aligned}
\mu_n &\leftarrow A\mu_{n-1}\\
\Leftrightarrow
\left[\begin{array}{c}
    r_n\\
    {\dot r}_n
\end{array}\right]
&\leftarrow
\left[\begin{array}{cc}
    1 & \Delta t\\
    0 & 1
\end{array}\right]\mu_{n-1}\\
P_n &\leftarrow AP_nA^\top +
    \left[\begin{array}{c}{1\over2}a(\Delta t)^2\\a\Delta t\end{array}\right]
    \left[\begin{array}{cc}{1\over2}a(\Delta t)^2 & a\Delta t\end{array}\right]\\
    &= \left[\begin{array}{cc}1&\Delta t\\0&1\end{array}\right]
    P_{n-1} \left[\begin{array}{cc}1&0\\\Delta t&1\end{array}\right]
    + \left[\begin{array}{cc}
        {1\over4}(\Delta t)^4 & {1\over2}(\Delta t)^3\\
        {1\over2}(\Delta t)^3 & (\Delta t)^2
    \end{array}\right] a^2.
\end{aligned}
$$

Let us observe position $x_n$ with measurement noise $\sigma_x^2$, the filtering step is

$$
\begin{aligned}
\mu_n &\leftarrow \mu_n + K_n(x_n - r_n)\\
    &= \left[\begin{array}{c}
    \frac{\sigma_x^2r_n + P_n[0, 0]x_n}{P_n[0, 0] + \sigma_x^2}\\
    {\dot r}_n + \frac{P_n[1, 0]}{P_n[0, 0] + \sigma_x^2}(x_n - r_n)
    \end{array}\right]\\
P_n &\leftarrow P_n
    - P_n \left[\begin{array}{c}1\\0\end{array}\right]
    \frac{1}{P_n[0,0] + \sigma_x^2}
    [\begin{array}{cc} 1 & 0\end{array}]P_n\\
    &= P_n - \frac{1}{P_n[0,0] + \sigma_x^2}\left[\begin{array}{cc}
        P_n[0,0] P_n[0,0] & P_n[0,0] P_n[0,1]\\
        P_n[0,0] P_n[1,0] & P_n[0,1] P_n[1,0]
    \end{array}\right]\\
    &= \frac{1}{P_n[0,0] + \sigma_x^2}\left[\begin{array}{cc}
        P_n[0,0]\sigma_x^2 & P_n[0,1]\sigma_x^2\\
        P_n[1,0]\sigma_x^2 & P_n[0,0]P_n[1,1] + P_n[1,1]\sigma_x^2 - P_n[0,1]P_n[1,0]
    \end{array}\right],
\end{aligned}
$$

where Kalman gain $K_n$ is

$$
K_n = {1\over P_n[0, 0] + \sigma_x^2}\left[\begin{array}{c}
    P_n[0, 0]\\
    P_n[1, 0]
\end{array}\right].
$$

Note that update rule of the first element of $\mu_n$ is just an interpolation of predicted value and observed value, which is indentical with [the filtering of scalar $\mu_n$](kalman.md#scalar). Also the the first element of $P_n$.

### Classical Mechanics (2)

Let the time update of position $r$, velocity ${\dot r}$, acceleration ${\ddot r}$ be

$$
\begin{cases}
    r_n &\leftarrow r_{n-1} + {\dot r}_{n-1}\Delta t + {1\over2}{\ddot r}_n(\Delta t)^2 + {1\over6}j(\Delta t)^3\\
    {\dot r}_n &\leftarrow {\dot r}_{n-1} + {\ddot r}_{n-1}\Delta t + {1\over2}j(\Delta t)^2\\
    {\ddot r}_n &\leftarrow {\ddot r}_{n-1} + j\Delta t.
\end{cases}
$$

Defining the internal state as

$$
\mu_n = \left[\begin{array}{c}
    r_n\\
    {\dot r}_n\\
    {\ddot r}_n
\end{array}\right],
$$

the prediction step is

$$
\begin{aligned}
    \mu_n &\leftarrow A \mu_{n-1}\\
    &= \left[\begin{array}{ccc}
        1 & \Delta t & {1\over2}(\Delta t)^2\\
        0 & 1 & \Delta t\\
        0 & 0 & 1
    \end{array}\right] \mu_{n-1}\\
    P_n &\leftarrow AP_nA^\top + \left[\begin{array}{c}
        {1\over6}j(\Delta t)^3\\
        {1\over2}j(\Delta t)^2\\
        j\Delta t
    \end{array}\right]
    [\begin{array}{ccc}
        {1\over6}j(\Delta t)^3
        & {1\over2}j(\Delta t)^2
        & j\Delta t
    \end{array}]\\
    &= AP_nA^\top + \left[\begin{array}{ccc}
        {1\over36}(\Delta t)^6 & {1\over12}(\Delta t)^5 & {1\over6}(\Delta t)^4\\
        {1\over12}(\Delta t)^5 & {1\over4}(\Delta t)^4 & {1\over2}(\Delta t)^3\\
        {1\over6}(\Delta t)^4 & {1\over2}(\Delta t)^3 & (\Delta t)^2
    \end{array}\right]j^2.
\end{aligned}
$$

Given observed position $x_n$ with mesurement noise $\sigma_x^2$, the filtering step is

$$
\begin{aligned}
    \mu_n &\leftarrow \mu_n + K_n(x_n - \mu_n)\\
    &= \left[\begin{array}{c}
    \frac{\sigma_x^2r_n + P_n[0, 0]x_n}{P_n[0, 0] + \sigma_x^2}\\
    {\dot r}_n + \frac{P_n[1, 0]}{P_n[0, 0] + \sigma_x^2}(x_n - r_n)\\
    {\ddot r}_n + \frac{P_n(2, 0)}{P_n[0, 0] + \sigma_x^2}(x_n - r_n)
    \end{array}\right]\\
    P_n &\leftarrow P_n - P_n\left[\begin{array}{c}1\\0\\0\end{array}\right]
        \frac{1}{P_n[0,0] + \sigma_x^2}[\begin{array}{ccc}1&0&0\end{array}]P_n
\end{aligned}
$$

where Kalman gain $K_n$ is

$$
K_n = \frac{1}{P_n[0,0] + \sigma_x^2}\left[\begin{array}{c}
    P_n[0,0]\\
    P_n[1,0]\\
    P_n[2,0]
\end{array}\right].
$$
