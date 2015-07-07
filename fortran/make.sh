#!/bin/bash
#

compiler='g95'
rm -f *.o *.mod example *~
$compiler -O3 -c tfolder.f90
$compiler -O3 -o example example.f90 tfolder.o

