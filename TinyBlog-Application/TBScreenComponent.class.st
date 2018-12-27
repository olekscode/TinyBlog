Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'posts',
		'header'
	],
	#category : #'TinyBlog-Application'
}

{ #category : #'as yet unclassified' }
TBScreenComponent >> blog [
	"Return the current blog in the future we will ask the
	session to return the blog of the currently logged user."
	^ TBBlog current
]

{ #category : #'as yet unclassified' }
TBScreenComponent >> children [ 
	^ OrderedCollection with: header.
]

{ #category : #'as yet unclassified' }
TBScreenComponent >> initialize [ 
	super initialize.
	header := TBHeaderComponent new.
]

{ #category : #'as yet unclassified' }
TBScreenComponent >> renderContentOn: html [
	html render: header
]
