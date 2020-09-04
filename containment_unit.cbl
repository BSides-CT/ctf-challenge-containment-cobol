       *> setup the identification division
       IDENTIFICATION DIVISION.
         *> setup the program id
         PROGRAM-ID. CONTAINMENTUNIT.
         *> setup the procedure division (equiv. main() function)

       DATA DIVISION.
         *> Set variables
         WORKING-STORAGE SECTION.

         01 TCID50RELPFU PIC S9(1)V9(2) VALUE 0.69.

         01 RESPONSE-INTRO.
            05 RESPONSE-IN-LOGIN  PIC X     VALUE "X".  

         01 RESPONSEC.
            05 RESPONSE-IN-WS  PIC X     VALUE "C".
         01 DATA-FROM-SCREEN.
            05 ID-IN-WS        PIC XXXX  VALUE SPACES.  
            05 PWD-IN-WS       PIC X(20) VALUE SPACES.  


         SCREEN SECTION.

         01  DATA-ENTRY-SCREEN.
         05  VALUE "DATA ENTRY SCREEN" BLANK SCREEN     LINE 1 COL 35.
         05  VALUE "ID #"                               LINE 3 COL 10.
         05   ID-INPUT                                  LINE 3 COL 25
                         PIC  X(4)     TO ID-IN-WS.
         05  VALUE "PASSWORD"                           LINE 5 COL 10.
         05  NAME-INPUT                                 LINE 5 COL 25
                         PIC X(20)     TO PWD-IN-WS.
         05  VALUE "C - TO CONTINUE"                    LINE 11 COL 30.
         05  VALUE "Q - TO QUIT"                        LINE 12 COL 30.
         05  VALUE "ENTER RESPONSE"                     LINE 14 COL 30.
         05  RESPONSE-INPUT                             LINE 14 COL 45
                         PIC X         TO RESPONSE-IN-WS.       


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
                         LINE 7 COL 1.
         05 VALUE "       / /     \ \               "
                         LINE 8 COL 1.
         05 VALUE "      | |       | |              " 
                         LINE 9 COL 1.
         05 VALUE "       \ \.***./ /               "
                         LINE 10 COL 1.
         05 VALUE "   .*'z   .***.   z'*.           "
                         LINE 11 COL 1.
         05 VALUE " ,`.*z/ .'`***`'. \z*.`,         "
                         LINE 12 COL 1.
         05 VALUE " '`   | | \(_)/ | |   `'         "
                         LINE 13 COL 1.
         05 VALUE " ,    \  \ | | /  /    ,         "
                         LINE 14 COL 1.
         05 VALUE " ;`'.,_\  `*'*'  /_,.'`;         "
                         LINE 15 COL 1.
         05 VALUE "  '*._  _.*'^'*._  _.*'          "
                         LINE 16 COL 1.
         05 VALUE "      ``         ``              "
                         LINE 17 COL 1.
         05 VALUE "     Danger Biohazard            "
                         LINE 18 COL 1.
         05 VALUE "     Press L to Login:           "
                         LINE 19 COL 1.
         05  RESPONSE-INPUT                             LINE 19 COL 23
                         PIC X         TO RESPONSE-IN-LOGIN.       

       PROCEDURE DIVISION.
       *> print system welcome message

       PERFORM UNTIL RESPONSE-IN-LOGIN = "L"
          DISPLAY INTRO-SCREEN
          ACCEPT  INTRO-SCREEN 
       END-PERFORM. 

       DISPLAY DATA-ENTRY-SCREEN.
       ACCEPT  DATA-ENTRY-SCREEN.
       *>PFU-PROCEDURE.
       *>  DISPLAY "Relationship between TCID(50) and PFU: "TCID50RELPFU.
       *> end program
       STOP RUN.
