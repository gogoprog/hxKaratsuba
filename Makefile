build:
	haxe build.hxml

test: build
	node build/karatsuba.js

.PHONY: build

