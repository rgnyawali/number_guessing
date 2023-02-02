#!/bin/bash

# create PSQL variable
PSQL="psql -U freecodecamp number_guess -t --no-align -c"

<<comment
  Description of Database
  DB Name: number_guess
  Tables:
    1. users
      a. user_id: serial primary key
      b. name: varchar 22, not null, unique
    2. game
      a. game_id: serial primary key
      b. user_id: foreign key users(user_id)
      c. try: int, not null, default=0 [in how many try this game ended]
comment

# main function to check for integer input
MAIN() {
  echo $1
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    MAIN "That is not an integer, guess again:"
  fi
}

# Ask for username "Enter your username:" (22 char max)
echo -e "\nEnter your username:"
read USER

# check if username exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER'")

if [[ -z $USER_ID ]]
then 
  USER_ADD=$($PSQL "INSERT INTO users(name) VALUES ('$USER')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER'")
  echo -e "\nWelcome, $USER! It looks like this is your first time here."
else
  USER=$($PSQL "SELECT name FROM users WHERE name='$USER'")
  N_GAME=$($PSQL "SELECT COUNT(*) FROM game WHERE user_id='$USER_ID'")
  BEST_TRY=$($PSQL "SELECT MIN(try) FROM game WHERE user_id='$USER_ID'")
  echo -e "\nWelcome back, $USER! You have played $N_GAME games, and your best game took $BEST_TRY guesses."
fi

# generate a random number 1-1000
SECRET=$(( RANDOM % 1000 + 1 ))

# print Guess the secret number between 1 and 1000:
MAIN "Guess the secret number between 1 and 1000:"

N_TRY=1

while [[ $SECRET -ne $GUESS ]]
do
  if [[ $SECRET -lt $GUESS ]]
  then
    MAIN "It's lower than that, guess again:"
  else
    MAIN "It's higher than that, guess again:"
  fi
  (( N_TRY++ ))
done
ADD_GAME=$($PSQL "INSERT INTO game(user_id,try) VALUES($USER_ID, $N_TRY )")

# final message when the number is guessed
echo "You guessed it in $N_TRY tries. The secret number was $SECRET. Nice job!"


