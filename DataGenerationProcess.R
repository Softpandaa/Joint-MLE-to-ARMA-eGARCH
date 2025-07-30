dgp_process <- function(n, p, q, phi, theta, garch){
  #n: Length of data set
  #p,q: ARMA(p,q)
  #phi: c(Φ1, Φ2, Φ3)
  #theta: c(θ1, θ2)
  #egarch: (ω, α, γ, β)
  
  if ((p != length(phi)) || (q != length(theta))) return("Model order does NOT match input length")
  # Setting up arrays
  data <- numeric(n)
  eps <- numeric(n)
  sig2 <- numeric(n)
  z <- rnorm(n, mean=0, sd=1)
  
  # Initiation
  E_z = sqrt(2/pi) # Assuming z ~ N(0,1)
  sig2[1] <- exp(garch[1] / (1-garch[3]))
  eps[1] <- sqrt(sig2[1]) * z[1]
  data[1] <- eps[1]
  
  for (t in 2:n){
    z_lag <- eps[t-1] / sqrt(sig2[t-1])
    log_sig2_t <- garch[1] + garch[2]*(abs(z_lag)-E_z) + garch[3]*z_lag + garch[4]*log(sig2[t-1])
    sig2[t] <- exp(log_sig2_t)
    
    eps[t] <- sqrt(sig2[t]) * z[t]
    
    ar_value <- 0
    ma_value <- 0
    
    for (j in 1:p){
      if (t-j>=1) ar_value <- ar_value + phi[j]*data[t-j]
    }
    for (k in 1:q){
      if (t-k>=1) ma_value <- ma_value + theta[k]*eps[t-k]
    }
    data[t] <- ar_value + ma_value + eps[t]
  }
  data = na.omit(data)
  return(tail(data, n))
}

# ARIMA(3,0,2)-EGARCH(1,1) Model Specification
p=3; q=2
phi = c(0.6, -0.5, 0.25); theta = c(-0.4, 0.65)
garch = c(-0.8, 0.1, -0.2, 0.9)

set.seed(0729)
n = 1500
data = dgp_process(n=n+200, p, q, phi, theta, garch)
data = tail(data, n)
par(mfcol=c(1,1))
ts.plot(data, main="Simulated ARMA(3,2)–EGARCH(1,1) Series")
write.csv(data, file="C:/Users/user/Desktop/Research Papers/ARIMA GARCH/data.csv", row.names = FALSE)
