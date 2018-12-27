Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Application'
}

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault with: [ 
		html tbsNavbarBrand
			url: '#';
			with: 'TinyBlog' ]
]
