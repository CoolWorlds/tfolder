import math
import tfolder

n=20
t=[]
for i in range(n):
  t.append(i/10.0)

P=10.0
tau=1.0
dur=0.2

tfold = tfolder.tfold_vector(t,P,tau)
print 't[] = ',t
print 'tfold[] = ',tfold

print 't[1] = ',t[1]
print 'tfold[1] = ',tfolder.tfold_scalar(t[1],P,tau)

intransit = tfolder.intransit_vector(t,P,tau,dur)
print 'intransit[] = ',intransit
