#! /bin/bash

INPUT=$1
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

function MAIN(){
    if [[ -z $INPUT ]]; then
        echo "Please provide an element as an argument."
    else
        FIND_IF_EXISTS
        if [[ $EXISTS != true ]] ; then  
            NOT_FOUND
        else  
            FIND_DATA
            SHOW_RESULT $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $MASS $MELTING $BOILING
        fi
    fi
}

function NOT_FOUND() {
    echo "I could not find that element in the database."
}

function FIND_IF_EXISTS() {
    if [[ $INPUT =~ ^[0-9]+$ ]]; then
        NAME=$($PSQL "select name from elements where atomic_number = $INPUT")
        if [[ -z $NAME ]] ; then
            EXISTS=false
        else
            ATOMIC_NUMBER=$INPUT
            EXISTS=true
        fi 
    else
        ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$INPUT' or symbol = '$INPUT'")
        if [[ -z $ATOMIC_NUMBER ]] ; then
            EXISTS=false
        else
            EXISTS=true
        fi
    fi        
}

function FIND_DATA() {
    NAME=$($PSQL "select name from elements where atomic_number = $ATOMIC_NUMBER")
    SYMBOL=$($PSQL "select symbol from elements where atomic_number = $ATOMIC_NUMBER")
    TYPE=$($PSQL "select type from properties inner join types using(type_id) where atomic_number = $ATOMIC_NUMBER;")
    MASS=$($PSQL "select atomic_mass from properties inner join types using(type_id) where atomic_number = $ATOMIC_NUMBER;")
    MELTING=$($PSQL "select melting_point_celsius from properties inner join types using(type_id) where atomic_number = $ATOMIC_NUMBER;")
    BOILING=$($PSQL "select boiling_point_celsius from properties inner join types using(type_id) where atomic_number = $ATOMIC_NUMBER;")
}

function SHOW_RESULT(){
    A=$1 ; N=$2 ; S=$3 ; T=$4 ; M=$5 ; MP=$6 ; BP=$7
    echo "The element with atomic number $A is $N ($S). It's a $T, with a mass of $M amu. $N has a melting point of $MP celsius and a boiling point of $BP celsius."
}

MAIN
