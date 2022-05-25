# Project-Tic-Tac-Toe

This is one of the projects in the Ruby course of The Odin Project. 
It is a terminal game of Tic Tac Toe. Two players are required in this game since there's no computer enemy for the game. 

This project made used of the Object-Oriented Programming paradigm. As a beginner, I am not sure if I have properly used the concept. 

Looking deeper at the code, all methods does not make use of private access since the default accessibility is public. Although I made sure that each class is independent from each other aside from the TicTacToe class which initialize the game, I am not sure if it really follows Object-Oriented programming. 

Methods used for rendering the board:
terminal clearing:
  puts "\e[H\e[2J"
String formatting:
  %d and the use of %
Array methods:
  array.each_slice(board_size).to_a