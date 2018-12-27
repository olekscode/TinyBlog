Class {
	#name : #BaselineOfTinyBlog,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyBlog
}

{ #category : #baselines }
BaselineOfTinyBlog >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Packages"
			spec 
				package: 'TinyBlog' with: [
					spec requires: #(Seaside3 Voyage BootstrapMagritte Mustache) ].
				
			"External dependencies"
			self
				baselineSeaside: spec;
				baselineVoyage: spec;
				baselineMagritte: spec;
				baselineMustache: spec.
		]
]

{ #category : #baselines }
BaselineOfTinyBlog >> baselineMagritte: spec [

	spec
		project: 'BootstrapMagritte'
		with: [ spec
			className: #ConfigurationOfBootstrapMagritte;
			repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main' ].
]

{ #category : #baselines }
BaselineOfTinyBlog >> baselineMustache: spec [

	spec
		project: 'Mustache'
		with: [ spec
			className: #ConfigurationOfMustache;
			repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main' ].
]

{ #category : #baselines }
BaselineOfTinyBlog >> baselineSeaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
]

{ #category : #baselines }
BaselineOfTinyBlog >> baselineVoyage: spec [

	spec
		baseline: 'Voyage'
		with: [ spec repository: 'github://pharo-nosql/voyage/mc' ].
]
