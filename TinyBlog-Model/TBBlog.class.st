Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TinyBlog-Model'
}

{ #category : #'as yet unclassified' }
TBBlog class >> createDemoPosts [
	self current
		writeBlogPost: ((TBPost
			title: 'Welcome in TinyBlog'
			text: 'TinyBlog is a small blog engine made with Pharo.'
			category: 'TinyBlog') visible: true);
		writeBlogPost: ((TBPost
			title: 'Report Pharo Sprint'
			text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done'
			category: 'Pharo') visible: true);
		writeBlogPost: ((TBPost
			title: 'Brick on top of Bloc - Preview'
			text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.'
			category: 'Pharo') visible: true);
		writeBlogPost: ((TBPost
			title: 'The sad story of unclassified blog posts'
			text: 'So sad that I can read this.') visible: true);
		writeBlogPost: ((TBPost
			title: 'Working with Pharo on the Raspberry Pi'
			text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.'
			category: 'Pharo') visible: true)
]

{ #category : #'as yet unclassified' }
TBBlog class >> current [ 
	"answer the instance of TBBlog"
	^ self selectAll 
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]
]

{ #category : #'as yet unclassified' }
TBBlog class >> initialize [ 
	self reset
]

{ #category : #'as yet unclassified' }
TBBlog class >> initializeMongo [
	| repository |
	repository := VOMongoRepository
		host: 'localhost'
		database: 'tinyblog'.
	repository enableSingleton
]

{ #category : #'as yet unclassified' }
TBBlog class >> isVoyageRoot [
	"indicates that instances of this class are top level document in noSQL database"
	^ true
]

{ #category : #'as yet unclassified' }
TBBlog class >> reset [ 
	self initializeMongo 
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allCategories [
	^ (self allBlogPosts collect: #category) asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : #'as yet unclassified' }
TBBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
TBBlog >> remove [ 
	posts do: [ :each | each remove ].
	posts := OrderedCollection new.
	super remove
]

{ #category : #'as yet unclassified' }
TBBlog >> size [ 
	^ posts size
]

{ #category : #'as yet unclassified' }
TBBlog >> writeBlogPost: aPost [
	"write the blog post in database"
	posts add: aPost.
	aPost save.
	self save
]
