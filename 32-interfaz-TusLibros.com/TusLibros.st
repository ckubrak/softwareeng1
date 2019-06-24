!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InterfaceTest category: #TusLibros!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'validUserDictionary users interface storeTestObjectsFactory validProduct invalidProduct debitBehavior validUser validUserPassword invalidUser invalidUserPassword'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:22:43'!
test01UserMustBeRegisteredToCreateCart
	self should: [interface createCartFor: invalidUser password: validUserPassword ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidUserOrPasswordError].
! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:23:00'!
test02UserMustBeRegisteredAndCorrectPasswordToCreateCart
	self should: [interface createCartFor: validUser password: invalidUserPassword ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidUserOrPasswordError].
! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:23:20'!
test03NewCartIsEmpty
	| id |
	id := interface createCartFor: validUser password: validUserPassword .
	self assert: (interface cartIdIsEmpty: id).! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:23:47'!
test04CannotAccessNonExistenCartId
	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	self should: [self assert: (interface cartIdIsEmpty: id + 1)]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidCartId].
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:23:55'!
test05CartWithItemIsNotEmpty
	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct.
	
	self assert: ((interface cartIdIsEmpty: id) not)
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:24:00'!
test06CantAddToInvalidId
	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	self should: [interface add: 1 to: 0 of: validProduct.]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidCartId].	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:24:10'!
test07ItemsAddedToCartAreInTheCart
	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 2 to: id of: validProduct.
	
	self assert: (interface cart: id has: 2 of: validProduct).
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:24:29'!
test08CantCheckOutInvalidCart

	self should: 
	[interface 
		checkoutCart: 0
		fromUser: validUser 
		charging: storeTestObjectsFactory notExpiredCreditCard .]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidCartId ].
! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:24:48'!
test09CantCheckOutEmptyCart

	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	self should: 
	[interface 
		checkoutCart: id
		fromUser: validUser 
		charging: storeTestObjectsFactory notExpiredCreditCard .]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface cartIsEmptyError ].
! !

!InterfaceTest methodsFor: 'testing' stamp: 'kw 6/24/2019 11:37:21'!
test10CheckOutValidCartAndTotalIsoCorrect
	| id cost |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 2 to: id of: validProduct.

	cost := interface 
		checkoutCart: id
		fromUser: validUser
		charging: storeTestObjectsFactory notExpiredCreditCard .
	
	self assert: cost = (storeTestObjectsFactory itemSellByTheStorePrice * 2).
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 18:29:58'!
test11CantListPurchaseNonExistentUser

	self should: [interface listPurchasesUser: invalidUser password: validUserPassword ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface invalidUserOrPasswordError ].
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 19:07:56'!
test12ListPurchasesIsEmptyIfUserDidntMakePurchases
	| purchases |
	
	purchases := interface listPurchasesUser: validUser password: validUserPassword .
	self assert: (purchases isEmpty).
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'CK 6/23/2019 19:10:48'!
test13ListPurchasesForValidUserThatMadeAPurchase
	| purchases id |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct.

	interface 
		checkoutCart: id
		fromUser: validUser
		charging: storeTestObjectsFactory notExpiredCreditCard .
	
	purchases := interface listPurchasesUser: validUser password: validUserPassword .
	self assert: (purchases isEmpty not).
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'kw 6/24/2019 15:35:40'!
test14WhenPassLessThan30MinutesThenTheCardIsValid
	| id |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct.
	
	self assert: (interface isValidCart: id withTime: DateAndTime now).
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'kw 6/24/2019 15:35:50'!
test15WhenPassMoreThan30MinutesThenTheCardIsInvalid
	| id aTime|
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct.
	aTime _ DateAndTime now + 31 minutes.
	self assert: (interface isValidCart: id withTime: aTime)not.
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'kw 6/24/2019 15:44:58'!
test16WhenItRefreshDownBefore30MinutesTheCartIsStillValid
	| id aTime aTimeRefresh |
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct.
	aTime _ DateAndTime now + 31 minutes.
	 aTimeRefresh _ DateAndTime now + 21 minutes.
	interface 
		checkoutCart: id
		fromUser: validUser
		charging: storeTestObjectsFactory notExpiredCreditCard
		withTime: aTimeRefresh.
	self assert: (interface isValidCart: id withTime: aTime).
	
	! !

!InterfaceTest methodsFor: 'testing' stamp: 'kw 6/24/2019 15:48:12'!
test17WhenItRefreshDownAfter30MinutesThenGenerateInterfaceCartTimeOutError
	| id aTime|
	aTime _ DateAndTime now + 31 minutes.
	id := interface createCartFor: validUser password: validUserPassword.
	interface add: 1 to: id of: validProduct withTime: DateAndTime now.
	self should: [
		interface 
		checkoutCart: id
		fromUser: validUser
		charging: storeTestObjectsFactory notExpiredCreditCard
		withTime: aTime.
		] 
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Interface cartTimeOut].
	self assert: (interface isValidCart: id withTime: aTime)not.
	
	! !


!InterfaceTest methodsFor: 'setup' stamp: 'CK 6/23/2019 18:22:24'!
setUp
	| userDatabase |
	invalidUser := 'notuser'.
	validUser := 'user'.
	validUserPassword := 'pass'.
	invalidUserPassword := 'notpass'.
	userDatabase := Dictionary new.
	userDatabase at: validUser put: validUserPassword.
	storeTestObjectsFactory := StoreTestObjectsFactory new.

	interface := Interface users: userDatabase catalog: storeTestObjectsFactory defaultCatalog merchant: self.
	validProduct := storeTestObjectsFactory itemSellByTheStore.
	invalidProduct := storeTestObjectsFactory itemNotSellByTheStore.

	debitBehavior := [ :anAmount :aCreditCard | ]

	 ! !


!InterfaceTest methodsFor: 'merchant prossesor controler' stamp: 'CK 6/23/2019 17:47:39'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard 
	 ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !

!Cart methodsFor: 'testing' stamp: 'CK 6/23/2019 19:03:57'!
list

	^items copy ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #IdsUpdater category: #TusLibros!
Object subclass: #IdsUpdater
	instanceVariableNames: 'validityOfIds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!IdsUpdater methodsFor: 'initialization' stamp: 'kw 6/24/2019 13:28:20'!
initialize
	validityOfIds _ Dictionary new.! !

!IdsUpdater methodsFor: 'initialization' stamp: 'kw 6/24/2019 15:11:30'!
initializeLifeTime: id withTime: aTime
	self validRefreshId:id withTime: aTime.
	validityOfIds at: id put: aTime.
	! !


!IdsUpdater methodsFor: 'accessing' stamp: 'kw 6/24/2019 13:26:40'!
at: id
	^validityOfIds at:id.! !

!IdsUpdater methodsFor: 'accessing' stamp: 'kw 6/24/2019 15:45:57'!
validRefreshId:id withTime: aTime
	|timeLimit presentBlock |
	timeLimit _ 30 minutes.
	presentBlock _ [:initialTime| (initialTime+ timeLimit > aTime) ifFalse: [^self  error: Interface cartTimeOut]].
	validityOfIds at: id ifPresent: presentBlock.! !


!classDefinition: #Interface category: #TusLibros!
Object subclass: #Interface
	instanceVariableNames: 'users lastId catalog carts merchant salesbook cartsIdByUser validIds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'accessing' stamp: 'CK 6/23/2019 17:48:30'!
cart: aCartId has: anAmmount of: aProduct 
	^ ((self cartId: aCartId) occurrencesOf: aProduct) = anAmmount .! !

!Interface methodsFor: 'accessing' stamp: 'CK 6/23/2019 11:22:47'!
cartId: anId
	^ carts at: anId ifAbsent: [ self error: self class  invalidCartId ]! !

!Interface methodsFor: 'accessing' stamp: 'CK 6/23/2019 11:24:24'!
cartIdIsEmpty: aCartId

	^ (self cartId: aCartId) isEmpty.! !

!Interface methodsFor: 'accessing' stamp: 'kw 6/24/2019 15:13:27'!
checkoutCart: aCartId fromUser: aUser charging: aPayingMethod
	| cart cashier aDate |
	cart := self cartId: aCartId.
	self assertIsNotEmpty: cart.
	aDate := Date today.
	cashier := Cashier toCheckout: cart charging: aPayingMethod throught: merchant on: aDate registeringOn: salesbook.
	(cartsIdByUser at: aUser) addAll: ( ( self cartId: aCartId ) list ).	


	^ cashier checkOut.
 
	! !

!Interface methodsFor: 'accessing' stamp: 'kw 6/24/2019 15:13:18'!
checkoutCart: aCartId fromUser: aUser charging: aPayingMethod withTime: aTime
	| cart cashier aDate |
	cart := self cartId: aCartId.
	self assertIsNotEmpty: cart.
	aDate := Date today.
	validIds initializeLifeTime: aCartId withTime: aTime.
	cashier := Cashier toCheckout: cart charging: aPayingMethod throught: merchant on: aDate registeringOn: salesbook.
	(cartsIdByUser at: aUser) addAll: ( ( self cartId: aCartId ) list ).	


	^ cashier checkOut.
 
	! !

!Interface methodsFor: 'accessing' stamp: 'kw 6/24/2019 15:27:21'!
isValidCart: id withTime: aTime
	^(validIds at:id) + 30 minutes > aTime.! !

!Interface methodsFor: 'accessing' stamp: 'CK 6/23/2019 19:16:50'!
listPurchasesUser: aUser  password: aPassword
	self assertValidUser: aUser.
	self assertValidUser: aUser andPassword: aPassword.
	
	^ cartsIdByUser at: aUser.
	
	! !


!Interface methodsFor: 'initialization' stamp: 'kw 6/24/2019 13:31:11'!
initialize
	validIds _ IdsUpdater new.! !

!Interface methodsFor: 'initialization' stamp: 'CK 6/22/2019 22:15:19'!
initializeWithUsers: aDictionary
	users := aDictionary.
	lastId := 0.! !

!Interface methodsFor: 'initialization' stamp: 'kw 6/24/2019 13:29:40'!
initializeWithUsers: aDictionary catalog: aCatalog
	self initializeWithUsers: aDictionary.
	catalog := aCatalog.
	carts := Dictionary new.! !

!Interface methodsFor: 'initialization' stamp: 'kw 6/24/2019 13:30:15'!
initializeWithUsers: aDictionary catalog: aCatalog merchant: aMerchant
	self initializeWithUsers: aDictionary catalog: aCatalog.
	merchant := aMerchant.
	salesbook := OrderedCollection new.
	cartsIdByUser := Dictionary new.
	"self halt."
	users keys do: [ :aUser | cartsIdByUser at: aUser put: OrderedCollection new]! !


!Interface methodsFor: 'adding' stamp: 'CK 6/23/2019 11:40:11'!
add: anAmmount to: aCartId of: aProduct
	(self cartId: aCartId) add: anAmmount of: aProduct.! !

!Interface methodsFor: 'adding' stamp: 'kw 6/24/2019 15:18:35'!
add: anAmmount to: aCartId of: aProduct withTime: aTime
	validIds initializeLifeTime: aCartId withTime: aTime.
	(self cartId: aCartId) add: anAmmount of: aProduct.! !

!Interface methodsFor: 'adding' stamp: 'kw 6/24/2019 15:14:09'!
createCartFor: aUser password: aPassword
	self assertValidUser: aUser.
	self assertValidUser: aUser andPassword: aPassword.
	lastId _ lastId + 1.
	validIds initializeLifeTime: lastId withTime: DateAndTime now.
	carts at: lastId put: (Cart acceptingItemsOf: catalog).
	^ lastId .
	
		! !


!Interface methodsFor: 'exceptions' stamp: 'CK 6/23/2019 12:22:34'!
assertIsNotEmpty: aCart
	aCart isEmpty ifTrue: [^  self error: self class cartIsEmptyError .]! !

!Interface methodsFor: 'exceptions' stamp: 'CK 6/23/2019 18:12:52'!
assertValidUser: aUser.
	(users includesKey: aUser) ifFalse: [^  self error: self class  invalidUserOrPasswordError.].
	
	! !

!Interface methodsFor: 'exceptions' stamp: 'CK 6/23/2019 18:13:09'!
assertValidUser: aUser andPassword: aPassword.
	
	(users at: aUser) = aPassword ifFalse: [^  self error: self class  invalidUserOrPasswordError.].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: #TusLibros!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'as yet unclassified' stamp: 'CK 6/23/2019 12:10:36'!
cartIsEmptyError
	^ 'Cart is empty'! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'kw 6/24/2019 14:11:17'!
cartTimeOut
	^ 'Invalid refresh time of cart'! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'CK 6/23/2019 11:06:56'!
invalidCartId
	^ 'Invalid cart Id'! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'CK 6/22/2019 20:32:18'!
invalidUserOrPasswordError
	^ 'Inavlid username or password'! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'CK 6/22/2019 22:20:01'!
users: aDictionary catalog: aCatalog
	^ self new initializeWithUsers: aDictionary catalog: aCatalog.! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'CK 6/23/2019 17:28:54'!
users: aDictionary catalog: aCatalog merchant: aMerchant 
	^ self new initializeWithUsers: aDictionary catalog: aCatalog merchant: aMerchant .! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
