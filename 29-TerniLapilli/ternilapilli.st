!classDefinition: #TerniLapilliTest category: #ternilapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 10:58:53'!
test00EmptyBoardHasNotEnded
	| terniLapilli1 |
	
	terniLapilli1 := TerniLapilli new.
	self assert: terniLapilli1 hasEnded not.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 11:18:14'!
test01PutXInValidPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	
	
	
	self assert: (aTerniLapilli has: 'X' in: 1@1).! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 17:47:39'!
test02CannotPutXInNegativeFirstPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	self should: [aTerniLapilli putX: -1@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	
	
	self assert: aTerniLapilli isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:17:58'!
test03CannotPutXInGreaterThanTwoFirstPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	self should: [aTerniLapilli putX: 3@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	
	
	self assert: aTerniLapilli isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:25:13'!
test04CannotPutXInNegativeSecondPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	self should: [aTerniLapilli putX: 1@-1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	
	
	self assert: aTerniLapilli isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:25:40'!
test05CannotPutXInGreaterThanTwoSecondPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	self should: [aTerniLapilli putX: 1@3.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	
	
	self assert: aTerniLapilli isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 17:59:03'!
test06PutOInValidPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.

	aTerniLapilli putO: 1@1.
	
	self assert: aTerniLapilli isEmpty not.
	self assert: (aTerniLapilli has: 'X' in: 0@1).
	self assert: (aTerniLapilli has: 'O' in: 1@1).

	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:55:16'!
test07CannotPutOInNegativeFirstPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.

	self should: [aTerniLapilli putO: -1@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:55:24'!
test08CannotPutOInGreaterThanTwoFirstPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	self should: [aTerniLapilli putO: 3@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:55:29'!
test09CannotPutOInNegativeSecondPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	self should: [aTerniLapilli putO: 1@-1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:55:34'!
test10CannotPutOInGreaterThanTwoSecondPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	self should: [aTerniLapilli putO: 1@3.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidPositionError].
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:56:39'!
test11FirstPlayXAndIsOTurnAndHasNotEnded
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	
	self assert: aTerniLapilli isEmpty not.
	self assert: aTerniLapilli  hasEnded not.
	self assert: aTerniLapilli isOTurn.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:14:39'!
test12CannotPutOWhenItsNotOTurn
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	
	self should: [aTerniLapilli putO: 1@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli notYourTurnError].
	
	self assert: aTerniLapilli isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/23/2019 19:57:39'!
test13FirstPlayXThenOAndIsXTurnAndHasNotEnded
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 1@2.

	self assert: aTerniLapilli  hasEnded not.
	self assert: aTerniLapilli isXTurn.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:14:57'!
test14CannotPutXWhenIsNotXTurn
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	self should: [aTerniLapilli putX: 1@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli notYourTurnError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:07:58'!
test15CannotPutAnXWhereInAnOccupiedSlot
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 1@1.

	self should: [aTerniLapilli putX: 0@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli positionAlreadyTakenError ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:10:06'!
test16CannotPutAnOWhereInAnOccupiedSlot
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 1@1.
	aTerniLapilli putX: 2@2.

	self should: [aTerniLapilli putO: 0@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli positionAlreadyTakenError ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 18:47:02'!
test17XWinsHoriontalTop
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@0.
	aTerniLapilli putO: 1@1.
	aTerniLapilli putX: 0@2.
	aTerniLapilli putO: 1@2.
	aTerniLapilli putX: 0@1.

	self assert: aTerniLapilli hasWonX.
	self assert: aTerniLapilli hasEnded.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:29:21'!
test18XWinsHoriontalMiddle
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@0.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 1@2.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 1@1.

	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:29:49'!
test19XWinsHoriontalBottom
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 2@0.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@1.

	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/25/2019 18:30:33'!
test20XWinsVertical
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@0.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 2@0.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 1@0.

	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 18:32:18'!
test21XWinsPositiveDiagonal
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@0.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.

	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 18:38:13'!
test22XWinsNegativeDiagonal
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@2.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 2@1.
	aTerniLapilli putX: 2@0.

	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 18:43:34'!
test23OWins
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 2@1.
	aTerniLapilli putO: 0@2.
	
	self assert: aTerniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 19:04:40'!
test24CannotPutWhenOWon
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 2@1.
	aTerniLapilli putO: 0@2.

	self should: [aTerniLapilli putX: 2@0.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli gameHasEndedAndOWonError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 19:04:33'!
test25CannotPutWhenXWon
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 0@0.


	self should: [aTerniLapilli putO: 2@0.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli gameHasEndedAndXWonError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 19:37:09'!
test26CannotPutAfter6thTurn
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.


	self should: [aTerniLapilli putX: 2@1.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli cannotPutAfter6thTurnError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 20:30:10'!
test27CannotMoveXFromInvalidPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.


	self should: [aTerniLapilli moveXFrom: -1@1 to: 2@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidFromPositionError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 20:30:03'!
test28CannotMoveOFromInvalidPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.


	self should: [aTerniLapilli moveXFrom: -1@1 to: 2@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidFromPositionError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 19:36:13'!
test29CannotMoveBefore7thTurn
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 2@0.


	self should: [aTerniLapilli moveXFrom: -1@1 to: 2@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli cannotMoveBefore7thTurn.].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 19:45:50'!
test30CannotMoveWhenGameIsOver
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@1.
	aTerniLapilli putX: 0@0.


	self should: [aTerniLapilli moveOFrom: 0@1 to: 2@0.] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli gameHasEndedAndXWonError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 22:01:05'!
test31BisCannotMoveToInvalidPositionNonAdyacent
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 0@0.
	aTerniLapilli putO: 1@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 1@1.
	aTerniLapilli putX: 1@2.
	aTerniLapilli putO: 2@0.

	self should: [aTerniLapilli moveXFrom: 0@0 to: 2@2] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidToPositionErrorNonAdyacent ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 20:32:47'!
test31CannotMoveToInvalidPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.


	self should: [aTerniLapilli moveXFrom: 1@1 to: 5@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidToPositionError ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 20:44:22'!
test32MoveAndWin
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.


	aTerniLapilli moveXFrom: 2@2 to: 2@1.
	self assert: aTerniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 22:22:30'!
test33CannotMoveIfItsNotYourPiece
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.

	self should: [aTerniLapilli moveXFrom: 0@0 to: 1@0] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli cannotMoveIfItsNotYourPieceError ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 20:58:22'!
test34CannotMoveIfItsNotYourTurn
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.

	self should: [aTerniLapilli moveOFrom: 2@0 to: 2@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli notYourTurnError ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'CK 5/26/2019 22:00:12'!
test35CannotMoveToANonEmptyPosition
	| aTerniLapilli |
	
	aTerniLapilli := TerniLapilli new.
	aTerniLapilli putX: 1@1.
	aTerniLapilli putO: 0@2.
	aTerniLapilli putX: 2@2.
	aTerniLapilli putO: 0@0.
	aTerniLapilli putX: 0@1.
	aTerniLapilli putO: 2@0.
	
	self should: [aTerniLapilli moveXFrom: 2@2  to: 1@1] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli positionAlreadyTakenError ].
! !


!classDefinition: #TerniLapilli category: #ternilapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board turn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/26/2019 21:38:21'!
distanceBetween: aPosition and: anotherPosition
		^ ((aPosition x - anotherPosition x) abs) max:  ((aPosition y - anotherPosition y) abs).

! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/26/2019 18:35:12'!
getPieceAt: aPosition
	^ (board at: (aPosition x)) at: (aPosition y).! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/25/2019 17:53:06'!
has: aPiece in: aPosition
	^ ((board at: aPosition x + 1) at: aPosition y + 1) = aPiece.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'kw 5/27/2019 13:40:30'!
hasEnded
	^ self hasWonX or:[self hasWonO].! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/25/2019 17:57:11'!
isEmpty
	board do: [:aRow|
		aRow do: [:aCell | (aCell = '') ifFalse: [^ false]]
		].
	^ true.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/25/2019 18:06:24'!
isEmptyIn: aPosition
	^ ((board at: aPosition x + 1) at: aPosition y + 1) isEmpty! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/24/2019 20:45:32'!
isOTurn
	^ turn odd.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/26/2019 22:12:37'!
isValidPosition: aPosition
	^ (aPosition x < 0 or: [aPosition x > 2] or: (aPosition y < 0 or: [aPosition y > 2])) not.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/24/2019 20:45:39'!
isXTurn
	^ turn even.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/26/2019 19:13:23'!
turn
	^ turn.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'CK 5/26/2019 21:37:55'!
validMovement: aFromPosition to: aToPosition
	^ (self distanceBetween: aFromPosition and: aToPosition ) = 1! !


!TerniLapilli methodsFor: 'private' stamp: 'kw 5/27/2019 13:45:56'!
hasWon: aPieceType
	
	(board anySatisfy: [:row | ((row count: [:position| position =aPieceType])=3)]) ifTrue: [^true].
	
	1 to: 3  do: [:x|(board  allSatisfy: [:row | (row at: x )= aPieceType]) ifTrue: [^true]].

	(((self getPieceAt: 1@1) = aPieceType ) and: ((self getPieceAt: 2@2) = aPieceType ) and: ((self getPieceAt: 3@3) = aPieceType ) ) ifTrue: [ ^true ].
	
	(((self getPieceAt: 1@3) = aPieceType ) and: ((self getPieceAt: 2@2) = aPieceType ) and: ((self getPieceAt: 3@1) = aPieceType ) ) ifTrue: [ ^true ].


	
	^false! !

!TerniLapilli methodsFor: 'private' stamp: 'CK 5/26/2019 18:45:23'!
hasWonO
	^ self hasWon: 'O'.! !

!TerniLapilli methodsFor: 'private' stamp: 'CK 5/26/2019 18:45:37'!
hasWonX
	^ self hasWon: 'X'! !

!TerniLapilli methodsFor: 'private' stamp: 'CK 5/24/2019 20:56:04'!
increaseTurn
	turn _ turn + 1.! !

!TerniLapilli methodsFor: 'private' stamp: 'CK 5/25/2019 10:58:00'!
initialize
	board:=Array with:( Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '') with: (Array with: '' with: '' with: '').
	turn := 0.! !

!TerniLapilli methodsFor: 'private' stamp: 'CK 5/24/2019 21:16:26'!
state
	^ TerniLapilliState for: self.! !


!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/26/2019 22:21:36'!
move: aPiece from: anOriginPosition to: aDestinationPostion
	(self isValidPosition: anOriginPosition ) ifFalse: [^ self error: TerniLapilli invalidFromPositionError .].
	(self isValidPosition: aDestinationPostion ) ifFalse: [^ self error: TerniLapilli invalidToPositionError .].
	(self isEmptyIn: aDestinationPostion ) ifFalse:[^ self error: TerniLapilli positionAlreadyTakenError ].
	(self validMovement: anOriginPosition to: aDestinationPostion ) ifFalse: [^ self error: TerniLapilli invalidToPositionErrorNonAdyacent ].


		
	(self has: aPiece in: anOriginPosition ) ifFalse: [^ self error: TerniLapilli cannotMoveIfItsNotYourPieceError ].

	(board at: (aDestinationPostion x+1)) at: (aDestinationPostion y+1) put: aPiece.
	! !

!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/26/2019 19:26:26'!
moveOFrom: originPoint to: destinationPoint
	self state moveOFrom: originPoint to: destinationPoint.! !

!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/26/2019 19:26:15'!
moveXFrom: originPoint to: destinationPoint
	self state moveXFrom: originPoint to: destinationPoint.! !

!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/24/2019 21:25:06'!
putO: aPoint
	self state putO: aPoint.! !

!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/26/2019 22:04:52'!
putPiece: aPiece in: aPosition
	(self isValidPosition: aPosition ) ifFalse: [^ self error: TerniLapilli invalidPositionError ].
	(self isEmptyIn: aPosition ) ifFalse: [^ self error: TerniLapilli positionAlreadyTakenError ].
	(board at: (aPosition x + 1) )at: (aPosition y + 1 ) put: aPiece.
! !

!TerniLapilli methodsFor: 'playing' stamp: 'CK 5/24/2019 21:25:21'!
putX: aPoint
	self state putX: aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #ternilapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:36:34'!
cannotMoveBefore7thTurn
	^ 'Cannot move before 7th Turn. Must move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 20:49:54'!
cannotMoveIfItsNotYourPieceError
	^ 'Cant move something thats not yours/is empty'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:39:15'!
cannotPutAfter6TurnError
	^ 'Cant put after 6 turns. Must move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:37:47'!
cannotPutAfter6thTurnError
	^ 'Cant put after 6 turns. Must move'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:00:33'!
gameHasEndedAndOWonError
	^ 'Game is already over and O won'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:00:25'!
gameHasEndedAndXWonError
	^ 'Game is already over and X won'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:25:21'!
invalidFromPositionError
	^ 'Your from position is invalid'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 21:26:59'!
invalidMovement
	^ 'Movement was invalid'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/23/2019 19:13:49'!
invalidPositionError
	^ 'Position is invalid'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 20:33:00'!
invalidToPositionError
	^ 'Your to position is invalid'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 22:02:15'!
invalidToPositionErrorNonAdyacent
	^ 'Movement is non adyacent'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/23/2019 19:44:53'!
notYourTurnError
	^ 'Not your turn error'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'CK 5/23/2019 20:00:58'!
positionAlreadyTakenError
	^ 'Position is already taken'! !


!classDefinition: #TerniLapilliState category: #ternilapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!TerniLapilliState methodsFor: 'initialize' stamp: 'CK 5/24/2019 21:19:46'!
initializeFor: aTerniLapilli

	game := aTerniLapilli ! !


!TerniLapilliState methodsFor: 'playing' stamp: 'CK 5/26/2019 19:26:41'!
moveOFrom: originPoint to: destinationPoint
	self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'playing' stamp: 'CK 5/26/2019 19:26:35'!
moveXFrom: originPoint to: destinationPoint
	self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'playing' stamp: 'CK 5/24/2019 20:51:08'!
putO: aPosition
	self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'playing' stamp: 'CK 5/24/2019 20:51:04'!
putX: aPosition
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #ternilapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'CK 5/24/2019 21:19:09'!
for: aTerniLapilli 
	
	^ self subclasses 
		detect: [:aStateClass | aStateClass isFor: aTerniLapilli ]
		ifFound: [:aStateClass | aStateClass newFor: aTerniLapilli ]
		ifNone: [ self error: 'No state for terni lapilli' ]! !

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'CK 5/24/2019 21:05:44'!
isFor: aGame
	^ self subclassResponsibility.! !

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'CK 5/24/2019 21:19:22'!
newFor: aTerniLapilli

	^ self new initializeFor: aTerniLapilli! !


!classDefinition: #PlayingO category: #ternilapilli!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!PlayingO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:41:19'!
moveOFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli cannotMoveBefore7thTurn .! !

!PlayingO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:41:12'!
moveXFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli cannotMoveBefore7thTurn .! !

!PlayingO methodsFor: 'playing' stamp: 'CK 5/26/2019 22:05:06'!
putO: aPoint


	game putPiece: 'O' in: aPoint.
	game increaseTurn.! !

!PlayingO methodsFor: 'playing' stamp: 'CK 5/24/2019 21:20:54'!
putX: aPoint
	^ game error: TerniLapilli notYourTurnError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #ternilapilli!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:13:55'!
isFor: aGame
	^ aGame isOTurn and: (aGame hasEnded not) and: (aGame turn < 6).! !


!classDefinition: #PlayingX category: #ternilapilli!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!PlayingX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:41:26'!
moveOFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli cannotMoveBefore7thTurn .! !

!PlayingX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:41:29'!
moveXFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli cannotMoveBefore7thTurn .! !

!PlayingX methodsFor: 'playing' stamp: 'CK 5/24/2019 21:21:48'!
putO: aPoint
	^ game error: TerniLapilli notYourTurnError! !

!PlayingX methodsFor: 'playing' stamp: 'kw 5/27/2019 13:55:55'!
putX: aPoint

	game putPiece: 'X' in: aPoint.
	game increaseTurn.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #ternilapilli!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:13:44'!
isFor: aGame
	^ aGame isXTurn and: (aGame hasEnded not) and: (aGame turn < 6).! !


!classDefinition: #SlidingO category: #ternilapilli!
TerniLapilliState subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!SlidingO methodsFor: 'playing' stamp: 'CK 5/26/2019 22:22:42'!
moveOFrom: originPoint to: destinationPoint

	game move: 'O' from: originPoint to: destinationPoint.	

	game increaseTurn.

! !

!SlidingO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:28:30'!
moveXFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli notYourTurnError.! !

!SlidingO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:39:45'!
putO: aPoint
	^ game error: TerniLapilli cannotPutAfter6thTurnError .! !

!SlidingO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:40:02'!
putX: aPoint
	^ game error: TerniLapilli cannotPutAfter6thTurnError .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #ternilapilli!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:16:03'!
isFor: aGame
	^ aGame isOTurn and: (aGame hasEnded not) and: (aGame turn >= 6).! !


!classDefinition: #SlidingX category: #ternilapilli!
TerniLapilliState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!SlidingX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:34:40'!
moveOFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli notYourTurnError.! !

!SlidingX methodsFor: 'playing' stamp: 'CK 5/26/2019 22:22:49'!
moveXFrom: originPoint to: destinationPoint
	game move: 'X' from: originPoint to: destinationPoint.	
	game increaseTurn.
! !

!SlidingX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:39:55'!
putO: aPoint
	^ game error: TerniLapilli cannotPutAfter6thTurnError .! !

!SlidingX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:39:51'!
putX: aPoint
	^ game error: TerniLapilli cannotPutAfter6thTurnError .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #ternilapilli!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:15:58'!
isFor: aGame
	^ aGame isXTurn and: (aGame hasEnded not) and: (aGame turn >= 6).! !


!classDefinition: #WonO category: #ternilapilli!
TerniLapilliState subclass: #WonO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!WonO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:46:19'!
moveOFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli gameHasEndedAndOWonError .! !

!WonO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:46:21'!
moveXFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli gameHasEndedAndOWonError .! !

!WonO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:01:24'!
putO: aPoint
	^ game error: TerniLapilli gameHasEndedAndXWonError.! !

!WonO methodsFor: 'playing' stamp: 'CK 5/26/2019 19:01:17'!
putX: aPoint
	^ game error: TerniLapilli gameHasEndedAndOWonError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WonO class' category: #ternilapilli!
WonO class
	instanceVariableNames: ''!

!WonO class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 19:01:38'!
isFor: aTerniLapilli
	^ aTerniLapilli hasWonO.! !


!classDefinition: #WonX category: #ternilapilli!
TerniLapilliState subclass: #WonX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ternilapilli'!

!WonX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:46:38'!
moveOFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli gameHasEndedAndXWonError .! !

!WonX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:46:36'!
moveXFrom: originPoint to: destinationPoint
	^ game error: TerniLapilli gameHasEndedAndXWonError .! !

!WonX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:00:02'!
putO: aPoint
	^ game error: TerniLapilli gameHasEndedAndXWonError.! !

!WonX methodsFor: 'playing' stamp: 'CK 5/26/2019 19:00:08'!
putX: aPoint
	^ game error: TerniLapilli gameHasEndedAndXWonError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WonX class' category: #ternilapilli!
WonX class
	instanceVariableNames: ''!

!WonX class methodsFor: 'as yet unclassified' stamp: 'CK 5/26/2019 18:59:08'!
isFor: aTerniLapilli
	^ aTerniLapilli hasWonX.! !
