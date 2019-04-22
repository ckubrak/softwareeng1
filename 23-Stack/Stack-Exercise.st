!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'CK 4/18/2019 16:20:21'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptySentenceCollection oneSentenceCollection twoSentenceCollection prefixCammelCase prefixLowerCase prefixUpperCase sentenceFinderByPrefixNoSentences sentenceFinderByPrefixOneSentence sentenceFinderByPrefixTwoSentences prefixNonExistent notReallyaPrefix sentenceFinderByPrefixMultipleSentence multilpeSentenceCollection multilpeSentenceCollectionexpected'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 20:13:49'!
setUp
	
	emptySentenceCollection:= OOStack new.
	oneSentenceCollection:= OOStack new.  
	oneSentenceCollection push: 'Winter is here'.
	multilpeSentenceCollection:= OOStack new.
	multilpeSentenceCollection push: 'Winter is here'.
	multilpeSentenceCollection push: 'Will.I.Am'.
	multilpeSentenceCollection push: 'The north remembers'.
	multilpeSentenceCollectionexpected := OOStack new.
	multilpeSentenceCollectionexpected push: 'Winter is here'.
	multilpeSentenceCollectionexpected push: 'Will.I.Am'.
	multilpeSentenceCollectionexpected push: 'The north remembers'.
	prefixNonExistent:= 'willy'.
	notReallyaPrefix:= 'is'.
	prefixLowerCase:= 'wi'.
	prefixUpperCase:= 'Wi'.
	prefixCammelCase:= 'wI'.
	
	sentenceFinderByPrefixNoSentences:= (SentenceFinderByPrefix new) initializeWith: emptySentenceCollection .
	sentenceFinderByPrefixOneSentence:= (SentenceFinderByPrefix new)  initializeWith: oneSentenceCollection .
	
	sentenceFinderByPrefixMultipleSentence:= (SentenceFinderByPrefix new)  initializeWith: multilpeSentenceCollection .


! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 15:34:26'!
test01FindPrefixInEmptyStack
	self assert: (sentenceFinderByPrefixNoSentences find: prefixUpperCase) isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CK 4/20/2019 18:27:46'!
test02FindNonExistentPrefix
	self assert: (sentenceFinderByPrefixOneSentence find: prefixNonExistent ) isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 15:38:06'!
test03FindExistentPrefix
	|resultExpected|
	resultExpected := OrderedCollection with: 'Winter is here'.
	self assert: (sentenceFinderByPrefixOneSentence find: prefixUpperCase) = resultExpected.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CK 4/20/2019 18:27:59'!
test04FindAlmostExistingPrefixButFailsCaseSensitive
	self assert: (sentenceFinderByPrefixOneSentence find: prefixLowerCase ) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CK 4/20/2019 18:29:06'!
test05PrefixExistsButItsNotAPrefix
	self assert: (sentenceFinderByPrefixOneSentence find: notReallyaPrefix ) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 17:47:57'!
test06MultipleSentecesMatchPrefix

	|result|
	result := OrderedCollection new.
	result add: 'Will.I.Am'.
	result add:'Winter is here'.
	self assert: (sentenceFinderByPrefixMultipleSentence find: prefixUpperCase) = result.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 19:54:37'!
test07SentenceStackRemainUnaltered

	| resultStack |
	resultStack := sentenceFinderByPrefixMultipleSentence find: prefixUpperCase.
	self assert: (sentenceFinderByPrefixMultipleSentence isEqualToMyStack: multilpeSentenceCollectionexpected)! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 22:47:57'!
test08FindPrefixInEmptyStackNotModifiedStack
	|stackExpected|
	stackExpected := OOStack  new.
	self assert: (sentenceFinderByPrefixNoSentences find: prefixUpperCase) isEmpty.
	self assert: (sentenceFinderByPrefixNoSentences isEqualToMyStack: stackExpected).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 22:20:44'!
test09CantSearchAnEmptyPrefix
	| emptyPrefix |
	emptyPrefix:= ''.
	self 
		should: [ sentenceFinderByPrefixMultipleSentence find: emptyPrefix ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix cannotSearchWithEmptyPrefix ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'kw 4/21/2019 22:20:19'!
test10CantSearchAnInvalidPrefix
	| invalidPrefix |
	invalidPrefix:= 'Win '.
	self 
		should: [ sentenceFinderByPrefixMultipleSentence find: invalidPrefix ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix cannotSearchWithInvalidPrefix ]
	! !


!classDefinition: #NameOfSubclass category: #'Stack-Exercise'!
Object subclass: #NameOfSubclass
	instanceVariableNames: 'sentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'kw 4/21/2019 20:06:30'!
= anOtherStack
	^anOtherStack sameContents: content.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 15:42:13'!
initialize
	content := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:30:21'!
isEmpty
	^ content isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:28:59'!
pop
	^ (OOStackRegulator initializeWith: self) pop.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 15:49:02'!
push: aStackableElement
	content addFirst: aStackableElement .
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:12:16'!
safePop
	|topElement|
	
	topElement := content first.
	content removeFirst.
	^ topElement .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:28:33'!
safeTop

	^ content first.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'kw 4/21/2019 20:07:10'!
sameContents: aCollection
	^aCollection  = content.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:30:07'!
size
	^ content size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:29:11'!
top
	^ (OOStackRegulator initializeWith: self) top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackRegulator category: #'Stack-Exercise'!
Object subclass: #OOStackRegulator
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackRegulator methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:01:33'!
initializeStack: aStack
	stack := aStack .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackRegulator class' category: #'Stack-Exercise'!
OOStackRegulator class
	instanceVariableNames: ''!

!OOStackRegulator class methodsFor: 'error descriptions' stamp: 'CK 4/18/2019 16:01:06'!
initializeWith: aStack
	|regulatorClass|
	
	regulatorClass := self subclasses detect: [:aRegulatorClass | aRegulatorClass isFor: aStack].
	^ regulatorClass new initializeStack: aStack.
	! !

!OOStackRegulator class methodsFor: 'error descriptions' stamp: 'CK 4/18/2019 15:37:36'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOEmptyStackRegulator category: #'Stack-Exercise'!
OOStackRegulator subclass: #OOEmptyStackRegulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackRegulator methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:06:23'!
pop
	^ self error: OOStack stackEmptyErrorDescription.! !

!OOEmptyStackRegulator methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:27:39'!
top
	^ self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackRegulator class' category: #'Stack-Exercise'!
OOEmptyStackRegulator class
	instanceVariableNames: ''!

!OOEmptyStackRegulator class methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 15:53:54'!
isFor: aStack
	^ aStack isEmpty ! !


!classDefinition: #OONonEmptyStackRegulator category: #'Stack-Exercise'!
OOStackRegulator subclass: #OONonEmptyStackRegulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONonEmptyStackRegulator methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:07:40'!
pop
	^ stack safePop.! !

!OONonEmptyStackRegulator methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:27:55'!
top
	^ stack safeTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONonEmptyStackRegulator class' category: #'Stack-Exercise'!
OONonEmptyStackRegulator class
	instanceVariableNames: ''!

!OONonEmptyStackRegulator class methodsFor: 'as yet unclassified' stamp: 'CK 4/18/2019 16:25:10'!
isFor: aStack
	^ aStack  isEmpty not.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'kw 4/21/2019 22:47:09'!
find: aPrefix
	|auxStack sentencesWithPrefix|
	auxStack:= OOStack  new.
	sentencesWithPrefix:= OrderedCollection new.
	aPrefix isEmptyOrNil ifTrue: [self error: SentenceFinderByPrefix cannotSearchWithEmptyPrefix].
	(aPrefix endsWith: ' ') ifTrue: [self error: SentenceFinderByPrefix cannotSearchWithInvalidPrefix ].

	1 to: stackSentences size do: [:x |
		auxStack push: stackSentences pop.
		(auxStack top beginsWith: aPrefix) ifTrue: [sentencesWithPrefix add: auxStack top.]
		].
	1 to: auxStack size do: 
		[:x | 
		stackSentences push: auxStack pop.
		].
	^ sentencesWithPrefix.
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'kw 4/21/2019 17:14:21'!
initializeWith: astackSentences
	stackSentences:= astackSentences .! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'kw 4/21/2019 19:54:14'!
isEqualToMyStack: anStack
	^stackSentences  = anStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'sentences'!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CK 4/21/2019 20:46:50'!
cannotSearchWithEmptyPrefix
	
	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CK 4/21/2019 20:47:59'!
cannotSearchWithInvalidPrefix
	
	^ 'Prefix is has spaces'! !
