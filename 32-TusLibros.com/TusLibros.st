!classDefinition: #CarritoTests category: #TusLibros!
TestCase subclass: #CarritoTests
	instanceVariableNames: 'libros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTests methodsFor: 'testing' stamp: 'kw 5/31/2019 12:47:50'!
test01CuandoUnCarritoSeCreaEstaVacio
	self assert: Carrito new isEmpty.
	! !

!CarritoTests methodsFor: 'testing' stamp: 'kw 6/3/2019 10:23:16'!
test02NoSePuedeAgregarAlCarritoAlgoQueNoEstaEnElCatalogo
	|carrito catalogo|
	catalogo _ Catalogo new.
	carrito  _ Carrito with: catalogo.
	
	self should:[carrito addAQuantity: 1 ofBooks: 'libro'.]
		raise:Error
		withExceptionDo:[:anError | self assert: anError messageText equals: Carrito elArticuloNoEstaEnElCatalogo]. 
	self assert: (carrito includes: 'libro') not.
	self assert: (catalogo includes: 'libro') not.! !

!CarritoTests methodsFor: 'testing' stamp: 'kw 6/3/2019 10:26:45'!
test03CuandoAlgoSeAgregaAlCarritoEsoEstaEnElCatalogo
	|carrito catalogo|
	catalogo _ Catalogo new.
	catalogo add: 'libro'.
	carrito  _ Carrito with:catalogo .
	carrito addAQuantity: 1 ofBooks: 'libro'.
	self assert: (catalogo includes: 'libro') 
	! !

!CarritoTests methodsFor: 'testing' stamp: 'kw 6/3/2019 10:26:54'!
test04CuandoAlgoSeAgregaAlCarritoYEstaEnElCatalogoEntoncesEstaEnElCarritoConSuCantidad
	|carrito catalogo|
	catalogo _ Catalogo new.
	catalogo add: 'libro'.
	carrito  _ Carrito with:catalogo .
	carrito addAQuantity: 1 ofBooks: 'libro'.
	self assert: (carrito quantityOfABook: 'libro') = 1.
	! !

!CarritoTests methodsFor: 'testing' stamp: 'kw 6/3/2019 10:25:31'!
test05NoSePuedeAgregarUnaCantidadDeLibrosMenorAUnoAlCarrito
	|carrito catalogo|
	catalogo _ Catalogo new.
	catalogo add:'libro'.
	carrito  _ Carrito with: catalogo.
	self should:[carrito addAQuantity: 0 ofBooks: 'libro'.]
		raise:Error
		withExceptionDo:[:anError | self assert: anError messageText equals: Carrito laCantidadDeLibrosNoEsValida]. 
	self assert: (carrito includes: 'libro') not.
	self assert: (catalogo includes: 'libro').! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'libros catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'comparing' stamp: 'kw 5/31/2019 12:49:29'!
isEmpty
	^libros isEmpty .! !


!Carrito methodsFor: 'adding' stamp: 'kw 5/31/2019 13:45:59'!
with:aCatalogo
	catalogo _ aCatalogo.! !


!Carrito methodsFor: 'accesing' stamp: 'kw 6/3/2019 10:09:06'!
includes: aBook
	^libros includesKey: aBook.! !


!Carrito methodsFor: 'initialize' stamp: 'kw 6/3/2019 10:12:04'!
initialize
	libros _ Dictionary new.! !


!Carrito methodsFor: 'as yet unclassified' stamp: 'kw 6/3/2019 10:05:49'!
addAQuantity: quantity ofBooks: aBoook
	(quantity < 1) ifTrue:[self error: Carrito laCantidadDeLibrosNoEsValida].
	(catalogo includes: aBoook)
		ifTrue:[libros add: aBoook->quantity.]
		ifFalse:[self error: Carrito elArticuloNoEstaEnElCatalogo].! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'kw 6/3/2019 10:15:21'!
quantityOfABook: aBoook
	^libros at: aBoook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'as yet unclassified' stamp: 'kw 5/31/2019 13:33:39'!
elArticuloNoEstaEnElCatalogo
	^'el articulo no esta en el catalogo'! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'kw 6/3/2019 10:07:25'!
laCantidadDeLibrosNoEsValida
	^'la cantidad de libros tiene que ser un entero mayor a 0'! !


!Carrito class methodsFor: 'create' stamp: 'kw 5/31/2019 13:47:09'!
with: aCatalogo 
	^self new with:aCatalogo.! !


!classDefinition: #Catalogo category: #TusLibros!
Object subclass: #Catalogo
	instanceVariableNames: 'listaDeLibros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Catalogo methodsFor: 'adding' stamp: 'kw 5/31/2019 13:00:15'!
add: aBook
	listaDeLibros add: aBook.! !


!Catalogo methodsFor: 'accesing' stamp: 'kw 5/31/2019 13:00:49'!
includes: aBook
	^listaDeLibros includes: aBook.! !


!Catalogo methodsFor: 'initialize' stamp: 'kw 5/31/2019 12:55:59'!
initialize
	listaDeLibros _ OrderedCollection new.! !


!classDefinition: #TusLibros category: #TusLibros!
Object subclass: #TusLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
