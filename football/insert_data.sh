#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_GOALS OPP_GOALS
do
  if [[ $YEAR != "year" ]]
  then
  # get team_id for winner and opponent
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    # if win not found
    if [[ -z $WIN_ID ]]
    then
      # insert team
      INSERT_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
      if [[ $INSERT_WIN_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $WIN
      fi
      # get new win_id
      WIN_ID=$($PSQL "SELECT team_id  FROM teams WHERE name='$WIN'")
    fi
    # if opp not found
    if [[ -z $OPP_ID ]]
    then
      # insert team
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      if [[ $INSERT_OPP_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $OPP
      fi
      # get new opp_id
      OPP_ID=$($PSQL "SELECT team_id  FROM teams WHERE name='$OPP'")
    fi
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round, winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WIN_ID,$OPP_ID,$WIN_GOALS,$OPP_GOALS)")
  fi
done
