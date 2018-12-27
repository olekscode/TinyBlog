Class {
	#name : #TBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'TinyBlog-Application'
}

{ #category : #accessing }
TBPostComponent >> date [
	^ post date asDate
]

{ #category : #accessing }
TBPostComponent >> initialize [ 
	super initialize.
	post := TBPost new.
]

{ #category : #accessing }
TBPostComponent >> post: aPost [
	post := aPost
]

{ #category : #accessing }
TBPostComponent >> renderContentOn: html [
	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self text
]

{ #category : #accessing }
TBPostComponent >> text [
	^ post text
]

{ #category : #accessing }
TBPostComponent >> title [ 
	^ post title
]
