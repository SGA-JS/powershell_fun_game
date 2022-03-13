
clear-host

#---Funtction input display 
function show-input {
  write-host ">>> your input     = $player1" -ForegroundColor Cyan
  write-host ">>> opponent input = $comPlayer`n" -ForegroundColor Cyan

}


#----functnion show the score

function show-score {

write-host "`n==scoring board ===" -ForegroundColor Yellow
write-host "you      $player1_mark mark" -ForegroundColor Yellow
write-host "opponent $comPlayer_mark mark" -ForegroundColor Yellow
}


#----------Function Index menu-----------------
function Show-Menu {
    param (
        [string]$Title = 'SCISSOR PAPER ROCK ==> GAME' 
    )
    Clear-Host
    Write-Host "================ $Title ================"

    Write-Host "`nPress '1' Start the Game"
    Write-Host "`nPress 'Q' Cancel the Game`n"
}



do
{
    Show-Menu
    $selection = Read-Host "Please make a selection"




  switch ($selection)
  {
      '1' {      
        write-host  'You chose option #1 => start the Game' -ForegroundColor Yellow 
 
                    write-host "SCISSOR PAPER ROCK - GAME`n" -ForegroundColor Green

                    write-host "--------------------"
                    write-host "s for scissor`np for paper`nr for rock" -ForegroundColor Yellow
                    write-host "e for exit the game and diplay the score" -ForegroundColor Cyan
                    write-host "---------------------`n"


                        $playgame = 'True'
                        $randomList = 's','p', 'r';
                        $player1_mark = 0
                        $comPlayer_mark =0
                        $player1 = " "
    

                        while( $playgame -ne "False") {
                            
                             $player1 = read-Host -Prompt ("`nwhat is your move? ['e' to exit]")

                              if($player1 -eq 'e') 
                              {write-host "quick the game`n"
                              
                           show-score


                           $yn = Read-host -prompt "`n==>> are you quiting the Game <<=? [y/n]: "

                            if ($yn -eq 'y'){
                                  return 'False' #exit the from the while loop 
                                  }

                                                              
                                 }
 
                             if($player1 -ne 's' -and $player1 -ne 'r' -and $player1 -ne 'p'){
                                write-host "invalid input please try again"
                        
                                # continue> if the condition is true > start a new loop  #
                                continue
                                #break 
                                 }
                                

                           

                             $comPlayer = Get-Random -InputObject $randomList



                                if ($player1 -eq $comPlayer)
                                    {
                                    show-input
                                    write-host "`n=====> Tie <=====`n" -ForegroundColor Yellow


                                    }

                
                                    #Scissor>Paper | Paper>Rock | Rock>Scissor

                                elseif (($player1 -eq 's' -and $comPlayer -eq 'p') -or ($player1 -eq 'p' -and $comPlayer -eq 'r') -or ($player1 -eq 'r' -and $comPlayer -eq 's')) 
                                {
                                show-input
                                write-host "`n=====> you are the WINNER <=====`n" -ForegroundColor green

                                 $player1_mark +=1

                                 write-host "you score $player1_mark"
                                }



                                else {
                                show-input 
                                write-host "`n=====> you lost <=====`n" -ForegroundColor Red
                                                             
                                $comPlayer_mark +=1 # add the score to comPlayer
                                 
                                 }


                        

                    }  #while loop end

            } # selection 1 end    
                
        
               
    }# Switch-end             
   
} until($selection -eq 'q') #do loop





