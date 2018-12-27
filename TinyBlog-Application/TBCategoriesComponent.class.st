Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Application'
}

{ #category : #'as yet unclassified' }
TBCategoriesComponent class >> categories: aCollectionOfCategories postsList: aTBScreen [
	^ self new categories: aCollectionOfCategories; postsList: aTBScreen
]

{ #category : #accessing }
TBCategoriesComponent >> categories [ 
	^ categories
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [
	categories := aCollection
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsList 
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #accessing }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem 
		callback: [ self selectCategory: aCategory ];
		with: aCategory.
]

{ #category : #accessing }
TBCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [ 
		html tbsLinkifyListGroupItem beActive; with: 'Categories'.
		categories do: [ :cat | self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #accessing }
TBCategoriesComponent >> selectCategory: aCategory [
	postsList currentCategory: aCategory
]
