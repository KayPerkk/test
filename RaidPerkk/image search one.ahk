#Requires AutoHotkey v1

; Define the folder where the images are stored
ImageFolder := "C:\Users\KayPp\OneDrive\Documents\AutoHotkey\RaidPerkk\"

; Hotkey to start the automation (F1)
F1::
{
    ; Step 1: Click the button area based on the "Areas" screenshot
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, % ImageFolder . "Areas.png"
    if (ErrorLevel = 0) {
        Click, %FoundX%, %FoundY%
    } else {
        ; If the "Areas" button is not found, exit the script
        Return
    }
    Sleep 1000

    ; Step 2: Find and click the "Raids" button
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, % ImageFolder . "RaidButton.png"
    if (ErrorLevel = 0) {
        Click, %FoundX%, %FoundY%
    } else {
        ; If the "Raids" button is not found, exit the script
        Return
    }
    Sleep 1000

    ; Step 3: Hold W for 2.5 seconds, A for 0.5 seconds, and W for 6 seconds
    Send, {W down}
    Sleep, 2500 ; Hold W for 2.5 seconds
    Send, {W up}
    Sleep, 500 ; Give a small pause after releasing W
    
    Send, {A down}
    Sleep, 500 ; Hold A for 0.5 seconds
    Send, {A up}
    Sleep, 500 ; Give a small pause after releasing A
    
    Send, {W down}
    Sleep, 6000 ; Hold W for 6 seconds
    Send, {W up}
    Sleep, 500 ; Give a small pause after releasing W
    
    Sleep 1000

    ; Step 4: Find and click the "Namek Map" button, if not found click at (1715, 379)
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, % ImageFolder . "NamekMapButton.png"
    if (ErrorLevel = 0) {
        Click, %FoundX%, %FoundY%
    } else {
        Click, 1715, 379 ; Coordinates for Namek Map if not found
    }
    Sleep 1000

    ; Step 5: Find and click "Act 4", if not found click at (699, 573)
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, % ImageFolder . "Act4Button.png"
    if (ErrorLevel = 0) {
        Click, %FoundX%, %FoundY%
    } else {
        Click, 699, 573 ; Coordinates for Act 4 if not found
    }
    Sleep 1000

    ; Step 6: Click the "SelectButton" at coordinates x958, y815
    Click, 958, 815
    Sleep 1000 ; Wait for the "Play Here" button

    ; Step 7: Click the "Play Here" button at coordinates x834, y581
    Click, 834, 581
    Sleep 1000 ; Wait for the "Start Here" button

    ; Step 8: Click the "Start Here" button at coordinates x981, y788
    Click, 981, 788
    Sleep 30000 ; Wait 30 seconds to load into the map

    ; Step 9: Start spam clicking the "YES" button
    Loop, 20 ; Adjust the loop count as needed
    {
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, % ImageFolder . "YesButton.png"
        if (ErrorLevel = 0) {
            Click, %FoundX%, %FoundY%
        }
        Sleep 100
    }

    ; Step 10: Spam place units
    ; Script ends here
}
return

; Hotkey to exit the script (F2)
F2::
{
    ExitApp
}
