.ONESHELL:

build:
	npx quartz build -d src/site/notes/

serve:
	npx quartz build -d src/site/notes/ --serve --port 3010

install:
	npm i
