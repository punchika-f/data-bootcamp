## Pao Ying Chub Game
pyc_game <- function() {
  print("Welcome to Pao Ying Chub Game !!")
  hands <- c("scissor", "hammer", "paper")
  
  count <- 0
  comp_wins <- 0
  user_wins <- 0
  draws <- 0
  
  while(count<=10) {
    comp_hand <- sample(hands, 1)
    user_hand <- readline("please choose one hand: scissor, hammer, paper or quit: ")
    cat("comp: ", comp_hand, "\n")
    cat("user: ", user_hand, "\n")
    
  ## Draw
  if ((comp_hand == hands[1] & user_hand == hands[1]) |
      (comp_hand == hands[2] & user_hand == hands[2]) |
      (comp_hand == hands[3] & user_hand == hands[3])) {
    message("DRAW :/")
    draws <- draws+1
    
  ## Win
  } else if (
      (comp_hand == hands[1] & user_hand == hands[2]) |
      (comp_hand == hands[2] & user_hand == hands[3]) |
      (comp_hand == hands[3] & user_hand == hands[1])) {
    message("Congratuation!! you are the WINNER")
    user_wins <- user_wins+1
  
  ## Lose
  } else if (
    (comp_hand == hands[1] & user_hand == hands[3]) |
    (comp_hand == hands[2] & user_hand == hands[1]) |
    (comp_hand == hands[3] & user_hand == hands[2])) {
    message("Oh no! you lose :(")
    comp_wins <- comp_wins+1
    
  ## Quit
  } else if(user_hand == "quit") {
    break
  }
  count <- count+1
  }
  message("Game over!")
  message("Computer win: ", comp_wins)
  message("You win: ", user_wins)
  message("Draws: ", draws)
}
