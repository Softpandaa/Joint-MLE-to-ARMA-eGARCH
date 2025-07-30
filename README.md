# Joint-MLE-Approach-to-ARMA-GARCH
This repository contains a comprehensive R implementation for estimating ARMA(m,n)-EGARCH(1,1) models using different approaches. The project compares two-step estimation, joint MLE, and built-in methods for fitting ARMA(3,2)-EGARCH(1,1) models.

# Motivation
Financial time series exhibit complex dynamics, where returns often display an autoregressive nature and are well-documented with asymmetric shocks in conditional variance. The ARMA-EGARCH model is very appealing in capturing both the mean and variance dynamics. While existing research predominantly employs a two-step approach: fitting ARMA and then applying EGARCH to the residuals, this method inherits bias from the initial ARMA specification, which assumes homoskedastic residuals. Motivated by this, this project develops a joint maximum-likelihood estimator that is asymptotically efficient and aligns with the true data-generating process.


# Key Features
1. Data Analysis: Exploratory analysis and visualization
2. Stationary Testing: Augmented Dickey–Fuller test
3. Heteroskedasticity Testing: Ljung-Box test
4. Estimation Methods:
   - Two-step estimation (ARMA with EGARCH residuals)
   - Joint MLE
   - Built-in ``rugarch`` package
5. Residual Diagnostics
6. Performance Comparison: MSE and MAE metrics

# ``arma_egarch_loglik`` Function:
1. Initiate `phi_hat[1:m]`, `theta_hat[1:n]` by ARMA(m,n) estimation  
2. Initiate `(omega, alpha, beta, gamma)` by EGARCH(1,1) estimation  
3. Set `sigma2_hat[tau]   = (1/T) * sum_{t=1}^T (r_t – r_bar)^2` and `epsilon_hat[tau]  = 0` for `tau = 0, 1, 2, …, max(m, n, 1)`

# Reference:
1. Francq, C., & Zakoïan, J. M. (2004). Maximum likelihood estimation of pure GARCH and ARMA-GARCH processes. Bernoulli, 10(4), 605-637.
2. Chen, Y., Cheung, K. C., & Yam, S. C. P. (2024). Financial Data Analytics: with Machine Learning, Optimization and Statistics. Wiley Finance Series. John Wiley & Sons.
3. Fiszeder, P. (2009). Parameter Estimation of ARMA Models with GARCH/APARCH Errors: An R and SPlus Software Implementation. Journal of Statistical Software, 55(3), 1-26.
4. Nelson, D. B. (1991). Conditional Heteroskedasticity in Asset Returns: A New Approach. Econometrica, 59(2), 347-370.
