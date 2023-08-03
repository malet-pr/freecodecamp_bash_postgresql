#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(( RANDOM % 1000 + 1 ))

echo -e "\nEnter your username:"
read USER_NAME
USER_ID=$($PSQL "select user_id from users where user_name  = '$USER_NAME'";)
if [[ -z $USER_ID ]] 
then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    USER_INSERT_RESULT=$($PSQL "insert into users (user_name) values ('$USER_NAME')";)
    USER_ID=$($PSQL "select user_id from users where user_name  = '$USER_NAME'";)
else
    GAMES_PLAYED=$($PSQL "select count(1) from games where user_id  = $USER_ID";)
    BEST_GAME=$($PSQL "select min(number_of_guesses) from games where user_id  = $USER_ID";)
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
if ! [[ $GUESS =~ ^[0-9]+$ ]]
then
    echo "That is not an integer, guess again:"
    read GUESS
fi
N=1
while ! [[ -z $GUESS ]]
do
    if [[ $GUESS == $NUMBER ]]
    then
        echo "You guessed it in $N tries. The secret number was $NUMBER. Nice job!"
        INSERT_GAME=$($PSQL "insert into games(user_id,number_of_guesses) values ($USER_ID,$N);")
        break
    fi
    if [[ $GUESS -gt $NUMBER ]]
    then
        echo "It's lower than that, guess again:"
        read GUESS
        N=$((N+1))
        continue
    fi
    if [[ $GUESS -lt $NUMBER ]]
    then
        echo "It's higher than that, guess again:"
        read GUESS
        N=$((N+1))
        continue
    fi
done
