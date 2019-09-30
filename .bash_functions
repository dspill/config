# vim: ft=sh foldmethod=indent:
function gplot() { 
    #gnuplot -p -e "plot '$1' $2 $3 $4 $5" 2> /dev/null; 
    gnuplot -p -e "plot '$1' $2 $3 $4 $5"; 
}

function lplot() { 
    #gnuplot -p -e "plot '$1' $2 $3 $4 $5 w linespoints" 2> /dev/null; 
    gnuplot -p -e "plot '$1' $2 $3 $4 $5 w linespoints" 
}

function xlogplot() {
    gnuplot -p -e "set logsc x; plot '$1' $2 $3 $4 $5 w linespoints" 2> /dev/null; 
}

function ylogplot() {
    gnuplot -p -e "set logsc y; plot '$1' $2 $3 $4 $5 w linespoints" 2> /dev/null; 
}

function loglogplot() {
    gnuplot -p -e "set logsc xy; plot '$1' $2 $3 $4 $5 w linespoints" 2> /dev/null; 
}

function pipe_plot() {
    gnuplot -p -e "plot '<cat' $1 $2 $3 $4" 2> /dev/null;
}

function eplot(){ 
    gnuplot -p -e "plot '$1' u 1:2:3 w yerrorbars" 2> /dev/null
}

function xyzvmd() {
    conf=/tmp/vmd_temp_conf.xyz
    sed 's:^[[:digit:]]\+\([[:blank:]]\)\+:0\1:g' $1 > $conf
    vmd $conf &
    sleep 5
    rm $conf
}

find_within_files() { 
    grep -rnw "$1" -e "$2"
}

function aur_install() {
    ADR=$1
    DIR=${ADR##*/}
    DIR=${DIR%.*}

    git clone $ADR
    cd $DIR

    less PKGBUILD
    less *.install
}

function make_vmdable() {
    sed 's:^[[:digit:]]\+\([[:blank:]]\)\+:0\1:g' $1 > vmd-$1
}

function xyzvmd() {
    conf=/tmp/vmd_temp_conf.xyz
    sed 's:^[[:digit:]]\+\([[:blank:]]\)\+:0\1:g' $1 > $conf
    vmd $conf &
    sleep 5
    rm $conf
}
