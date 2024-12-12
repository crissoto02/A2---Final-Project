```Epson RC+7.0
Integer tokenpos
Integer blockpos
Integer findtoken
Integer findblock
Integer height
Integer worktoken
Integer workblock
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
Function CheckToken
	Go localpicktoken +Z(40)
 	Go localpicktoken -Z(tokenpos * height)
 	On 8
 	Wait 0.5
 	If Sw(16) = On Then
 		findtoken = 0
 		worktoken = 0
 	ElseIf Sw(16) = Off Then
 		tokenpos = 1
 		Go localpicktoken -Z(tokenpos * height)
 		Wait 0.5
 		If Sw(16) = On Then
 			findtoken = 1
 			worktoken = 0
 		ElseIf Sw(16) = Off Then
 			tokenpos = 2
 			Go localpicktoken -Z(tokenpos * height)
 			Wait 0.5
 			If Sw(16) = On Then
 				findtoken = 2
 				worktoken = 0
 			ElseIf Sw(16) = Off Then
 				worktoken = 1
 			EndIf
 		EndIf
 	EndIf
 	Off 8
 	Wait 0.5
 	Go localpicktoken +Z(40)
 	tokenpos = 0
Fend
Function CheckBlock
	Go localpickblock +Z(40)
 	Go localpickblock -Z(blockpos * height)
 	On 8
 	Wait 0.5
 	If Sw(16) = On Then
 		findblock = 0
 		workblock = 0
 	ElseIf Sw(16) = Off Then
 		blockpos = 1
 		Go localpickblock -Z(blockpos * height)
 		Wait 0.5
 		If Sw(16) = On Then
 			findblock = 1
 			workblock = 0
 		ElseIf Sw(16) = Off Then
 			blockpos = 2
 			Go localpickblock -Z(blockpos * height)
 			Wait 0.5
 			If Sw(16) = On Then
 				findblock = 2
 				workblock = 0
 			ElseIf Sw(16) = Off Then
 				workblock = 1
 			EndIf
 		EndIf
 	EndIf
 	Off 8
 	Wait 0.5
 	Go localpickblock +Z(40)
 	blockpos = 0
Fend
Function PickToken
	Go localpicktoken +Z(40)
	Go localpicktoken -Z(tokenpos * height)
	On 8
	Wait 0.5
	Go localpicktoken +Z(40)
Fend
Function FixToken
 	Go localfixtoken +Z(20) -X(2)
	Go localfixtoken -X(2)
 	Off 8
 	Go localfixtoken +X(2)
	Go localfixtoken +X(2) +Z(5)
 	Go localfixtoken +Z(5)
	Go localfixtoken
 	On 8
 	Wait 0.5
 	Move localfixtoken +Z(20)
Fend
Function PlaceToken
 	Go localplacetoken +Z(20) -Y(tokenpos * 30)
 	Move localplacetoken -Y(tokenpos * 30)
 	Off 8
 	Wait 0.5
 	Go localplacetoken +Z(20) -Y(tokenpos * 30)
Fend
Function PickBlock
	Go localpickblock +Z(40)
	Go localpickblock -Z(blockpos * height)
	On 8
 	Wait 0.5
	Go localpickblock +Z(40)
Fend
Function FixBlock
 	Go localfixblock +Z(20)
 	Go localfixblock
 	Off 8
 	Move localfixblock +Z(5)
	On 9
	Wait 1
	Off 9
 	Move localfixblock
	On 8
 	Go localfixblock +Z(30)
Fend
Function PlaceBlock
 	Go localplaceblock +Z(20) -Y(blockpos * 30)
 	Go localplaceblock -Y(blockpos * 30)
 	Off 8
 	Wait 0.5
 	Go localplaceblock -Y(blockpos * 30) +Z(20)
 Fend
Function Reverse
	findtoken = -1
	findblock = -1
	tokenpos = 0
	blockpos = 0
	For tokenpos = 0 To 2
		RevToken()
	Next
	For blockpos = 0 To 2
		RevBlock()
	Next
	Go start
Fend
Function RevToken
	Go localplacetoken +Z(20) -Y(tokenpos * 30)
	Wait 0.5
	Go localplacetoken -Y(tokenpos * 30)
	On 8
	Wait 0.5
	If Sw(16) = On Then
		Go localplacetoken +Z(20) -Y(tokenpos * 30)
		findtoken = findtoken + 1
		RFixToken()
		RPickToken()
	Else
		Go localplacetoken +Z(20) -Y(tokenpos * 30)
		Off 8
	EndIf
Fend
Function RevBlock
	Go localplaceblock +Z(20) -Y(blockpos * 30)
	Wait 0.5
	Go localplaceblock -Y(blockpos * 30)
	On 8
	Wait 0.5
	If Sw(16) = On Then
		Go localplaceblock +Z(20) -Y(blockpos * 30)
		findblock = findblock + 1
		RFixBlock()
		RPickBlock()
	Else
		Go localplaceblock +Z(20) -Y(blockpos * 30)
		Off 8
	EndIf
Fend
Function RPickToken
	Go localpicktoken +Z(60) -X(3)
	Go localpicktoken +Z(findtoken * height - 8) -X(3)
	Go localpicktoken +Z(findtoken * height - 8)
	Go localpicktoken +Z(findtoken * height - 12)
	Off 8
	Wait 0.5
	Go localpicktoken +Z(60)
Fend
Function RFixToken
  	Go localfixtoken +Z(20) -X(3)
	Go localfixtoken -X(2)
 	Off 8
 	Go localfixtoken +X(2)
	Go localfixtoken +X(2) +Z(5)
 	Go localfixtoken +Z(5)
	Go localfixtoken
 	On 8
 	Wait 0.5
 	Move localfixtoken +Z(20)
Fend
Function RPickBlock
	Go localpickblock +Z(60) +Y(3) -X(3)
	Go localpickblock +Z(findblock * height - 8) +Y(3) -X(3)
	Go localpickblock +Z(findblock * height - 8)
	Go localpickblock +Z(findblock * height - 12)
	Off 8
 	Wait 0.5
	Go localpickblock +Z(60)
Fend
Function RFixBlock
 	Go localfixblock +Z(20)
 	Go localfixblock
 	Off 8
 	Move localfixblock +Z(5)
	On 10
	Wait 1
	Off 10
 	Move localfixblock
	On 8
 	Go localfixblock +Z(30)
Fend

