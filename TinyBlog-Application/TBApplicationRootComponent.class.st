Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'posts',
		'main'
	],
	#category : #'TinyBlog-Application'
}

{ #category : #testing }
TBApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #testing }
TBApplicationRootComponent class >> initialize [ 
	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
]

{ #category : #hooks }
TBApplicationRootComponent >> children [ 
	^ { main }
]

{ #category : #hooks }
TBApplicationRootComponent >> initialize [ 
	super initialize.
	main := TBPostsListComponent new.
]

{ #category : #hooks }
TBApplicationRootComponent >> main: aComponent [
	main := aComponent 
]

{ #category : #hooks }
TBApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #hooks }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'.
]
