# vim: ft=gnuplot foldmethod=marker:
#{{{1 Options
reset
#set grid 

set loadpath '~/plots'

# produce variables for errors
set fit errorvariables

# stricter fit limit
FIT_LIMIT=1.e-14

set border linewidth 1.5
set key nobox noopaque samplen .7
set key top left
#noopaque samplen .5

set tics front

# increase resolution
set samples 10000

set macros


#{{{1 Terminals
# add macros to select a desired terminal 
#SIZE = "3500,262"
QT = "set term qt size 1024,768 font 'Frontpage Regular,10' dashed \
    ctrl persist"

WXT = "set terminal wxt size 1024,768 'Frontpage Regular,10' dashed persist"
# enhanced font

#PNG = "set terminal pngcairo size 350,262 font 'Frontpage Regular,14' \
    #dashed"
PNG = "set terminal pngcairo size 1024,786 enhanced font 'Frontpage Regular,24' dashed"

SVG = "set terminal svg size 350,262 fname \
    'Frontpage Regular, Helvetica, Arial, sans-serif' fsize = 10"

EPS = 'set terminal postscript eps size 5,3.4 enhanced color \
     linewidth 2'
     #font "Frontpage Regular,20"'

DUMB = 'set term dumb'

#EPSLATEX="set terminal epslatex size 3.5,2.62 color colortext dashed"
EPSLATEX="set terminal epslatex size 4,3 color colortext dashed"
EPSLATEXSML="set terminal epslatex size 3.2,2.4 color colortext dashed"
EPSLATEXBIG="set terminal epslatex size 6.5,4.88 color colortext dashed"
#alternatively specify size in cm:8.89cm,6.65cm
#important: put LaTeX code in '...', ie set xlabel '$x$'
#more at: http://www.gnuplotting.org/output-terminals/

# Beamer settings
EPSLATEX='set terminal epslatex size 2.5,2.0 color colortext dashed clip\
  fontscale .6'
EPSLATEXSML='set terminal epslatex size 2.5,2.0 color colortext dashed clip\
  fontscale .6'
EPSLATEXBIG='set terminal epslatex size 2.5,2.4 color colortext dashed clip\
  fontscale .6'


#set term wxt persist
#set term wxt persist
@WXT
#@QT

#{{{1 Paths
# set paths
HOME = "/home/spiller"
#EVAL = "/home/spiller/eval"
EVAL = "~/remote/eval/"
#RESULTS = "/home/spiller/results"
RESULTS = "~/remote/results/"
WORK="~/remote/"

#{{{1 Style
# set standard linewidth and pointsize
LW=1.0
PS=0.5

SOLID=1
DASHED=3

# set TUD colors
set style line 1  lc rgb '#B90F22' lt SOLID lw LW pt 5  ps PS # red 9c
set style line 2  lc rgb '#004E8A' lt SOLID lw LW pt 7  ps PS # blue 1c
set style line 3  lc rgb '#7FAB16' lt SOLID lw LW pt 9  ps PS # green 4c
set style line 4  lc rgb '#D7AC00' lt SOLID lw LW pt 11 ps PS # yellow 6c
set style line 5  lc rgb '#611C73' lt SOLID lw LW pt 13 ps PS # violet 11c
set style line 6  lc rgb '#008877' lt SOLID lw LW pt 4  ps PS # turcoise 3c
set style line 7  lc rgb '#B1BD00' lt SOLID lw LW pt 6  ps PS # green 5c
set style line 8  lc rgb '#CC4C03' lt SOLID lw LW pt 8  ps PS # orange 8c
set style line 9  lc rgb '#951169' lt SOLID lw LW pt 10 ps PS # violet 10c
set style line 10 lc rgb '#00689D' lt SOLID lw LW pt 12 ps PS # blue 2c
#set style line 11 lc rgb '#D28700' lt SOLID lw LW pt 2  ps PS # yellow 7c

set style line 11 lc rgb '#B90F22' lt DASHED lw LW pt 5  ps PS # red 9c
set style line 12 lc rgb '#004E8A' lt DASHED lw LW pt 7  ps PS # blue 1c
set style line 13 lc rgb '#7FAB16' lt DASHED lw LW pt 9  ps PS # green 4c
set style line 14 lc rgb '#D7AC00' lt DASHED lw LW pt 11 ps PS # yellow 6c
set style line 15 lc rgb '#611C73' lt DASHED lw LW pt 13 ps PS # violet 11c
set style line 16 lc rgb '#008877' lt DASHED lw LW pt 4  ps PS # turcoise 3c
set style line 17 lc rgb '#B1BD00' lt DASHED lw LW pt 6  ps PS # green 5c
set style line 18 lc rgb '#CC4C03' lt DASHED lw LW pt 8  ps PS # orange 8c
set style line 19 lc rgb '#951169' lt DASHED lw LW pt 10 ps PS # violet 10c
set style line 20 lc rgb '#00689D' lt DASHED lw LW pt 12 ps PS # blue 2c
#set style line 22 lc rgb '#D28700' lt DASHED lw LW pt 2  ps PS # yellow 7c

#{{{1 Test
# test style
#set offsets 0.5, 0.5, 0, 0
#set style function linespoints
#set xr [-3:3]
#plot for [i=1 : 11] i*x**2 ls i title sprintf("curve %d\n", i) 
