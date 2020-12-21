# Pepper_send_email
Using google cloud STT interpret user speech into text 

## This program is used to send a new email or reply to an emails:
* Check if there is already a receiver address (in case of Reply). If not ask for reciever name and look up the corresponding email address from contact database.
* Ask for subject and message of the email.
* Send it.
	
### NOTE: Please dont upload this program to the robot. To modify this application, copy the content of file behaviors.xar to the behaviors.xar in application "test-" inside the robot through SSH.

## Program's flow:
### 1. "Wait" box: 

wait 1 sec to make sure the application finish loading after switching from another application.

### 2. "Insert email/record" box: 

Insert "email/record" variable to the memory. "email/record" variable is used to mark the point in the process where it should listen to external button interrupt. The default value is  0 which means not activate and 1 is activate.

### 3. "Set language" sets the robot language to Finnish

### 4. "isReceiver" box: check if there is a receiver's name and adress (in case of Reply)

	#### 4.1 If there is a receiver's name and address: 
	
		-> output "onStopped" is activated -> 
		#### 4.1.1 Gets the subject of the email
		
			A. "Say" box asks the user to say the subject of the message.
			
			-> "Record Sound" timeline box records the user speech
					- "Get File Name" get the name of the file which the record will be stored. ->
						+ "Rec Sound" records the speech.
						+ "Insert email/record" (See 2.) now set the value to 1 to activate getting the external button input.
							-> "Subcribe to stopRecord" box gets the signal when the external button is pressed.
							-> output "onEvent" 	
							-> input "onStop" of "Rec Sound" box -> "Say" box informs user that it might takes some time to process
							-> output "onStopped" of the "Record Sound" timeline box
						+ Tactile head: gets the signal when the middle head of the robot is touched.
							-> input "onStop" of "Rec Sound" box -> "Say" box informs user that it might takes some time to process
							-> output "onStopped" of the "Record Sound" timeline box
			B. "SpeechToText" box receive the record file name from "Record Sound" box and uses Google Speech-to-Text to output the string of the speech.
			-> - "Show" box shows the subject that the user said on the tablet so the user can see what speech did the robot get.
			   - "Say Text" say the subject that Robot got. 
					-> "Confirm" box confirms with user if it is correct what the user said.
						+ If the user agrees -> output "output_1" -> SECTION 4.1.3
						+ If the user said it was not right -> output "output_2" -> loopback to part A
						
		#### 4.1.2 Gets the message of the email
			Same with 4.1.1
			
		#### 4.1.3 Send the email
		
			After user confirms that the message is right 
			-> "Send email" box gets user's emailID, password, receiver'ss address, subject and message from the memory and send it.
				+ If the email is successfully sent -> output "onSent" informs user that the email has been sent
					-> "Wait" box wait for 1 sec and hide the tablet view
				+ If there is error in sending the email -> output "Say Text" to say the error
		
	### 4.2 If there is no receiver yet (in case of sending new mail)
		-> output "onGetReceiver" is activated
		
		#### 4.2.1 Get receiver name	
			-> "Say" box tells user to give the name of the receiver
			-> "Record" box ( See 4.1.1)
			-> "SpeechToText" box (See 4.1.1)
			-> "Show" box show the name that user said on tablet
			-> "Say" box asks user to confirm if the name is correct
			-> "confirm" box	
				+ If user agrees -> output "output_1" 
					-> "Get Receiver" box search for receiver email address in the contact database based on the given name and stores it in the memory.
				+ If user says that the name is wrong -> Loop back to the beginning of 4.2.1
			-> After successfully get the receiver address, the program will ask for subject and message.
			
		#### 4.2.2 Get subject of the email 
		
			See 4.1.1
		#### 4.2.3 Get the message
		
			See 4.1.1
			
		#### 4.2.4 Send email	
			See 4.1.3
				
