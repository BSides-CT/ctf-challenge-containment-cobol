       *> setup the identification division
       IDENTIFICATION DIVISION.
         *> setup the program id
         PROGRAM-ID. CONTAINMENTUNIT.
         *> setup the procedure division (equiv. main() function)

       DATA DIVISION.
         *> Set variables
         WORKING-STORAGE SECTION.

         01 TCID50RELPFU PIC S9(1)V9(2) VALUE 0.69.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         *> print system welcome message (move to screen section) 

         DISPLAY "*********************************".
         DISPLAY "* COVID-2020 Containment Unit   *".
         DISPLAY "* Developed in 1986             *".
         DISPLAY "* By the retro*causal engineers *".
         DISPLAY "*********************************".
         DISPLAY "                                 ".
         DISPLAY "        .*_; ;_*.                ".
         DISPLAY "       / /     \ \               ".
         DISPLAY "      | |       | |              ". 
         DISPLAY "       \ \.***./ /               ".
         DISPLAY "   .*'z   .***.   z'*.           ".
         DISPLAY " ,`.*z/ .'`***`'. \z*.`,         ".
         DISPLAY " '`   | | \(_)/ | |   `'         ".
         DISPLAY " ,    \  \ | | /  /    ,         ".
         DISPLAY " ;`'.,_\  `*'*'  /_,.'`;         ".
         DISPLAY "  '*._  _.*'^'*._  _.*'          ".
         DISPLAY "      ``         ``              ".
         DISPLAY "     Danger Biohazard            ".

       PFU-PROCEDURE.
         DISPLAY "Relationship between TCID(50) and PFU: "TCID50RELPFU.
       *> end program
       STOP RUN.
