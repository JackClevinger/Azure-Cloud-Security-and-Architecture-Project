awk '/05:00:00 AM/ {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses
awk '/08:00:00 AM/ {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses
awk '/02:00:00 PM/ {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses
awk '/08:00:00 PM/ {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses
awk '/11:00:00 PM/ {print $1, $2, $5, $6}' 0310_Dealer_schedule >> Dealers_working_during_losses
awk '/05:00:00 AM/ {print $1, $2, $5, $6}' 0312_Dealer_schedule >> Dealers_working_during_losses
awk '/08:00:00 AM/ {print $1, $2, $5, $6}' 0312_Dealer_schedule >> Dealers_working_during_losses
awk '/02:00:00 PM/ {print $1, $2, $5, $6}' 0312_Dealer_schedule >> Dealers_working_during_losses
awk '/08:00:00 PM/ {print $1, $2, $5, $6}' 0312_Dealer_schedule >> Dealers_working_during_losses
awk '/11:00:00 PM/ {print $1, $2, $5, $6}' 0312_Dealer_schedule >> Dealers_working_during_losses
awk '/05:00:00 AM/ {print $1, $2, $5, $6}' 0315_Dealer_schedule >> Dealers_working_during_losses
awk '/08:00:00 AM/ {print $1, $2, $5, $6}' 0315_Dealer_schedule >> Dealers_working_during_losses
awk '/02:00:00 PM/ {print $1, $2, $5, $6}' 0315_Dealer_schedule >> Dealers_working_during_losses

