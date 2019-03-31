!classDefinition: #ElSemaforoDeCabildoYMonroeSobreCabildo category: #Semaforo!
DenotativeObjectMorph subclass: #ElSemaforoDeCabildoYMonroeSobreCabildo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElSemaforoDeCabildoYMonroeSobreCabildo class' category: #Semaforo!
ElSemaforoDeCabildoYMonroeSobreCabildo class
	instanceVariableNames: 'ElSemaforoDeCabildoYMonroe'!

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:43:03'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:52:13'!
apagar
	LaSenalDeAvanceDeCabildoYMonroeSobreCabildo apagar.
	LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo apagar.
	LaSenalDeDetencionDeCabildoYMonroeSobreCabildo apagar.! !

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:43:03'!
avisarPrecaucion: cantidad
	cantidad = 0 ifFalse:
	[LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo prender.
	(Delay for: 1*second) wait.
	LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo apagar.
	(Delay for: 1*second) wait.
	self avisarPrecaucion: cantidad -1]! !

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:52:26'!
encenderSenalAvance
	self avisarPrecaucion: 1.
	LaSenalDeDetencionDeCabildoYMonroeSobreCabildo apagar.
	LaSenalDeAvanceDeCabildoYMonroeSobreCabildo prender.! !

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:52:36'!
encenderSenalDetencion
	LaSenalDeAvanceDeCabildoYMonroeSobreCabildo apagar.
	self avisarPrecaucion: 1.
	LaSenalDeDetencionDeCabildoYMonroeSobreCabildo prender.! !

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	ElSemaforoDeCabildoYMonroe := nil.! !

!ElSemaforoDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:43:03'!
prender
	self avisarPrecaucion: 5! !


!classDefinition: #ElSemaforoDeCabildoYMonroeSobreMonroe category: #Semaforo!
DenotativeObjectMorph subclass: #ElSemaforoDeCabildoYMonroeSobreMonroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElSemaforoDeCabildoYMonroeSobreMonroe class' category: #Semaforo!
ElSemaforoDeCabildoYMonroeSobreMonroe class
	instanceVariableNames: 'ElSemaforoDeCabildoYMonroe'!

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:50:02'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:53:01'!
apagar
	LaSenalDeAvanceDeCabildoYMonroeSobreMonroe apagar.
	LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe apagar.
	LaSenalDeDetencionDeCabildoYMonroeSobreMonroe apagar.! !

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:50:25'!
avisarPrecaucion: cantidad
	cantidad = 0 ifFalse:
	[LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe prender.
	(Delay for: 1*second) wait.
	LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe apagar.
	(Delay for: 1*second) wait.
	self avisarPrecaucion: cantidad -1]! !

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:53:15'!
encenderSenalAvance
	self avisarPrecaucion: 1.
	LaSenalDeDetencionDeCabildoYMonroeSobreMonroe apagar.
	LaSenalDeAvanceDeCabildoYMonroeSobreMonroe prender.! !

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:53:24'!
encenderSenalDetencion
	LaSenalDeAvanceDeCabildoYMonroeSobreMonroe apagar.
	self avisarPrecaucion: 1.
	LaSenalDeDetencionDeCabildoYMonroeSobreMonroe prender.! !

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	ElSemaforoDeCabildoYMonroe := nil.! !

!ElSemaforoDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:50:02'!
prender
	self avisarPrecaucion: 5! !


!classDefinition: #LaSenalDeAvanceDeCabildoYMonroeSobreCabildo category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDeAvanceDeCabildoYMonroeSobreCabildo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class' category: #Semaforo!
LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class
	instanceVariableNames: ''!

!LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:49:10'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:49:10'!
apagar
	self color: Color black.! !

!LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDeAvanceDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:49:10'!
prender
	self color: Color green.! !


!classDefinition: #LaSenalDeAvanceDeCabildoYMonroeSobreMonroe category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDeAvanceDeCabildoYMonroeSobreMonroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class' category: #Semaforo!
LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class
	instanceVariableNames: ''!

!LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class methodsFor: 'morph' stamp: 'CK 3/31/2019 12:11:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 13:09:25'!
apagar
	self color: Color black.! !

!LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDeAvanceDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 13:09:36'!
prender
	self color: Color green.! !


!classDefinition: #LaSenalDeDetencionDeCabildoYMonroeSobreCabildo category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDeDetencionDeCabildoYMonroeSobreCabildo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class' category: #Semaforo!
LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class
	instanceVariableNames: ''!

!LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:36:00'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:36:00'!
apagar
	self color: Color black.! !

!LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDeDetencionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:36:00'!
prender
	self color: Color red.! !


!classDefinition: #LaSenalDeDetencionDeCabildoYMonroeSobreMonroe category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDeDetencionDeCabildoYMonroeSobreMonroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class' category: #Semaforo!
LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class
	instanceVariableNames: ''!

!LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:48:16'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:48:16'!
apagar
	self color: Color black.! !

!LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDeDetencionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:48:16'!
prender
	self color: Color red.! !


!classDefinition: #LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class' category: #Semaforo!
LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class
	instanceVariableNames: ''!

!LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class methodsFor: 'morph' stamp: 'CK 3/31/2019 12:12:22'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 13:07:47'!
apagar
	self color: Color black.! !

!LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 13:07:51'!
prender
	self color: Color yellow.! !


!classDefinition: #LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe category: #Semaforo!
DenotativeObjectMorph subclass: #LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class' category: #Semaforo!
LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class
	instanceVariableNames: ''!

!LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class methodsFor: 'morph' stamp: 'CK 3/31/2019 14:48:06'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:48:06'!
apagar
	self color: Color black.! !

!LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 14:48:06'!
prender
	self color: Color yellow.! !


!classDefinition: #ElSemaforoDeCabildoYMonroe category: #Semaforo!
DenotativeObject subclass: #ElSemaforoDeCabildoYMonroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElSemaforoDeCabildoYMonroe class' category: #Semaforo!
ElSemaforoDeCabildoYMonroe class
	instanceVariableNames: 'ElSemafaroDeCabildoYMonroeSobreCabildo ElSemafaroDeCabildoYMonroeSobreMonroe'!

!ElSemaforoDeCabildoYMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 17:51:54'!
DarPasoCabildo
	ElSemaforoDeCabildoYMonroeSobreMonroe encenderSenalDetencion.
	ElSemaforoDeCabildoYMonroeSobreCabildo encenderSenalAvance.! !

!ElSemaforoDeCabildoYMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 17:52:01'!
DarPasoMonroe
	ElSemaforoDeCabildoYMonroeSobreCabildo encenderSenalDetencion.
	ElSemaforoDeCabildoYMonroeSobreMonroe encenderSenalAvance.! !

!ElSemaforoDeCabildoYMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 17:52:41'!
apagarSemaforo
	ElSemaforoDeCabildoYMonroeSobreCabildo apagar.
	ElSemaforoDeCabildoYMonroeSobreMonroe apagar.! !

!ElSemaforoDeCabildoYMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 18:43:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	ElSemafaroDeCabildoYMonroeSobreCabildo := nil.
	ElSemafaroDeCabildoYMonroeSobreMonroe := nil.! !

!ElSemaforoDeCabildoYMonroe class methodsFor: 'as yet unclassified' stamp: 'CK 3/31/2019 17:49:33'!
prenderSemaforo
	ElSemaforoDeCabildoYMonroeSobreCabildo prender.
	ElSemaforoDeCabildoYMonroeSobreMonroe prender.! !

ElSemaforoDeCabildoYMonroeSobreCabildo initializeAfterFileIn!
ElSemaforoDeCabildoYMonroeSobreMonroe initializeAfterFileIn!
LaSenalDeAvanceDeCabildoYMonroeSobreCabildo initializeAfterFileIn!
LaSenalDeAvanceDeCabildoYMonroeSobreMonroe initializeAfterFileIn!
LaSenalDeDetencionDeCabildoYMonroeSobreCabildo initializeAfterFileIn!
LaSenalDeDetencionDeCabildoYMonroeSobreMonroe initializeAfterFileIn!
LaSenalDePrecaucionDeCabildoYMonroeSobreCabildo initializeAfterFileIn!
LaSenalDePrecaucionDeCabildoYMonroeSobreMonroe initializeAfterFileIn!
ElSemaforoDeCabildoYMonroe initializeAfterFileIn!