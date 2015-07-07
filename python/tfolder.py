# ==============================================================================
def tfold_scalar(t,P,tau):
  # Folds a scalar, t, using with a reference time (tau) and period (P), to give
  # tfold
  y = t - P*round( (t-tau)/P ) - tau
  return y
# ==============================================================================

# ==============================================================================
def tfold_vector(t,P,tau):
  # Folds a vector, t(n), using with a reference time (tau) and period (P), to 
  # give tfold
  y=[]
  for i in range(len(t)):
    y.append(t[i] - P*round( (t[i]-tau)/P ) - tau)
  return y
# ==============================================================================

# ==============================================================================
def intransit_scalar(t,P,tau,dur):
  # Checks if a point occurs inside transit or not, based on inputted period 
  # (P), epoch (tau) and duration (dur)
  if abs(tfold_scalar(t,P,tau)) <= 0.5*dur:
    y = 1
  else:
    y = 0
  return y
# ==============================================================================

# ==============================================================================
def intransit_vector(t,P,tau,dur):
  # Checks if a point occurs inside transit or not, based on inputted period 
  # (P), epoch (tau) and duration (dur)
  y=[]
  for i in range(len(t)):
    if abs(tfold_scalar(t[i],P,tau)) <= 0.5*dur:
      y.append(1)
    else:
      y.append(0)
  return y
# ==============================================================================
