Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'TinyBlog-Model'
}

{ #category : #'as yet unclassified' }
TBPost class >> isVoyageRoot [
	"Indicates that instances of this class are top level document in noSQL databases"
	^ true
]

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: aText [
	^ self new 
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
		category: aCategory;
		yourself
]

{ #category : #'as yet unclassified' }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #blinking }
TBPost >> beVisible [
	self visible: true
]

{ #category : #blinking }
TBPost >> category [
	^ category
]

{ #category : #blinking }
TBPost >> category: anObject [
	category := anObject
]

{ #category : #blinking }
TBPost >> date [
	^ date
]

{ #category : #blinking }
TBPost >> date: anObject [
	date := anObject
]

{ #category : #blinking }
TBPost >> initialize [ 
	super initialize.
	self category: self class unclassifiedTag.
	self date: Date today.
	self visible: false.
]

{ #category : #blinking }
TBPost >> isUnclassified [
	^ self category = self class unclassifiedTag
]

{ #category : #blinking }
TBPost >> isVisible [
	^ self visible
]

{ #category : #blinking }
TBPost >> notVisible [
	self visible: false
]

{ #category : #blinking }
TBPost >> text [
	^ text
]

{ #category : #blinking }
TBPost >> text: anObject [
	text := anObject
]

{ #category : #blinking }
TBPost >> title [
	^ title
]

{ #category : #blinking }
TBPost >> title: anObject [
	title := anObject
]

{ #category : #blinking }
TBPost >> visible [
	^ visible
]

{ #category : #blinking }
TBPost >> visible: anObject [
	visible := anObject
]
