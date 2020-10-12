.PHONY: gem

gem:
	find ./ -name '*.gemspec' | xargs -n1 gem build

.PHONY: clean
clean:
	rm *.gem

.PHONY: dump
dump:
	tar --to-stdout -xf *.gem data.tar.gz | tar -zt

