install:
	@npm install

build:
	@rm lib/index.js
	@coffee -o lib -c src/index.coffee

test:
	@./node_modules/.bin/mocha

publish:
	@make build
	@npm publish .
	@make clean

.PHONY: test
