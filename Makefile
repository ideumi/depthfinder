build:
	chippy check all
	chippy format check all src/
	chippy combine

install: build
	install -m 755 out/dfn /usr/bin/dfn

uninstall:
	rm /usr/bin/dfn
