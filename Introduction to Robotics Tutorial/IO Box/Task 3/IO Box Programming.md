```Epson RC+7.0
Function Main
	Motor On
	Power High
	Speed 30
	Accel 30, 30
	SpeedS 300
	AccelS 5000
	height = 6
	tokenpos = 0
	blockpos = 0
	Tool 0
	Go start
	Wait Sw(0) = On
	Do While Sw(0) = On
		If Sw(0) = On Then
			Xqt task3
		EndIf

		Do While Sw(0) = On And Sw(7) = Off
			Do While Sw(4) = On
				Wait Sw(4) = On
					Halt task3
				If Sw(2) = On Then
					Off 8
				EndIf
				If Sw(4) = Off Then
					Resume task3
				EndIf
			Loop
			If Sw(6) = On Then
				Quit task3
				Xqt Reverse
			EndIf
		Loop

	  	If Sw(7) = On Then
			Quit task3
			Quit Reverse
			Off 8
	    	Wait 2
	    	Go Safe
	    	Go start
	  	EndIf
	  	Wait Sw(7) = Off
		Wait Sw(0) = Off
	Loop
Fend

Function task3
	CheckToken()
	CheckBlock()
	If worktoken = 1 And workblock = 1 Then
		On 13
		GoTo End
	EndIf
	If worktoken = 0 Then
		For tokenpos = findtoken To 2
 			PickToken()
 			FixToken()
 			PlaceToken()
	 	Next
	ElseIf worktoken = 1 Then
		GoTo Block
	EndIf
 	Block:
 	If workblock = 0 Then
 		For blockpos = findblock To 2
 			PickBlock()
 			FixBlock()
 			PlaceBlock()
	 	Next
	ElseIf workblock = 1 Then
	 	GoTo End
 	EndIf
 	End:
	Go start
	Off 13
Fend
