function print_OLED()
   disp:firstPage()
   repeat
     disp:drawFrame(0,0,127,63)
     if(doorOpen) then
        disp:drawStr(7, 15, open)
        disp:drawCircle(40, 20, 4)         
     else     
        disp:drawStr(7, 5, closed)
        disp:drawCircle(40, 10, 4)         
     end
     -- disp:drawStr(5, 40, title)
     -- debug
    disp:drawStr(5, 40, debugMsg)
   until disp:nextPage() == false
   
end
closed="        closed"
open  ="        open"
title="        PORTAI"

print_OLED()