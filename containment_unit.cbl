       *> setup the identification division
       IDENTIFICATION DIVISION.
         *> setup the program id
         PROGRAM-ID. CONTAINMENTUNIT.
         *> setup the procedure division (equiv. main() function)

       ENVIRONMENT DIVISION.
         INPUT-OUTPUT SECTION.  
            FILE-CONTROL.
            SELECT USERS ASSIGN TO 'users.txt'
            ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
         
         *> Used for handling the file that stores the
         *> CTF settings
         FILE SECTION.
         FD USERS.
         01 USERS-FILE.
            05 USER-ID         PIC XXXX.
            05 USER-PWD        PIC X(20).
            05 USER-EXP        PIC X(6).

         WORKING-STORAGE SECTION.
        
         *> Used for defining Menu item selection
         01 WS-MENU               PIC X     VALUE "M".

         *> CTF introduction screen
         01 RESPONSE-INTRO.
            05 RESPONSE-IN-LOGIN  PIC X     VALUE "X".  

         *> Login credentials when C pressed on Login page
         01 LOGIN-MSG          PIC X(15)    VALUE "Please login".
         01 RESPONSEC.
            05 RESPONSE-IN-WS  PIC X        VALUE "C".
            05 LOGGED-IN       PIC X        VALUE "F".
         01 DATA-FROM-SCREEN.
            05 ID-IN-WS        PIC XXXX     VALUE SPACES.  
            05 PWD-IN-WS       PIC X(20)    VALUE SPACES.  

         *> User data read in from file
         01 WS-USER.
            05 WS-USER-ID         PIC XXXX.
            05 WS-USER-PWD        PIC X(20).
            05 WS-USER-EXP        PIC X(6).
         01 WS-EOF                PIC A(1).

         *> Menu item selection
         01 MENURESPONSE.
            05 RESPONSE-IN-MENU PIC X    VALUE "X".

         *> Settings screen
         01 SETTINGSVALUES.
            05 ACCOUNT-EXPIRATION PIC X(6) VALUE "123120".
         01 SETTINGSRESPONSE.
            05 RESPONSE-IN-SETTINGS PIC X VALUE "X".

         *> Status Screen
         01 STAUSVALUES.
            05 CONTAINMENT-STATUS PIC X(6) VALUE "CLOSED".
            05 TCID50RELPFU PIC S9(1)V9(2) VALUE 0.69.
            05 PSI PIC XXX VALUE "100".
         01 STATUSRESPONSE.
            05 RESPONSE-IN-STATUS PIC X VALUE "X". 

         *> Containment Unit Screen
         01 CONTAINMENTVALUES.
            05 CONTAINMENT-UNIT PIC X VALUE "C".
            05 CONTAINMENT-FLAG PIC X(16)
                      VALUE "COVID2020ESCAPED".   
         01 CONTAINMENTRESPONSE.
            05 RESPONSE-IN-CONTAINMENT PIC X VALUE "X".

         *> Date and Time handling for challenege
         01 Y2KTIME.
            05 TIME-LOCK    PIC X(6) VALUE "111420". 
         01 WS-CURRENT-DATE-DATA.
            05 WS-CURRENT-DATE.              
               10 WS-CURRENT-YEAR  PIC  9(4).
               10 WS-CURRENT-MONTH PIC  9(2).
               10 WS-CURRENT-DAY   PIC  9(2).
            05 WS-CURRENT-TIME.              
               10 WS-CURRENT-HOUR  PIC  9(2).
               10 WS-CURRENT-MIN   PIC  9(2).
               10 WS-CURRENT-SEC   PIC  9(2).
               10 WS-CURRENT-MS    PIC  9(2).
            05 WS-DIFF-FROM-GMT    PIC  S9(04).

         SCREEN SECTION.

         *> Introduction screen
         01 INTRO-SCREEN.
         05 VALUE "*********************************" 
                         BLANK SCREEN LINE 1 COL 1. 
         05 VALUE "* COVID-2020 Containment Unit   *"
                         LINE 2 COL 1.
         05 VALUE "* Developed in 1986             *"
                         LINE 3 COL 1.
         05 VALUE "* By the retro*causal engineers *"
                         LINE 4 COL 1.
         05 VALUE "*********************************"
                         LINE 5 COL 1.
         05 VALUE "                                 "
                         LINE 6 COL 1.
         05 VALUE "        .*_; ;_*.                "
                         FOREGROUND-COLOR 2 LINE 7 COL 1.
         05 VALUE "       / /     \ \               "
                         FOREGROUND-COLOR 2 LINE 8 COL 1.
         05 VALUE "      | |       | |              " 
                         FOREGROUND-COLOR 2 LINE 9 COL 1.
         05 VALUE "       \ \.***./ /               "
                         FOREGROUND-COLOR 2 LINE 10 COL 1.
         05 VALUE "   .*'z   .***.   z'*.           "
                         FOREGROUND-COLOR 2 LINE 11 COL 1.
         05 VALUE " ,`.*z/ .'`***`'. \z*.`,         "
                         FOREGROUND-COLOR 2 LINE 12 COL 1.
         05 VALUE " '`   | | \(_)/ | |   `'         "
                         FOREGROUND-COLOR 2 LINE 13 COL 1.
         05 VALUE " ,    \  \ | | /  /    ,         "
                         FOREGROUND-COLOR 2 LINE 14 COL 1.
         05 VALUE " ;`'.,_\  `*'*'  /_,.'`;         "
                         FOREGROUND-COLOR 2 LINE 15 COL 1.
         05 VALUE "  '*._  _.*'^'*._  _.*'          "
                         FOREGROUND-COLOR 2 LINE 16 COL 1.
         05 VALUE "      ``         ``              "
                         FOREGROUND-COLOR 2 LINE 17 COL 1.
         05 VALUE "     Danger Biohazard            "
                         FOREGROUND-COLOR 4 LINE 18 COL 1.
         05 VALUE "     PRESS L TO LOGIN:           "
                         LINE 19 COL 1.
         05  RESPONSE-INPUT                             LINE 19 COL 23
                         PIC X         TO RESPONSE-IN-LOGIN.       

         *> Login Screen
         01  LOGIN-SCREEN.
         05  VALUE "LOGIN SCREEN"      BLANK SCREEN     LINE 1 COL 10.
         05  VALUE "------------"                       LINE 2 COL 10.
         05  LOGIN-MESSAGE PIC X(15) 
                         FROM LOGIN-MSG                 LINE 4 COL 10. 
         05  VALUE "User ID:"                           
                         FOREGROUND-COLOR 6             LINE 5 COL 10.
         05  ID-INPUT                                   LINE 5 COL 25
                         PIC  X(4)     TO ID-IN-WS.
         05  VALUE "Password:"                          
                       FOREGROUND-COLOR 6               LINE 7 COL 10.
         05  PWD-INPUT                                  LINE 7 COL 25
                         PIC X(20)     TO PWD-IN-WS.
         05  VALUE "C - TO CONTINUE"   
                         FOREGROUND-COLOR 2             LINE 12 COL 10.
         05  VALUE "Q - TO QUIT"                        
                         FOREGROUND-COLOR 4             LINE 13 COL 10. 
         05  VALUE "ENTER RESPONSE:"                    LINE 15 COL 10.
         05  RESPONSE-INPUT                             LINE 15 COL 26
                         PIC X         TO RESPONSE-IN-WS.       

         *> Main Menu Screen
         01  MAIN-MENU-SCREEN.
         05  VALUE "MAIN MENU SCREEN" 
                         BLANK SCREEN           LINE 1 COL 10.
         05  VALUE "----------------"           LINE 2 COL 10.
         05  VALUE "(S)ETTINGS - Software settings"          
                       FOREGROUND-COLOR 6       LINE 3 COL 10.
         05  VALUE "S(T)ATUS - Software/containment status" 
                       FOREGROUND-COLOR 6       LINE 5 COL 10.
         05  VALUE "CONTAINMENT (U)NIT - access the unit"   
                       FOREGROUND-COLOR 6       LINE 7 COL 10.
         05  VALUE "(Q)UIT - exit the program"   
                       FOREGROUND-COLOR 6       LINE 9 COL 10.
         05  VALUE "PLEASE SELECT AN OPTION:"                
                                                LINE 11 COL 10.
         05  RESPONSE-INPUT                     LINE 11 COL 34
                         PIC X         TO RESPONSE-IN-MENU.  
         
         *>  Settings screen for the application 
         *>  Use this screen to view password
         *>  and other values.
         01 SETTINGS-SCREEN.
         05 VALUE "SETTINGS SCREEN"
                        BLANK SCREEN            LINE 1 COL 10.
         05 VALUE "----------------"            LINE 2 COL 10.
         05 VALUE "Use this screen to view settings"
                       FOREGROUND-COLOR 6       LINE 3 COL 10.           
         05 VALUE "Use the admin tool to update settings"
                       FOREGROUND-COLOR 6       LINE 4 COL 10.           
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 6 COL 10.
         05 VALUE "User Settings"             
                       FOREGROUND-COLOR 6       LINE 7 COL 10.
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 8 COL 10.
         05 VALUE "User ID:"                    LINE 10 COL 10.
         05 ID-OUTPUT PIC XXXX FROM ID-IN-WS    LINE 10 COL 25. 
         05 VALUE "Password:"                   LINE 11 COL 10.
         05 PWD-OUT                             
            PIC X(20) FROM PWD-IN-WS            LINE 11 COL 27.       
         05 VALUE "Account expiration:"         LINE 12 COL 10. 
         05 ACC-EXPIRE-OUTPUT 
            PIC X(6)  FROM ACCOUNT-EXPIRATION   LINE 12 COL 30.
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 16 COL 10.
         05 VALUE "System Settings"             
                       FOREGROUND-COLOR 6       LINE 17 COL 10.
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 18 COL 10.
         05 VALUE "PSI: "                   
                       FOREGROUND-COLOR 6       LINE 19 COL 10.
         05 PSI-OUT                          
            PIC XXX    FROM PSI                 LINE 19 COL 26.       
         05 VALUE "Set TCID(5) and PFU: "       
                       FOREGROUND-COLOR 6       LINE 20 COL 10.
         05 TCIDPFU-OUT                      
            PIC S9(1)V9(2)  FROM TCID50RELPFU   LINE 20 COL 32.       
         05 VALUE "PLEASE SELECT Q TO EXIT:"    LINE 25 COL 10.
         05 RESPONSE-INPUT
                        PIC X          TO RESPONSE-IN-SETTINGS.

         *> Status of the containment unit program
         01 STATUS-SCREEN.
         05 VALUE "STATUS SCREEN"
                        BLANK SCREEN            LINE 1 COL 10.
         05 VALUE "DATE: "                      LINE 1 COL 35.
         05 DATE-OUTPUT
                         FROM WS-CURRENT-DATE
                         FOREGROUND-COLOR 2     LINE 1 COL 41.
         05 VALUE "--------------"              LINE 2 COL 10.
         05 VALUE "Containment State: "         
                       FOREGROUND-COLOR 6       LINE 4 COL 10.
         05 CONTAINED-OUTPUT 
                       PIC X(6) FROM CONTAINMENT-STATUS  
                       FOREGROUND-COLOR 2       LINE 4 COL 35. 
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 6 COL 10.
         05 VALUE "Lab Data"                   
                       FOREGROUND-COLOR 6       LINE 7 COL 10.
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 8 COL 10.
         05 VALUE "Relationship between TCID(50) and PFU: "
                       FOREGROUND-COLOR 6       LINE 9 COL 10.
         05 TCID-OUTPUT
                       PIC S9(1)V9(2) FROM TCID50RELPFU
                       FOREGROUND-COLOR 2       LINE 9 COL 50. 
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 14 COL 10.
         05 VALUE "Unit Details"
                       FOREGROUND-COLOR 6       LINE 15 COL 10.
         05 VALUE "---------------------"
                       FOREGROUND-COLOR 6       LINE 16 COL 10.
         05 VALUE "Serial Number: XT100"
                       FOREGROUND-COLOR 6       LINE 17 COL 10.
         05 VALUE "Fuel Source: Nuclear"
                       FOREGROUND-COLOR 6       LINE 18 COL 10.
         05 VALUE "Build Date: 12/12/86"
                       FOREGROUND-COLOR 6       LINE 19 COL 10.
         05 VALUE "PSI: "
                       FOREGROUND-COLOR 6       LINE 20 COL 10.
         05 PSI-OUTPUT
                       PIC XXX FROM PSI
                       FOREGROUND-COLOR 2       LINE 20 COL 17. 
         05 VALUE "System Maintainence: Good"
                       FOREGROUND-COLOR 2 BLINK LINE 23 COL 10.
         05 VALUE "PRESS Q TO EXIT: "           LINE 25 COL 10.
         05 RESPONSE-STATUS
                        PIC X          TO RESPONSE-IN-STATUS.

         *> Containment Unit Chamber Closed 
         01 CONTAINMENT-SCREEN.
         05 CONTAINMENT-LIVE-VIEW-SECTION.
            10 VALUE "CONTAINMENT UNIT LIVE VIEW"
                        BLANK SCREEN            LINE 1 COL 10.
            10 VALUE "--------------------------"
                                                LINE 2 COL 10.
         05 CONTAINMENT-CLOSED-UNIT-SECTION.
         10 VALUE "|---------------------------|"
                         FOREGROUND-COLOR 2 LINE 5 COL 10.
         10 VALUE "|COVID-2020 Containment Unit|"
                         FOREGROUND-COLOR 2 BLINK LINE 6 COL 10.
         10 VALUE "|        .*_; ;_*.          |"
                         FOREGROUND-COLOR 2 LINE 7 COL 10.
         10 VALUE "|       / /     \ \         |"
                         FOREGROUND-COLOR 2 LINE 8 COL 10.
         10 VALUE "|      | |       | |        |" 
                         FOREGROUND-COLOR 2 LINE 9 COL 10.
         10 VALUE "|       \ \.***./ /         |"
                         FOREGROUND-COLOR 2 LINE 10 COL 10.
         10 VALUE "|   .*'z   .***.   z'*.     |"
                         FOREGROUND-COLOR 2 LINE 11 COL 10.
         10 VALUE "| ,`.*z/ .'`***`'. \z*.`,   |"
                         FOREGROUND-COLOR 2 LINE 12 COL 10.
         10 VALUE "| '`   | | \(_)/ | |   `'   |"
                         FOREGROUND-COLOR 2 LINE 13 COL 10.
         10 VALUE "| ,    \  \ | | /  /    ,   |"
                         FOREGROUND-COLOR 2 LINE 14 COL 10.
         10 VALUE "| ;`'.,_\  `*'*'  /_,.'`;   |"
                         FOREGROUND-COLOR 2 LINE 15 COL 10.
         10 VALUE "|  '*._  _.*'^'*._  _.*'    |"
                         FOREGROUND-COLOR 2 LINE 16 COL 10.
         10 VALUE "|      ``         ``        |"
                         FOREGROUND-COLOR 2 LINE 17 COL 10.
         10 VALUE "|---------------------------|"
                         FOREGROUND-COLOR 2 LINE 18 COL 10.
         10 VALUE " Status:                     "
                         FOREGROUND-COLOR 2 LINE 19 COL 10.
         10 UNIT-OUTPUT 
                         PIC X(6) FROM CONTAINMENT-STATUS  
                         FOREGROUND-COLOR 2       LINE 19 COL 25. 

         *> Containment Unit Opened
         05 CONTAINMENT-OPENED-UNIT-SECTION.
         10 VALUE "CONTAINMENT UNIT LIVE VIEW"
                          BLANK SCREEN            LINE 1 COL 10.
         10 VALUE "--------------------------"
                                                  LINE 2 COL 10.
         10 VALUE "|---------------------------|"
                         FOREGROUND-COLOR 4 LINE 5 COL 10.
         10 VALUE "|COVID-2020 Containment Unit|"
                         FOREGROUND-COLOR 4 LINE 6 COL 10.
         10 VALUE "|        .*_; ;_*.          |"
                         FOREGROUND-COLOR 4 BLINK LINE 7 COL 10.
         10 VALUE "|       / /     \ \         |"
                         FOREGROUND-COLOR 4 BLINK LINE 8 COL 10.
         10 VALUE "|      | |       | |        |" 
                         FOREGROUND-COLOR 4 BLINK LINE 9 COL 10.
         10 VALUE "|       \ \.***./ /         |"
                         FOREGROUND-COLOR 4 BLINK LINE 10 COL 10.
         10 VALUE "|   .*'z   .***.   z'*.     |"
                         FOREGROUND-COLOR 4 BLINK LINE 11 COL 10.
         10 VALUE "| ,`.*z/ .'`***`'. \z*.`,   |"
                         FOREGROUND-COLOR 4 BLINK LINE 12 COL 10.
         10 VALUE "| '`   | | \(_)/ | |   `'   |"
                         FOREGROUND-COLOR 4 BLINK LINE 13 COL 10.
         10 VALUE "| ,    \  \ | | /  /    ,   |"
                         FOREGROUND-COLOR 4 BLINK LINE 14 COL 10.
         10 VALUE "| ;`'.,_\  `*'*'  /_,.'`;   |"
                         FOREGROUND-COLOR 4 BLINK LINE 15 COL 10.
         10 VALUE "|  '*._  _.*'^'*._  _.*'    |"
                         FOREGROUND-COLOR 4 BLINK LINE 16 COL 10.
         10 VALUE "|      ``         ``        |"
                         FOREGROUND-COLOR 4 BLINK LINE 17 COL 10.
         10 VALUE "|---------------------------|"
                         FOREGROUND-COLOR 4 LINE 18 COL 10.
         10 VALUE " Status:                     "
                         FOREGROUND-COLOR 4 LINE 19 COL 10.
         10 UNIT-OUTPUT 
                         PIC X(6) FROM CONTAINMENT-STATUS  
                         FOREGROUND-COLOR 4       LINE 19 COL 25. 
         10 FLAG-OUTPUT
                         PIC X(16) FROM CONTAINMENT-FLAG
                         FOREGROUND-COLOR 4       LINE 20 COL 15.
         05 CONTAINMENT-COMMAND-SECTION.
            10 VALUE "PRESS Q TO EXIT: "        LINE 22 COL 10.
            10 RESPONSE-CONTAINMENT
                        PIC X          TO RESPONSE-IN-CONTAINMENT.

       PROCEDURE DIVISION.
       
       *> Read settings file
       OPEN INPUT USERS.
          PERFORM UNTIL WS-EOF='Y'
             READ USERS INTO WS-USER
                AT END MOVE 'Y' TO WS-EOF
             END-READ
          END-PERFORM.
       CLOSE USERS. 

       *> Decrypt the expiration date 
       DECRYPT.
       MOVE WS-USER-EXP TO ACCOUNT-EXPIRATION.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'A' BY '0'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'B' BY '1'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'C' BY '2'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'D' BY '3'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'E' BY '4'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'F' BY '5'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'G' BY '6'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'H' BY '7'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'I' BY '8'.
       INSPECT ACCOUNT-EXPIRATION REPLACING ALL 'J' BY '9'.

       *> Render welcome/intro screen 
       PERFORM UNTIL RESPONSE-IN-LOGIN = "L"
          DISPLAY INTRO-SCREEN
          ACCEPT  INTRO-SCREEN 
       END-PERFORM. 

       *> Render and handle response for login screen
       PERFORM UNTIL RESPONSE-IN-WS = "Q" OR (RESPONSE-IN-WS = "C"
                     AND LOGGED-IN = "T")   
          DISPLAY LOGIN-SCREEN
          ACCEPT LOGIN-SCREEN

          IF RESPONSE-IN-WS = "Q" THEN
             STOP RUN
          END-IF

          IF (ID-IN-WS = WS-USER-ID) AND 
                    (PWD-IN-WS = WS-USER-PWD)
              MOVE "T" TO LOGGED-IN
          ELSE 
             MOVE "Login Incorrect" TO LOGIN-MSG
          END-IF
       END-PERFORM.

       *> Handle main menu 
       PERFORM UNTIL WS-MENU = "Q"
          IF (ACCOUNT-EXPIRATION = "123199") AND 
                      (WS-CURRENT-DATE = 19991231) THEN
             MOVE "010100" TO TIME-LOCK
             MOVE 20000101 TO WS-CURRENT-DATE
             MOVE "OPENED" TO CONTAINMENT-STATUS
          ELSE IF (WS-CURRENT-DATE = 200001) AND 
                  (TIME-LOCK = "010100") THEN
             MOVE 20000101 TO WS-CURRENT-DATE
          ELSE   
             MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA
          END-IF  

          EVALUATE WS-MENU
            WHEN "M" DISPLAY MAIN-MENU-SCREEN
                     ACCEPT  MAIN-MENU-SCREEN
                     MOVE RESPONSE-IN-MENU TO WS-MENU
            WHEN "S" DISPLAY SETTINGS-SCREEN
                     ACCEPT  SETTINGS-SCREEN
                     MOVE "M" TO WS-MENU
            WHEN "T" DISPLAY STATUS-SCREEN
                     ACCEPT  STATUS-SCREEN   
                     MOVE "M" TO WS-MENU
            WHEN "U" DISPLAY CONTAINMENT-LIVE-VIEW-SECTION
                     IF (CONTAINMENT-STATUS = "OPENED")
                               AND (TIME-LOCK = "010100")  
                        DISPLAY CONTAINMENT-OPENED-UNIT-SECTION
                     ELSE
                        DISPLAY CONTAINMENT-CLOSED-UNIT-SECTION
                     END-IF
                     DISPLAY CONTAINMENT-COMMAND-SECTION
                     ACCEPT  CONTAINMENT-COMMAND-SECTION   
                     MOVE "M" TO WS-MENU
            WHEN other MOVE "M" TO WS-MENU
          END-EVALUATE
       END-PERFORM. 

       *> End program
       STOP RUN.
