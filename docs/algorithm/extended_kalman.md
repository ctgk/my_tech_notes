# Extended Kalman Filter

Consider the following hidden Markov model with fixed system and measurement model:

$$
\begin{aligned}
p(\bm z_n, \bm x_n, \cdots, \bm x_0) &= p(\bm z_n|\bm x_n)
    \left[\prod_{i=1}^n p(\bm x_i|\bm x_{i-1})\right]p(\bm x_0)\\
&= \mathcal{N}(\bm z_n|{\bm h}(\bm x_n), \Sigma)
    \left[\prod_{i=1}^n \mathcal{N}(\bm x_i|{\bm f}(\bm x_{i-1}),\Gamma)\right]
    \mathcal{N}(\bm x_0|{\bm\mu}_0,P_0).
\end{aligned}
$$

| Notations | Descriptions |
|:-:|---|
|$\mathcal{N}$| Gaussian distribution of a random variable parameterized by mean and covariance.|
|$\bm x_n$ | Random variable of internal state.  |
|${\bm\mu}_n$| Mean parameter of internal state.|
|$P_n$|Covariance parameter of internal state.|
|$\bm f(\cdot)$| System transition function. |
|$\Gamma$|Covariance matrix of system noise.|
|$\bm z_n$|Random variable of observation.|
|$\bm h(\cdot)$|Measurement function.|
|$\Sigma$|Covariance matrix of measurement noise.|
|$\bm v[i]$|$i^\text{th}$ element of vector ${\bm v}$.|
|$M[i,j]$|Element of matrix $M$ at $i^\text{th}$ row $j^\text{th}$ column.|

## Prediction

Given the distribution of $\bm x_{n-1}$,

$$
p(\bm x_{n-1}|...) = \mathcal{N}(\bm x_{n-1}|{\bm\mu}_{n-1}, P_{n-1}),
$$

the distribution of next internal state is

$$
\begin{aligned}
p(\bm x_n|...) &= \int p(\bm x_n|\bm x_{n-1})
    p(\bm x_{n-1}|...){\rm d}\bm x_{n-1}\\
&= \mathcal{N}(\bm x_n|f({\bm\mu}_{n-1}), F_{n-1}P_{n-1}F_{n-1}^{\top}+\Gamma),
\end{aligned}
$$

where matrix $F_{n-1}$ is

$$
\begin{aligned}
F_{n-1} &= \dd{\bm f}{\bm\mu} \biggr\rvert_{\bm\mu=\bm\mu_{n-1}}\\
&= \begin{bmatrix}
        \dd{\bm f[0]}{\bm\mu[0]}\biggr\rvert_{\bm\mu=\bm\mu_{n-1}}
        & \cdots
        & \dd{\bm f[0]}{\bm\mu[D]}\biggr\rvert_{\bm\mu=\bm\mu_{n-1}}\\
        \vdots & \ddots & \vdots\\
        \dd{\bm f[D]}{\bm\mu[0]}\biggr\rvert_{\bm\mu=\bm\mu_{n-1}}
        & \cdots
        & \dd{\bm f[D]}{\bm\mu[D]}\biggr\rvert_{\bm\mu=\bm\mu_{n-1}}\\
    \end{bmatrix}.
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
&= \mathcal{N}(\bm x_n|
    \bm\mu_n + K_n(\bm z_n - \bm h(\bm\mu_n)), (I - K_nH_n)P_n),
\end{aligned}
$$

where suboptimal Kalman gain matrix $K_n$ is

$$
K_n = P_nH_n^\top(H_nP_nH_n^\top + \Sigma)^{-1},
$$

and matrix $H_n$ is

$$
\begin{aligned}
H_n &= \dd{\bm h}{\bm\mu} \biggr\rvert_{\bm\mu=\bm\mu_n}\\
&= \begin{bmatrix}
        \dd{\bm h[0]}{\bm\mu[0]} \biggr\rvert_{\bm\mu=\bm\mu_n}
        & \cdots
        & \dd{\bm h[0]}{\bm\mu[D]}\biggr\rvert_{\bm\mu=\bm\mu_n}\\
        \vdots & \ddots & \vdots\\
        \dd{\bm h[D]}{\bm\mu[0]} \biggr\rvert_{\bm\mu=\bm\mu_n}
        & \cdots
        & \dd{\bm h[D]}{\bm\mu[D]}\biggr\rvert_{\bm\mu=\bm\mu_n}\\
    \end{bmatrix}.
\end{aligned}
$$

## Example

### Observing direction

Let the time update of position $(x, y)$ and velocity $({\dot x}, {\dot y})$ be

$$
\begin{cases}
x_n &\leftarrow& x_{n-1}&+&{\dot x}_{n-1}\Delta t&+&{1\over2}a_x(\Delta t)^2\\
{\dot x}_n &\leftarrow& && {\dot x}_{n-1} &+& a_x\Delta t\\
y_n &\leftarrow& y_{n-1}&+&{\dot y}_{n-1}\Delta t&+&{1\over2}a_y(\Delta t)^2\\
{\dot y}_{n} &\leftarrow& && {\dot y}_{n-1} &+& a_y\Delta t.
\end{cases}
$$

Let our internal state be

$$
\bm\mu_n = \begin{bmatrix}x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n\end{bmatrix},
$$

then the prediction step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow F\bm\mu_{n-1}\\
\Leftrightarrow&\begin{bmatrix}
        x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n
    \end{bmatrix}
    \leftarrow
    \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}
    \begin{bmatrix}
        x_{n-1}\\ {\dot x}_{n-1}\\ y_{n-1}\\ {\dot y}_{n-1}
    \end{bmatrix}
\\
P_n &\leftarrow FP_nF^\top
    + \begin{bmatrix}
        {1\over2}(\Delta t)^2 & 0\\
        \Delta t & 0\\
        0 & {1\over2}(\Delta t)^2\\
        0 & \Delta t\\
    \end{bmatrix}
    \begin{bmatrix}a_x^2 & 0\\ 0 & a_y^2\\ \end{bmatrix}
    \begin{bmatrix}
        {1\over2}(\Delta t)^2 & \Delta t & 0 & 0\\
        0 & 0 & {1\over2}(\Delta t)^2 & \Delta t\\
    \end{bmatrix}\\
&= \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}P_{n-1}\begin{bmatrix}
        1 & 0 & 0 & 0\\
        \Delta t & 1 & 0 & 0\\
        0 & 0 & 1 & 0\\
        0 & 0 & \Delta t & 1\\
    \end{bmatrix}
    + \begin{bmatrix}
        {1\over4}a_x^2(\Delta t)^4 & {1\over2}a_x^2(\Delta t)^3 0 & 0\\
        {1\over2}a_x^2(\Delta t)^3 & a_x^2(\Delta t)^2 & 0 & 0\\
        0 & 0 & {1\over4}a_y^2(\Delta t)^4 & {1\over2}a_y^2(\Delta t)^3\\
        0 & 0 & {1\over2}a_y^2(\Delta t)^3 & a_y^2(\Delta t)^2\\
    \end{bmatrix}\\
\end{aligned}
$$

Filtering step of observing direction $\varphi_n$ with measurement noise $
\sigma_\varphi^2$ is

$$
\begin{aligned}
\mu_n &\leftarrow \mu_n + K_n(\varphi_n - {\bm h}(\bm\mu_n))\\
&= \begin{bmatrix}
        x_n\\
        {\dot x}_n\\
        y_n\\
        {\dot y}_n\\
    \end{bmatrix}
    + \begin{bmatrix}
        -\sin\theta_nP_n[0,0] + \cos\theta_nP_n[0,2]\\
        -\sin\theta_nP_n[1,0] + \cos\theta_nP_n[1,2]\\
        -\sin\theta_nP_n[2,0] + \cos\theta_nP_n[2,2]\\
        -\sin\theta_nP_n[3,0] + \cos\theta_nP_n[3,2]\\
    \end{bmatrix}
    {\varphi_n - \theta_n \over H_nP_nH_n^\top+\sigma_\varphi^2}\\
P_n &\leftarrow P_n - K_nH_nP_n\\
&= P_n - {1 \over H_nP_nH_n^\top+\sigma_\varphi^2}
    P_n\begin{bmatrix}
        \sin^2\theta_n & 0 & -\cos\theta_n\sin\theta_n & 0\\
        0 & 0 & 0 & 0\\
        -\cos\theta_n\sin\theta_n & 0 & \cos^2\theta_n & 0\\
        0 & 0 & 0 & 0\\
    \end{bmatrix}P_n
\end{aligned}
$$

where

$$
\begin{aligned}
K_n &= P_nH_n^\top(H_nP_nH_n^\top + \sigma_\varphi^2)^{-1}\\
&= {1\over
    \sin^2\theta_nP_n[0,0]
    - \cos\theta_n\sin\theta_nP_n[0,2]
    - \cos\theta_n\sin\theta_nP_n[2,0]
    + \cos^2\theta_nP_n[2,2] + \sigma_\varphi^2}
    P_n H_n^\top,\\
{\bm h}(\bm\mu_n) &= [\begin{array}\theta_n\end{array}]\\
H_n &= [\begin{array}{cccc}
    -\sin\theta_n & 0 &
    \cos\theta_n & 0 \end{array}]\\
\cos\theta_n &= {x_n\over r_n}\\
\sin\theta_n &= {y_n\over r_n}\\
r_n &= \sqrt{x_n^2+y_n^2}\\
\theta_n &= \arctan{y_n \over x_n}.\\
\end{aligned}
$$

### Observing radius

Let the time update of position $(x, y)$ and velocity $({\dot x}, {\dot y})$ be

$$
\begin{cases}
x_n &\leftarrow& x_{n-1}&+&{\dot x}_{n-1}\Delta t&+&{1\over2}a_x(\Delta t)^2\\
{\dot x}_n &\leftarrow& && {\dot x}_{n-1} &+& a_x\Delta t\\
y_n &\leftarrow& y_{n-1}&+&{\dot y}_{n-1}\Delta t&+&{1\over2}a_y(\Delta t)^2\\
{\dot y}_{n} &\leftarrow& && {\dot y}_{n-1} &+& a_y\Delta t.
\end{cases}
$$

Let our internal state be

$$
\bm\mu_n = \begin{bmatrix}x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n \end{bmatrix},
$$

then the prediction step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow F\bm\mu_{n-1}\\
\Leftrightarrow&\begin{bmatrix}
        x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n
    \end{bmatrix}
    \leftarrow
    \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}
    \begin{bmatrix}
        x_{n-1}\\ {\dot x}_{n-1}\\ y_{n-1}\\ {\dot y}_{n-1}
    \end{bmatrix}
\\
P_n &\leftarrow FP_nF^\top
    + \begin{bmatrix}
        {1\over2}(\Delta t)^2 & 0\\
        \Delta t & 0\\
        0 & {1\over2}(\Delta t)^2\\
        0 & \Delta t\\
    \end{bmatrix}
    \begin{bmatrix}a_x^2 & 0\\ 0 & a_y^2\\ \end{bmatrix}
    \begin{bmatrix}
        {1\over2}(\Delta t)^2 & \Delta t & 0 & 0\\
        0 & 0 & {1\over2}(\Delta t)^2 & \Delta t\\
    \end{bmatrix}\\
&= \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}P_{n-1}\begin{bmatrix}
        1 & 0 & 0 & 0\\
        \Delta t & 1 & 0 & 0\\
        0 & 0 & 1 & 0\\
        0 & 0 & \Delta t & 1\\
    \end{bmatrix}
    + \begin{bmatrix}
        {1\over4}a_x^2(\Delta t)^4 & {1\over2}a_x^2(\Delta t)^3 0 & 0\\
        {1\over2}a_x^2(\Delta t)^3 & a_x^2(\Delta t)^2 & 0 & 0\\
        0 & 0 & {1\over4}a_y^2(\Delta t)^4 & {1\over2}a_y^2(\Delta t)^3\\
        0 & 0 & {1\over2}a_y^2(\Delta t)^3 & a_y^2(\Delta t)^2\\
    \end{bmatrix}\\
\end{aligned}
$$

Filtering step of observing radius $\ell_n$ with measurement noise
$\sigma_\ell^2$ is

$$
\begin{aligned}
\bm\mu_n &\leftarrow \bm\mu_n + K_n(\ell_n - \bm h(\bm\mu_n))\\
&= \begin{bmatrix} x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n\\ \end{bmatrix}
    + \begin{bmatrix}
        \cos\theta_nP_n[0,0] + \sin\theta_nP_n[0,2]\\
        \cos\theta_nP_n[1,0] + \sin\theta_nP_n[1,2]\\
        \cos\theta_nP_n[2,0] + \sin\theta_nP_n[2,2]\\
        \cos\theta_nP_n[3,0] + \sin\theta_nP_n[3,2]\\
    \end{bmatrix}
    {\ell_n - r_n \over H_nP_nH_n^\top+\sigma_\ell^2}\\
P_n &\leftarrow P_n - K_nH_nP_n\\
&= P_n - {1 \over H_nP_nH_n^\top+\sigma_\ell^2}
    P_n\begin{bmatrix}
        \cos^2\theta_n & 0 & \cos\theta_n\sin\theta_n & 0\\
        0 & 0 & 0 & 0\\
        \cos\theta_n\sin\theta_n & 0 & \sin^2\theta_n & 0\\
        0 & 0 & 0 & 0\\
    \end{bmatrix}P_n
\end{aligned}
$$

where

$$
\begin{aligned}
K_n &= P_nH_n^\top(H_nP_nH_n^\top + \sigma_\ell^2)^{-1}\\
&= {1\over
    \cos^2\theta_nP_n[0,0]
    + \cos\theta_n\sin\theta_nP_n[0,2]
    + \cos\theta_n\sin\theta_nP_n[2,0]
    + \sin^2\theta_nP_n[2,2] + \sigma_\ell^2}
    P_n H_n^\top,\\
{\bm h}(\bm\mu_n) &= \begin{bmatrix}r_n\end{bmatrix}\\
H_n &= [\begin{array}{cccc}
    \cos\theta_n & 0 &
    \sin\theta_n & 0 \end{array}]\\
\cos\theta_n &= {x_n\over r_n}\\
\sin\theta_n &= {y_n\over r_n}\\
r_n &= \sqrt{x_n^2+y_n^2}.\\
\end{aligned}
$$

### Observing direction and radius

Let the time update of position $(x, y)$ and velocity $({\dot x}, {\dot y})$ be

$$
\begin{cases}
x_n &\leftarrow& x_{n-1}&+&{\dot x}_{n-1}\Delta t&+&{1\over2}a_x(\Delta t)^2\\
{\dot x}_n &\leftarrow& && {\dot x}_{n-1} &+& a_x\Delta t\\
y_n &\leftarrow& y_{n-1}&+&{\dot y}_{n-1}\Delta t&+&{1\over2}a_y(\Delta t)^2\\
{\dot y}_{n} &\leftarrow& && {\dot y}_{n-1} &+& a_y\Delta t.
\end{cases}
$$

Let our internal state be

$$
\bm\mu_n = \begin{bmatrix}x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n \end{bmatrix},
$$

then the prediction step is

$$
\begin{aligned}
\bm\mu_n &\leftarrow F\bm\mu_{n-1}\\
\Leftrightarrow&\begin{bmatrix}
        x_n\\ {\dot x}_n\\ y_n\\ {\dot y}_n
    \end{bmatrix}
    \leftarrow
    \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}
    \begin{bmatrix}
        x_{n-1}\\ {\dot x}_{n-1}\\ y_{n-1}\\ {\dot y}_{n-1}
    \end{bmatrix}
\\
P_n &\leftarrow FP_nF^\top
    + \begin{bmatrix}
        {1\over2}(\Delta t)^2 & 0\\
        \Delta t & 0\\
        0 & {1\over2}(\Delta t)^2\\
        0 & \Delta t\\
    \end{bmatrix}
    \begin{bmatrix}a_x^2 & 0\\ 0 & a_y^2\\ \end{bmatrix}
    \begin{bmatrix}
        {1\over2}(\Delta t)^2 & \Delta t & 0 & 0\\
        0 & 0 & {1\over2}(\Delta t)^2 & \Delta t\\
    \end{bmatrix}\\
&= \begin{bmatrix}
        1 & \Delta t & 0 & 0\\
        0 & 1 & 0 & 0\\
        0 & 0 & 1 & \Delta t\\
        0 & 0 & 0 & 1\\
    \end{bmatrix}P_{n-1}\begin{bmatrix}
        1 & 0 & 0 & 0\\
        \Delta t & 1 & 0 & 0\\
        0 & 0 & 1 & 0\\
        0 & 0 & \Delta t & 1\\
    \end{bmatrix}
    + \begin{bmatrix}
        {1\over4}a_x^2(\Delta t)^4 & {1\over2}a_x^2(\Delta t)^3 0 & 0\\
        {1\over2}a_x^2(\Delta t)^3 & a_x^2(\Delta t)^2 & 0 & 0\\
        0 & 0 & {1\over4}a_y^2(\Delta t)^4 & {1\over2}a_y^2(\Delta t)^3\\
        0 & 0 & {1\over2}a_y^2(\Delta t)^3 & a_y^2(\Delta t)^2\\
    \end{bmatrix}\\
\end{aligned}
$$

Filtering step of observing direction $\varphi_n$ with measurement noise
$\sigma_\varphi^2$ and radius $\ell_n$ with measurement noise
$\sigma_\ell^2$ is

$$
\begin{aligned}
\bm\mu_n &\leftarrow \bm\mu_n + K_n\left(\begin{bmatrix}
        \ell_n\\
        \varphi_n\\
    \end{bmatrix} - {\bm h}(\bm\mu_n)\right)\\
P_n &\leftarrow P_n - K_nH_nP_n\\
\end{aligned}
$$

where

$$
\begin{aligned}
K_n &= P_nH_n^\top\left(H_nP_nH_n^\top + \begin{bmatrix}
        \sigma_\ell^2 & 0\\
        0 & \sigma_\varphi^2\\
    \end{bmatrix}\right)^{-1}\\
{\bm h}(\bm\mu_n) &= \begin{bmatrix}r_n\\ \theta_n\end{bmatrix}\\
H_n &= \begin{bmatrix}
        \cos\theta_n & 0 & \sin\theta_n & 0\\
        -\sin\theta_n & 0 & \cos\theta_n & 0
    \end{bmatrix}\\
\cos\theta_n &= {x_n\over r_n}\\
\sin\theta_n &= {y_n\over r_n}\\
r_n &= \sqrt{x_n^2+y_n^2}\\
\theta_n &= \arctan{y_n \over x_n}.\\
\end{aligned}
$$
