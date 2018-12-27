Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'TinyBlog-Application'
}

{ #category : #'as yet unclassified' }
TBPostsListComponent >> basicRenderCategoriesOn: html [
	html render: (TBCategoriesComponent
		categories: (self blog allCategories)
		postsList: self)
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> basicRenderPostsOn: html [
	self readSelectedPosts do: [ :p |
		html render: (TBPostComponent new post: p) ]
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> readSelectedPosts [
	^ self currentCategory 
		ifNil: [ self blog allVisibleBlogPosts ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderCategoryColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ 
			self basicRenderCategoriesOn: html ]
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ 
		html tbsRow showGrid;
			with: [ 
				self renderCategoryColumnOn: html.
				self renderPostColumnOn: html ] ]
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> renderPostColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ 
			self basicRenderPostsOn: html ]
]
