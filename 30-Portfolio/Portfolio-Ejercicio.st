!classDefinition: #PortfolioTransactionTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTransactionTest
	instanceVariableNames: 'accountWithinTransaction1 accountWithinTransaction2 accountWithTransaction1 accountWithTransaction2 emptySetTransactions setWithOneTransaction setWithOTwoTransaction portfolioWithOneAccount portfolioWithTwoAccount emptyPortfolio portfolioWithOneAccountTransaction portfolioWithTwoAccountOneTransaction portfolioWithTwoAccountTwoTransaction portfolioWithEmptyPortfolio account deposit withdraw portfolioWithOnePortfolio portfolioWithTwoPortfolio portfolioWithTwoRepeatAccount portfolioWithTwoRepeatPortfolio repeatPortfolioWithOneAccount account2 accountWithinAccount1 accountWithinAccount2 repeatPortfolioWithEmpty portfolioWithTwoDifferentPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:04:27'!
test01EmptyPortfolioHaveZeroPortfoliosAndZeroAccounts
	
	self assert: emptyPortfolio portfolios size = 0.
	self assert: emptyPortfolio accounts size = 0.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:05:07'!
test02PortfolioHaveOneAccountAndZeroPortfolios

	self assert: portfolioWithOneAccount accounts size = 1.
	self assert: portfolioWithOneAccount  portfolios size = 0.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:09:56'!
test03AnAccountAppearOnlyOnceInHisLevel
	self 
		should: [portfolioWithOneAccountTransaction addAccount: accountWithTransaction1.] 
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction accountExist].
	self assert: portfolioWithOneAccountTransaction accounts size = 1.
	self assert: portfolioWithOneAccountTransaction portfolios size = 0.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:10:08'!
test04AnPortfolioAppearOnlyOnceInHisLevel
	self 
		should: [portfolioWithOnePortfolio addPortfolio: portfolioWithOneAccount.] 
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction canNotContainTheSamePortfolio].
	self assert: portfolioWithOnePortfolio portfolios size = 1.
	self assert: portfolioWithOnePortfolio accounts size = 1.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:10:17'!
test05AnAccountAppearOnlyOnceWhenSeeInTheLowLevel
	self 
		should: [portfolioWithOnePortfolio addPortfolio: repeatPortfolioWithOneAccount.] 
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction accountExist ].
	self assert: portfolioWithOnePortfolio portfolios size = 1.
	self assert: portfolioWithOnePortfolio accounts size = 1.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 14:10:23'!
test06AnPortfolioAppearOnlyOnceWhenSeeInTheLowLevel
	self 
		should: [portfolioWithTwoPortfolio addPortfolio: emptyPortfolio .] 
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction canNotContainTheSamePortfolio ].
	self assert: portfolioWithTwoPortfolio portfolios size = 2.
	self assert: portfolioWithTwoPortfolio accounts size = 0.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 15:19:59'!
test07AnPortfolioAppearOnlyOnceWhenSeeInOtherBranch
	portfolioWithTwoPortfolio addPortfolio: repeatPortfolioWithEmpty.
	self 
		should: [repeatPortfolioWithEmpty addPortfolio: emptyPortfolio .]
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction canNotContainTheSamePortfolio ].
	self assert: portfolioWithTwoPortfolio portfolios size = 3.
	self assert: portfolioWithTwoPortfolio accounts size = 0.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 15:18:13'!
test08AnAccountAppearOnlyOnceWhenSeeInOtherBranch
	"portfolioWithTwoDifferentPortfolio contiene un portfolio vacio y un portfolio con una cuenta con transacción"
	self 
		should: [emptyPortfolio addAccount: accountWithTransaction1.]
		raise:  Error
		withExceptionDo: [:anError | self assert: anError messageText equals: PortfolioTransaction accountExist ].
	self assert: portfolioWithTwoDifferentPortfolio portfolios size = 2.
	self assert: portfolioWithTwoDifferentPortfolio accounts size = 1.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 15:15:13'!
test09BalanceWithEmptyPortfolioIsZero
	self assert: emptyPortfolio balance = 0.
	self assert: emptyPortfolio transactionsRegistered not.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 15:16:27'!
test10BalanceWithOneAccountInPortfolioIsBalanceOfAccount

	self assert: portfolioWithOneAccountTransaction balance = 100.
	self assert: portfolioWithOneAccountTransaction transactionsRegistered.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 11:39:53'!
test11BalanceWithOneEmptyAccountInPortfolioIsZero
	self assert: portfolioWithOneAccount balance = 0.
	self assert: portfolioWithOneAccount portfolios size = 0.
	self assert: portfolioWithOneAccount accounts size = 1.
	self assert: portfolioWithOneAccount transactionsRegistered not.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 11:40:17'!
test12BalanceWithOneNonEmptyAccountInPortfolioIsAccountBalance
	self assert: portfolioWithOneAccountTransaction balance = 100.
	self assert: portfolioWithOneAccountTransaction portfolios size = 0.
	self assert: portfolioWithOneAccountTransaction accounts size = 1.
	self assert: portfolioWithOneAccountTransaction transactionsRegistered.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 11:40:42'!
test13BalanceOfPortfolioWithEmptyPortfolioIsZero
	self assert: portfolioWithEmptyPortfolio balance = 0.
	self assert: portfolioWithEmptyPortfolio  portfolios size = 1.
	self assert: portfolioWithEmptyPortfolio  accounts size = 0.
	self assert: portfolioWithEmptyPortfolio transactionsRegistered not.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 11:41:11'!
test14BalanceOfPortfolioWithAnyChildrenHaveBalance
	self assert: portfolioWithTwoDifferentPortfolio balance = 100.
	self assert: portfolioWithTwoDifferentPortfolio  portfolios size = 2.
	self assert: portfolioWithTwoDifferentPortfolio  accounts size = 1.
	self assert: portfolioWithTwoDifferentPortfolio transactionsRegistered.! !

!PortfolioTransactionTest methodsFor: 'testing' stamp: 'kw 5/27/2019 15:16:14'!
test15BalanceOfPortfolioWithAllChildrenHaveAccountWithinTransactionIsZero
	self assert: portfolioWithOnePortfolio balance = 0.
	self assert: portfolioWithOnePortfolio transactionsRegistered not.! !


!PortfolioTransactionTest methodsFor: 'setup' stamp: 'kw 5/27/2019 12:19:04'!
setUp
	"accounts"
	account := ReceptiveAccount new.
	accountWithinAccount1 := ReceptiveAccount new.
	
	"account transactions"
	accountWithTransaction1 := ReceptiveAccount new.
	accountWithTransaction2 := ReceptiveAccount new.
	deposit :=  Deposit register: 100 on:accountWithTransaction1.
	withdraw := Withdraw register: 50 on:accountWithTransaction2.
	
	"portfolios de cuentas"
	emptyPortfolio := PortfolioTransaction new.
	portfolioWithOneAccount := PortfolioTransaction new.
	portfolioWithOneAccount addAccount: account.
	
	"portfolios de transactions"
	portfolioWithOneAccountTransaction := PortfolioTransaction new.
	portfolioWithOneAccountTransaction addAccount: accountWithTransaction1.
	
	"portfolios de porlfolios"
	portfolioWithEmptyPortfolio := PortfolioTransaction new.
	portfolioWithEmptyPortfolio addPortfolio: emptyPortfolio.
	
	"portfolios de porlfolios y cuentas"
	portfolioWithOnePortfolio := PortfolioTransaction new.
	portfolioWithOnePortfolio addPortfolio: portfolioWithOneAccount.
	portfolioWithTwoPortfolio := PortfolioTransaction new.
	portfolioWithTwoPortfolio addPortfolio: portfolioWithEmptyPortfolio .
	portfolioWithTwoDifferentPortfolio := PortfolioTransaction new.
	portfolioWithTwoDifferentPortfolio addPortfolio: portfolioWithOneAccountTransaction.
	portfolioWithTwoDifferentPortfolio addPortfolio: emptyPortfolio.
	
	"portfolio with repeat account"
	repeatPortfolioWithOneAccount := PortfolioTransaction new.
	repeatPortfolioWithEmpty := PortfolioTransaction new.
	repeatPortfolioWithOneAccount addAccount: account.
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'kw 5/24/2019 10:46:19'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'kw 5/24/2019 10:46:46'!
affectBalance: aBalance

	^aBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'kw 5/24/2019 10:48:30'!
affectBalance: aBalance

	^aBalance - value! !

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #PortfolioTransaction
	instanceVariableNames: 'portfolios accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTransaction methodsFor: 'accesing' stamp: 'kw 5/27/2019 14:23:14'!
accounts
	|totalOfAccounts|
	totalOfAccounts := OrderedCollection new.
	portfolios do:[:portfolio | totalOfAccounts addAllLast:portfolio accounts ].
	totalOfAccounts addAllLast: accounts.
	^totalOfAccounts.! !

!PortfolioTransaction methodsFor: 'accesing' stamp: 'kw 5/27/2019 14:31:12'!
balance
	|totalOfBalance|
	totalOfBalance := 0.
	(self accounts) do:[:account | totalOfBalance := (totalOfBalance + account balance). ].
	^totalOfBalance ! !

!PortfolioTransaction methodsFor: 'accesing' stamp: 'kw 5/27/2019 14:32:43'!
hasRegistered: aTtransaction

	self accounts do:[:account | 
		account transactions do:[:transaction | 
			(account hasRegistered: transaction) ifTrue:[^true]
			].
		].
	^false! !

!PortfolioTransaction methodsFor: 'accesing' stamp: 'ke 5/25/2019 15:43:05'!
portfolios
	|totalOfPortfolios|
	totalOfPortfolios := OrderedCollection new.
	portfolios do:[:portfolio | totalOfPortfolios addAllLast: portfolio portfolios].
	totalOfPortfolios addAllLast: portfolios.
	^totalOfPortfolios.! !

!PortfolioTransaction methodsFor: 'accesing' stamp: 'kw 5/27/2019 14:37:39'!
transactions
	|totalOfTransactions|
	totalOfTransactions := OrderedCollection new.
	self accounts do:[:account | totalOfTransactions addAllLast: account transactions].
	^totalOfTransactions.! !

!PortfolioTransaction methodsFor: 'accesing' stamp: 'kw 5/27/2019 14:37:51'!
transactionsRegistered

	self accounts do:[:account | 
		account transactions do:[:transaction | 
			(account hasRegistered: transaction) ifTrue:[^true]].
		].
	^false! !


!PortfolioTransaction methodsFor: 'adding' stamp: 'kw 5/27/2019 14:25:17'!
addAccount: anAccount 
	self ancesters do:[:ancester | 
		(ancester containAccount:anAccount) ifTrue:[self error: PortfolioTransaction accountExist.]
		].
	accounts add: anAccount.
	! !

!PortfolioTransaction methodsFor: 'adding' stamp: 'ke 5/25/2019 15:57:01'!
addParent: anPortfolio
	parents add: anPortfolio.! !

!PortfolioTransaction methodsFor: 'adding' stamp: 'kw 5/27/2019 14:27:41'!
addPortfolio: anPortfolio.
	(self = anPortfolio) 
	ifTrue:[self error: PortfolioTransaction canNotPortfolioContainSelf].
	(self ancesters)
		detect:[:ancester |ancester contain: anPortfolio]
		ifNone:[portfolios add: anPortfolio.anPortfolio addParent:self.].! !

!PortfolioTransaction methodsFor: 'adding' stamp: 'kw 5/27/2019 14:28:33'!
ancesters
	|totalOfAncesters|
	totalOfAncesters:= OrderedCollection new.
	(parents isEmpty) ifTrue: [totalOfAncesters add: self. ^totalOfAncesters.].
	parents do:[:parent | totalOfAncesters  addAllLast: parent ancesters.].
	^totalOfAncesters .! !


!PortfolioTransaction methodsFor: 'initialize' stamp: 'ke 5/25/2019 14:35:54'!
initialize
	portfolios  := OrderedCollection new.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!PortfolioTransaction methodsFor: 'comparing' stamp: 'kw 5/27/2019 14:00:22'!
contain: anPortfolio
	self = anPortfolio or:[portfolios do:[:portfolio | (portfolio = anPortfolio or:[portfolio contain: anPortfolio])
		ifTrue:[self error:PortfolioTransaction  canNotContainTheSamePortfolio.^true]].].
	anPortfolio accounts do:[:account | (accounts includes: account) 
		ifTrue:[self error:PortfolioTransaction accountExist .^true].].
	^false! !

!PortfolioTransaction methodsFor: 'comparing' stamp: 'ke 5/25/2019 17:04:02'!
containAccount: anAccount
	^(accounts includes: anAccount) or:[
		self portfolios do:[:portfolio | (portfolio containAccount:anAccount) ifTrue:[^true]].
		^false.
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTransaction class' category: #'Portfolio-Ejercicio'!
PortfolioTransaction class
	instanceVariableNames: ''!

!PortfolioTransaction class methodsFor: 'as yet unclassified' stamp: 'ke 5/25/2019 12:35:09'!
accountExist
	^'La cuenta ya pertenece al Portfolio'! !

!PortfolioTransaction class methodsFor: 'as yet unclassified' stamp: 'ke 5/25/2019 12:54:43'!
canNotContainTheSamePortfolio
	^'El portfolio que se intenta agregar existe'! !

!PortfolioTransaction class methodsFor: 'as yet unclassified' stamp: 'ke 5/25/2019 12:47:41'!
canNotPortfolioContainSelf
	^'El portfolio no puede contenerse'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'kw 5/24/2019 10:55:19'!
balance
	
	^transactions inject: 0 into:[ :aBalance :aTransaction | aTransaction affectBalance: aBalance].
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !
