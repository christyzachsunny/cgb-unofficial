;Uses multiple pixels with coordinates of each color in a certain region, works for memory BMP

;$xSkip and $ySkip for numbers of pixels skip
;$offColor[2][COLOR/OFFSETX/OFFSETY] offset relative to firstColor coordination

Func _MultiPixelSearch($iLeft, $iTop, $iRight, $iBottom, $xSkip, $ySkip, $firstColor, $offColor, $iColorVariation)
	_CaptureRegion($iLeft, $iTop, $iRight, $iBottom)
	For $x = 0 To $iRight - $iLeft Step $xSkip
		For $y = 0 to $iBottom - $iTop Step $ySkip
			If _ColorCheck(_GetPixelColor($x, $y), $firstColor, $iColorVariation) Then
			     Local $allchecked = True
				 For $i = 0 to UBound($offColor) - 1
					 If _ColorCheck(_GetPixelColor($x + $offColor[$i][1], $y + $offColor[$i][2]), Hex($offColor[$i][0], 6), $iColorVariation) = False Then
						$allchecked = False
						ExitLoop
					 EndIf
				  Next
				  If $allChecked Then
					 Local $Pos[2] = [$iLeft + $x, $iTop + $y]
					 Return $Pos
				  EndIf
			EndIf
		Next
	Next
	Return 0
 EndFunc   ;==>_MultiPixelSearch

 Func _MultiPixelSearch2($x, $y,  $firstColor, $offColor, $iColorVariation,$hBitmapLocal=$hBitmap)
	;_CaptureRegion($iLeft, $iTop, $iRight, $iBottom)
	;$nameFunc = "[_MultiPixelSearch2] "
	;debugRedArea($nameFunc&" IN")
    ;debugRedArea($nameFunc&"  Search if  pixel  x ["&$x&"] / y["&$y&"] match")
   If _ColorCheck(_GetPixelColor($x, $y,$hBitmapLocal), $firstColor, $iColorVariation) Then
	 ; debugRedArea($nameFunc&"  => Match ")
		Local $allchecked = True
		For $i = 0 to UBound($offColor) - 1
		  ; debugRedArea($nameFunc&"  Search if  pixel  x ["&$x + $offColor[$i][1]&"] / y["&$y + $offColor[$i][2]&"] match")
			If _ColorCheck(_GetPixelColor($x + $offColor[$i][1], $y + $offColor[$i][2],$hBitmapLocal), Hex($offColor[$i][0], 6), $iColorVariation) = False Then
			;  debugRedArea($nameFunc&"  => Not Match")
			  $allchecked = False
			   ExitLoop
			EndIf
		 Next
		 If $allChecked Then
			Local $Pos[2] = [$x, $y]
			Return $Pos
		 EndIf
   EndIf
	Return 0
EndFunc   ;==>_MultiPixelSearch