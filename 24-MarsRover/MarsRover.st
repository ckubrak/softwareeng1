!classDefinition: #MarsRoverTests category: #MarsRover!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:09:57'!
test00EmptyCommand
	| rover |
	rover := MarsRover new initializeWithX: 0 y:0 andOrientation: #North.
	rover sendCommand: ''.
	self assert: rover position = (0@0).
	self assert: rover orientation = #North.! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:07'!
test01ForwardWithNorthDirection
	| rover |
	rover := MarsRover new initializeWithX: -1 y:100 andOrientation: #North.
	rover sendCommand: 'f'.
	self assert: rover position = (-1@101).
	self assert: rover orientation = #North.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:14'!
test02ForwardWithSouthDirection
	| rover |
	rover := MarsRover new initializeWithX: 0 y:10 andOrientation: #South.
	rover sendCommand: 'f'.
	self assert: rover position = (0@9).
	self assert: rover orientation = #South.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:23'!
test03ForwardWithEastDirection
	| rover |
	rover := MarsRover new initializeWithX: 1 y:10 andOrientation: #East.
	rover sendCommand: 'f'.
	self assert: rover position = (2@10).
	self assert: rover orientation = #East.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:31'!
test04ForwardWithWestDirection
	| rover |
	rover := MarsRover new initializeWithX: 1 y: -10 andOrientation: #West.
	rover sendCommand: 'f'.
	self assert: rover position = (0@-10).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:38'!
test05BackardWithNorthDirection
	| rover |
	rover := MarsRover new initializeWithX: 0 y:10 andOrientation: #North.
	rover sendCommand: 'b'.
	self assert: rover position = (0@9).
	self assert: rover orientation = #North.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:45'!
test06BackardWithSouthDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #South.
	rover sendCommand: 'b'.
	self assert: rover position = (-2@11).
	self assert: rover orientation = #South.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:51'!
test07BackardWithEastDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #East.
	rover sendCommand: 'b'.
	self assert: rover position = (-3@10).
	self assert: rover orientation = #East.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 11:53:57'!
test08BackardWithWestDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #West.
	rover sendCommand: 'b'.
	self assert: rover position = (-1@10).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:13:32'!
test09RotateLeftWithNorthDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #North.
	rover sendCommand: 'l'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:13:39'!
test10RotateLeftWithSouthDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #South.
	rover sendCommand: 'l'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #East.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:13:45'!
test11RotateLeftWithEastDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #East.
	rover sendCommand: 'l'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #North.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:13:50'!
test12RotateLeftWithWestDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #West.
	rover sendCommand: 'l'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #South.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:13:57'!
test13RotateRigthWithNorthDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #North.
	rover sendCommand: 'r'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #East.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:14:03'!
test14RotateRightWithSouthDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #South.
	rover sendCommand: 'r'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:14:08'!
test15RotateRightWithEastDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #East.
	rover sendCommand: 'r'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #South.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:14:13'!
test16RotateRightWithWestDirection
	| rover |
	rover := MarsRover new initializeWithX: -2 y:10 andOrientation: #West.
	rover sendCommand: 'r'.
	self assert: rover position = (-2@10).
	self assert: rover orientation = #North.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:19:40'!
test17InvalidCommand
	| rover |
	rover := MarsRover new initializeWithX: 0 y:0 andOrientation: #West.
	self should: [rover sendCommand: 'x'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover invalidInstruction ].
	
	self assert: rover position = (0@0).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:37:41'!
test18MoreThanOneInstruction
	| rover |
	rover := MarsRover new initializeWithX: -1 y:3 andOrientation: #North.
	rover sendCommand: 'fl'.
	self assert: rover position = (-1@4).
	self assert: rover orientation = #West.
	! !

!MarsRoverTests methodsFor: 'test' stamp: 'kw 5/13/2019 13:37:46'!
test19StopReadingInstructionsAfterInvalidAndRaiseError
	| rover |
	rover := MarsRover new initializeWithX: 0 y:0 andOrientation: #West.
	self should: [rover sendCommand: 'fxl'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover invalidInstruction ].
	
	self assert: rover position = (-1@0).
	self assert: rover orientation = #West.
	! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'xCoordinate yCoordinate orientation validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialize' stamp: 'kw 5/13/2019 13:25:03'!
initialize
	validCommands := Dictionary new.
	validCommands at:$f put:[:rover|(MarsRoverOrientation initializeWith: rover) moveForward].
	validCommands at:$b put:[:rover|(MarsRoverOrientation initializeWith: rover) moveBackward].
	validCommands at:$l put:[:rover|(MarsRoverOrientation initializeWith: rover) rotateLeft].
	validCommands at:$r put:[:rover|(MarsRoverOrientation initializeWith: rover) rotateRight].! !

!MarsRover methodsFor: 'initialize' stamp: 'kw 5/13/2019 12:18:33'!
initializeWithX: xCoordinated y: yCoordinateriable andOrientation: anOrientation
	xCoordinate := xCoordinated.
	yCoordinate := yCoordinateriable.
	orientation := anOrientation.! !


!MarsRover methodsFor: 'movement' stamp: 'kw 5/13/2019 12:16:14'!
moveEast
	xCoordinate := xCoordinate + 1.! !

!MarsRover methodsFor: 'movement' stamp: 'kw 5/13/2019 12:17:12'!
moveNorth
	yCoordinate := yCoordinate + 1.! !

!MarsRover methodsFor: 'movement' stamp: 'kw 5/13/2019 12:19:16'!
moveSouth
	yCoordinate := yCoordinate - 1.! !

!MarsRover methodsFor: 'movement' stamp: 'kw 5/13/2019 12:20:03'!
moveWest
	xCoordinate := xCoordinate - 1.! !


!MarsRover methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:15:59'!
rotateToEast
	orientation := #East! !

!MarsRover methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:16:45'!
rotateToNorth
	orientation := #North! !

!MarsRover methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:17:27'!
rotateToSouth
	orientation := #South! !

!MarsRover methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:15:18'!
rotateToWest
	orientation := #West! !


!MarsRover methodsFor: 'information' stamp: 'kw 5/13/2019 11:16:26'!
orientation
	^orientation ! !

!MarsRover methodsFor: 'information' stamp: 'kw 5/13/2019 12:17:38'!
position
	^(xCoordinate @ yCoordinate).! !


!MarsRover methodsFor: 'sendCommands' stamp: 'kw 5/13/2019 13:28:54'!
sendAnyCommand: aCommand ifNonDefine: aErrorBlock 
	|aMethodBlock|
	aMethodBlock := validCommands at: aCommand ifAbsent: aErrorBlock .
	aMethodBlock  value:self.! !

!MarsRover methodsFor: 'sendCommands' stamp: 'kw 5/13/2019 13:28:23'!
sendCommand: aCommands
	
	aCommands do:[:aCommand |
		self sendAnyCommand: aCommand ifNonDefine: [^ self error: MarsRover invalidInstruction].
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 13:19:58'!
invalidInstruction
	^ 'Command contains an invalid instruction'! !


!classDefinition: #MarsRoverOrientation category: #MarsRover!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'initialize' stamp: 'kw 5/13/2019 12:11:49'!
initializeOrientation: aMarsRover
	marsRover := aMarsRover .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientation class' category: #MarsRover!
MarsRoverOrientation class
	instanceVariableNames: ''!

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 12:12:12'!
initializeWith: aMarsRover
	|marsRoverOrientation|
	marsRoverOrientation := self subclasses detect: [:aMarsRoverOrientation | aMarsRoverOrientation isFor: aMarsRover].
	^ marsRoverOrientation new initializeOrientation: aMarsRover.! !


!classDefinition: #MarsRoverOrientationEast category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationEast methodsFor: 'movement' stamp: 'kw 5/13/2019 12:15:31'!
moveBackward
	^ marsRover moveWest.! !

!MarsRoverOrientationEast methodsFor: 'movement' stamp: 'kw 5/13/2019 12:15:53'!
moveForward
	^ marsRover moveEast.! !


!MarsRoverOrientationEast methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:16:32'!
rotateLeft
	^ marsRover rotateToNorth.! !

!MarsRoverOrientationEast methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:18:59'!
rotateRight
	^ marsRover rotateToSouth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationEast class' category: #MarsRover!
MarsRoverOrientationEast class
	instanceVariableNames: ''!

!MarsRoverOrientationEast class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 12:13:45'!
isFor: aMarsRover
	^ aMarsRover orientation = #East.! !


!classDefinition: #MarsRoverOrientationNorth category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationNorth methodsFor: 'movement' stamp: 'kw 5/13/2019 12:20:37'!
moveBackward
	^ marsRover moveSouth.! !

!MarsRoverOrientationNorth methodsFor: 'movement' stamp: 'kw 5/13/2019 12:16:48'!
moveForward
	^ marsRover moveNorth.! !


!MarsRoverOrientationNorth methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:14:56'!
rotateLeft
	^ marsRover rotateToWest.! !

!MarsRoverOrientationNorth methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:18:14'!
rotateRight
	^ marsRover rotateToEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationNorth class' category: #MarsRover!
MarsRoverOrientationNorth class
	instanceVariableNames: ''!

!MarsRoverOrientationNorth class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 12:14:23'!
isFor: aMarsRover
	^ aMarsRover orientation = #North.! !


!classDefinition: #MarsRoverOrientationSouth category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationSouth methodsFor: 'movement' stamp: 'kw 5/13/2019 12:20:59'!
moveBackward
	^ marsRover moveNorth.! !

!MarsRoverOrientationSouth methodsFor: 'movement' stamp: 'kw 5/13/2019 12:19:01'!
moveForward
	^ marsRover moveSouth.! !


!MarsRoverOrientationSouth methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:15:45'!
rotateLeft
	^ marsRover rotateToEast.! !

!MarsRoverOrientationSouth methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:18:38'!
rotateRight
	^ marsRover rotateToWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationSouth class' category: #MarsRover!
MarsRoverOrientationSouth class
	instanceVariableNames: ''!

!MarsRoverOrientationSouth class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 12:14:44'!
isFor: aMarsRover
	^ aMarsRover orientation = #South.! !


!classDefinition: #MarsRoverOrientationWest category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationWest methodsFor: 'movement' stamp: 'kw 5/13/2019 12:21:43'!
moveBackward
	^ marsRover moveEast.! !

!MarsRoverOrientationWest methodsFor: 'movement' stamp: 'kw 5/13/2019 12:19:52'!
moveForward
	^ marsRover moveWest.! !


!MarsRoverOrientationWest methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:17:14'!
rotateLeft
	^ marsRover rotateToSouth.! !

!MarsRoverOrientationWest methodsFor: 'rotation' stamp: 'kw 5/13/2019 13:19:20'!
rotateRight
	^ marsRover rotateToNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationWest class' category: #MarsRover!
MarsRoverOrientationWest class
	instanceVariableNames: ''!

!MarsRoverOrientationWest class methodsFor: 'as yet unclassified' stamp: 'kw 5/13/2019 12:15:06'!
isFor: aMarsRover
	^ aMarsRover orientation = #West.! !
