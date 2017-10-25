01-char.com: 01-char.asm
	nasm -f bin -o 01-char.com 01-char.asm

build: 01-char.com

clean:
	rm *.com

debug: build
	/Applications/DOSBox.app/Contents/MacOS/DOSBox 01-char.bat

dos:
	/Applications/DOSBox.app/Contents/MacOS/DOSBox autoexec.bat