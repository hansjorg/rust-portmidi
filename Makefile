all: lib examples doc test

lib:
	mkdir -p lib
	rustc --out-dir=lib src/portmidi/lib.rs

test: lib
	mkdir -p bin
	rustc --out-dir=bin --test -L ./lib src/portmidi/test.rs

doc:
	mkdir -p doc
	rustdoc -o doc src/portmidi/lib.rs

examples: lib
	mkdir -p bin
	rustc -o bin/example1 -L ./lib src/examples/portmidiex1/main.rs

clean:
	rm -rf bin lib doc
