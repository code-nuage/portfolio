start: build run

run:
	cd build && lua main.lua

build: clean teal copy

clean:
	rm -rf build/

teal:
	cyan build

copy:
	rsync -av --exclude='*.tl' src/ build/

watch:
	find src -type f ! -name '*.tl' | entr rsync -av --exclude='*.tl' src/ build/
