#! /bin/bash
# Salon Appointment Scheduler

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"
echo -e "\nWelcome to My Salon"
echo -e "\nSelect the service you want to book"

function MAIN_MENU() {
  IDS=$($PSQL "select service_id from services order by service_id")
  MAX_ID=$($PSQL "select max(service_id) from services")
  # echo "0) exit"
  echo "$IDS" | while read ID
  do
    NAME=$($PSQL "select name from services where service_id = $ID")
    echo "$ID) $NAME"
  done
  echo " "
  read SERVICE_ID_SELECTED
  if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] 
  then
    NOT_A_NUMBER
  elif (($SERVICE_ID_SELECTED < $MAX_ID + 1))
  then
    CHOICE 
  else
    INVALID
  fi
}

function CHOICE(){
  SERVICE_SELECTED=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTED ]]
  then
    INVALID
  fi
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'") 

  echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)") 
  #NAME_FORMATTED="$(echo $CUSTOMER_NAME |  sed -r 's/^ *| *$//g')"
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

function NOT_A_NUMBER(){
  echo -e "\nPlease, enter a number"
  MAIN_MENU
}

function INVALID(){
  echo -e "\nThere is no service with that number, please try again"
  MAIN_MENU
}

MAIN_MENU

