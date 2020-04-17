# Kalman Filter

Consider the following hidden Markov model with fixed system and measurement model:

$$
\begin{aligned}
p(\bm z_n, \bm x_n, \cdots, \bm x_0) &= p(\bm z_n|\bm x_n)
    \left[\prod_{i=1}^n p(\bm x_i|\bm x_{i-1})\right]
    p(\bm x_0)\\
&= \mathcal{N}(\bm z_n|H\bm x_n, \Sigma)
    \left[\prod_{i=1}^n \mathcal{N}(\bm x_i|F\bm x_{i-1},\Gamma)\right]
    \mathcal{N}(\bm x_0|\bm\mu_0,P_0).
\end{aligned}
$$

| Notations | Descriptions |
|:-:|---|
|$\mathcal{N}$| Gaussian distribution of a random variable parameterized by mean and covariance.|
|$\bm x_n$ | Random variable of internal state. |
|$\bm\mu_n$| Mean parameter of internal state.|
|$P_n$|Covariance parameter of internal state.|
|$F$| System matrix. |
|$\Gamma$|Covariance matrix of system noise.|
|$\bm z_n$|Random variable of observation.|
|$H$|Measurement matrix.|
|$\Sigma$|Covariance matrix of measurement noise.|
|$M[i,j]$|Element of matrix $M$ at $i^\text{th}$ row $j^\text{th}$ column.|

## Prediction

Given the distribution of $\bm x_{n-1}$,

$$
p(\bm x_{n-1}|...) = \mathcal{N}(\bm x_{n-1}|\bm\mu_{n-1}, P_{n-1}),
$$

the distribution of next internal state is

$$
\begin{aligned}
p(\bm x_n|...) &= \int p(\bm x_n|\bm x_{n-1})p(\bm x_{n-1}|...){\rm d}\bm x_{n-1}\\
&= \mathcal{N}(\bm x_n|F\bm\mu_{n-1}, FP_{n-1}F^{\top}+\Gamma).
\end{aligned}
$$

## Filtering

Given the distribution of $\bm x_n$,

$$
p(\bm x_n|...) = \mathcal{N}(\bm x_n|\bm\mu_n, P_n),
$$

and a new observation $\bm z_n$, the posterior distribution of $\bm x_n$ is

$$
\begin{aligned}
p(\bm x_n|\bm z_n, ...) &\propto p(\bm z_n|\bm x_n)p(\bm x_n|...)\\
&= \mathcal{N}(\bm z_n|\bm\mu_n + K_n(\bm x_n - H\bm\mu_n), (I - K_nH)P_n),
\end{aligned}
$$

where Kalman gain matrix $K_n$ is

$$
K_n = P_nH^\top(HP_nH^\top + \Sigma)^{-1}.
$$

## Example

### Scalar

Let $F = 1$, $H=1$, prediction step and filtering step will be,

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

Let the time update of position $x$ and velocity ${\dot x}$ be

$$
\begin{cases}
    x_n &\leftarrow x_{n-1} &+& {\dot x}_{n-1}\Delta t &+& {1\over2}a(\Delta t)^2\\
    {\dot x}_{n} &\leftarrow && {\dot x}_{n-1} &+& a\Delta t.
\end{cases}
$$

Let our internal state be

$$
\bm\mu_n = \begin{bmatrix}
    x_n\\
    {\dot x}_n
\end{bmatrix},
$$

then the prediction step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow F\bm\mu_{n-1}\\
\Leftrightarrow&
    \begin{bmatrix}x_n\\ {\dot x}_n\\ \end{bmatrix}
    \leftarrow \begin{bmatrix}1 & \Delta t\\ 0 & 1\end{bmatrix}
    \begin{bmatrix} x_{n-1}\\ {\dot x}_{n-1}\\ \end{bmatrix}\\
P_n &\leftarrow HP_nH^\top +
    \begin{bmatrix} {1\over2}a(\Delta t)^2 \\ a\Delta t \end{bmatrix}
    \begin{bmatrix} {1\over2}a(\Delta t)^2 & a\Delta t \end{bmatrix}\\
    &= \begin{bmatrix} 1 & \Delta t\\ 0 & 1\end{bmatrix}
    P_{n-1} \begin{bmatrix} 1 & 0\\ \Delta t & 1\end{bmatrix}
    + \begin{bmatrix}
        {1\over4}(\Delta t)^4 & {1\over2}(\Delta t)^3\\
        {1\over2}(\Delta t)^3 & (\Delta t)^2
    \end{bmatrix} a^2.
\end{aligned}
$$

Let us observe position $z_n$ with measurement noise $\sigma_z^2$,
the measurement matrix $H = \begin{bmatrix}1 & 0\end{bmatrix}$ and
the filtering step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow \bm\mu_n + K_n(z_n - H\bm\mu_n)\\
    &= \begin{bmatrix}
    \frac{\sigma_z^2x_n + P_n[0, 0]z_n}{P_n[0, 0] + \sigma_z^2}\\
    {\dot x}_n + \frac{P_n[1, 0]}{P_n[0, 0] + \sigma_z^2}(z_n - x_n)
    \end{bmatrix}\\
P_n &\leftarrow P_n
    - P_n \begin{bmatrix}1\\ 0\end{bmatrix}
    \frac{1}{P_n[0,0] + \sigma_z^2}
    \begin{bmatrix} 1 & 0\end{bmatrix}P_n\\
&= P_n - \frac{1}{P_n[0,0] + \sigma_z^2}\begin{bmatrix}
        P_n[0,0] P_n[0,0] & P_n[0,0] P_n[0,1]\\
        P_n[0,0] P_n[1,0] & P_n[0,1] P_n[1,0]
    \end{bmatrix}\\
&= \frac{1}{P_n[0,0] + \sigma_z^2}\begin{bmatrix}
        P_n[0,0]\sigma_z^2 & P_n[0,1]\sigma_z^2\\
        P_n[1,0]\sigma_z^2 & P_n[0,0]P_n[1,1] + P_n[1,1]\sigma_z^2 - P_n[0,1]P_n[1,0]
    \end{bmatrix},
\end{aligned}
$$

where Kalman gain $K_n$ is

$$
K_n = {1\over P_n[0, 0] + \sigma_x^2}
    \begin{bmatrix}P_n[0, 0]\\ P_n[1, 0]\end{bmatrix}.
$$

Note that update rule of the first element of $\mu_n$ is just an interpolation of predicted value and observed value, which is indentical with [the filtering of scalar $\mu_n$](kalman.md#scalar). Also the the first element of $P_n$.

### Classical Mechanics (2)

Let the time update of position $x$, velocity ${\dot x}$, acceleration ${\ddot x}$ be

$$
\begin{cases}
x_n &\leftarrow x_{n-1} &+& {\dot x}_{n-1}\Delta t
    &+& {1\over2}{\ddot x}_n(\Delta t)^2 &+& {1\over6}j(\Delta t)^3\\
{\dot x}_n &\leftarrow && {\dot x}_{n-1} &+& {\ddot x}_{n-1}\Delta t
    &+& {1\over2}j(\Delta t)^2\\
{\ddot x}_n &\leftarrow && && {\ddot x}_{n-1} &+& j\Delta t.
\end{cases}
$$

Defining the internal state as

$$
\bm\mu_n = \begin{bmatrix}
    x_n\\
    {\dot x}_n\\
    {\ddot x}_n
\end{bmatrix},
$$

the prediction step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow F \bm\mu_{n-1}\\
\Leftrightarrow& \begin{bmatrix}x_n\\ {\dot x}_n\\ {\ddot x}_n\end{bmatrix}
    \leftarrow \begin{bmatrix}
        1 & \Delta t & {1\over2}(\Delta t)^2\\
        0 & 1 & \Delta t\\
        0 & 0 & 1
    \end{bmatrix}
    \begin{bmatrix}
        x_{n-1}\\ {\dot x}_{n-1}\\ {\ddot x}_{n-1}\\
    \end{bmatrix}
\\
P_n &\leftarrow FP_nF^\top + \begin{bmatrix}
        {1\over6}j(\Delta t)^3\\ {1\over2}j(\Delta t)^2\\ j\Delta t
    \end{bmatrix}
    \begin{bmatrix}
        {1\over6}j(\Delta t)^3 & {1\over2}j(\Delta t)^2 & j\Delta t
    \end{bmatrix}\\
    &= FP_nF^\top + \begin{bmatrix}
        {1\over36}(\Delta t)^6 & {1\over12}(\Delta t)^5 & {1\over6}(\Delta t)^4\\
        {1\over12}(\Delta t)^5 & {1\over4}(\Delta t)^4 & {1\over2}(\Delta t)^3\\
        {1\over6}(\Delta t)^4 & {1\over2}(\Delta t)^3 & (\Delta t)^2
    \end{bmatrix}j^2.
\end{aligned}
$$

Given observed position $z_n$ with mesurement noise $\sigma_z^2$, the measurement matrix
$H = \begin{bmatrix}1 & 0 & 0\end{bmatrix}$ and the filtering step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow \bm\mu_n + K_n(z_n - H\bm\mu_n)\\
&= \begin{bmatrix}
        \frac{\sigma_z^2x_n + P_n[0, 0]z_n}{P_n[0, 0] + \sigma_z^2}\\
        {\dot x}_n + \frac{P_n[1, 0]}{P_n[0, 0] + \sigma_z^2}(z_n - x_n)\\
        {\ddot x}_n + \frac{P_n(2, 0)}{P_n[0, 0] + \sigma_z^2}(z_n - x_n)
    \end{bmatrix}\\
P_n &\leftarrow P_n - P_n\begin{bmatrix}1\\0\\0\end{bmatrix}
    \frac{1}{P_n[0,0] + \sigma_z^2}\begin{bmatrix}1 & 0 & 0\end{bmatrix}P_n\\
&= P_n - \frac{1}{P_n[0,0] + \sigma_z^2}
    \begin{bmatrix}
        P_n[0,0]P_n[0,0] & P_n[0,0]P_n[0,1] & P_n[0,0]P_n[0,2]\\
        P_n[1,0]P_n[0,0] & P_n[1,0]P_n[0,1] & P_n[1,0]P_n[0,2]\\
        P_n[2,0]P_n[0,0] & P_n[2,0]P_n[0,1] & P_n[2,0]P_n[0,2]\\
    \end{bmatrix}
\end{aligned}
$$

where Kalman gain $K_n$ is

$$
K_n = \frac{1}{P_n[0,0] + \sigma_z^2}\left[\begin{array}{c}
    P_n[0,0]\\
    P_n[1,0]\\
    P_n[2,0]
\end{array}\right].
$$
