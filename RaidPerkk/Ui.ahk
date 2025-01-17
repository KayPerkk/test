; Set custom image paths correctly (adjust path if necessary)
CustomImage := A_ScriptDir . "\Lib\Images\custom_image.png"
NewCloseImage := A_ScriptDir . "\Lib\Images\new_close.png"

; Main GUI setup
MainGUI := Gui("-Caption +Border +AlwaysOnTop", "Custom Macro v1.0")
MainGUI.BackColor := "0c000a"
MainGUI.SetFont("s9 bold", "Segoe UI")

; Custom text for the window
MainGUI.Add("Text", "x12 y632 w800 cWhite +BackgroundTrans", "Custom Macro v1.0")

; New button with custom action
NewButton := MainGUI.Add("Button", "x850 y310 w198 h30 cffffff +Center", "New Feature")
NewButton.OnEvent("Click", (*) => NewFeatureAction())

; Close button with new image
CloseAppButton := MainGUI.Add("Picture", "x1052 y10 w30 h32 +BackgroundTrans cffffff", NewCloseImage)
CloseAppButton.OnEvent("Click", (*) => ExitApp())

; New action for the button
NewFeatureAction() {
    MsgBox("You clicked the new button!")
}

; Show the GUI
MainGUI.Show("x27 y15 w1100 h665")
