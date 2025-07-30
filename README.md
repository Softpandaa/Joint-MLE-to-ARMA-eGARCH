# Joint-MLE-of-ARIMA-GARCH
This repository contains a comprehensive R implementation for estimating ARMA(m,n)-EGARCH(1,1) models using different approaches. The project compares two-step estimation, joint MLE, and built-in methods for fitting ARMA(3,2)-EGARCH(1,1) models.

# Key Features
1. Data Analysis: Exploratory analysis and visualization
2. Stationary Testing: Augmented Dickey–Fuller test
3. Estimation Methods:
   - Two-step estimation (ARMA with EGARCH residuals)
   - Joint MLE
   - Built-in ``rugarch`` package
4. Residual Diagnostics
5. Performance Comparison: MSE and MAE metrics

# ``arma_egarch_loglik`` Function:
1. Initiate $\hat{\phi}_{1:m}$, $\hat{\theta}_{1:n}$ by ARMA(m,n) estimation
2. Initiate $(\omega, \alpha, \beta, \gamma)$ by EGARCH(1,1) estimation
3. Set $\hat{\sigma}^2_{\tau}
