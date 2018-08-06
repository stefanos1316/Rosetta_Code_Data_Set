all:
	bash script.compileTasks --directory task_tested_with_compile_script/

clean:
	-rm tasks/*/*/*.exe
	-rm tasks/*/*/*.class
	-rm -rf tasks/*/rust/*/target
	find tasks/*/*/ -type f -executable -delete
	-rm tasks/synchronous-concurrency/c/libco.c
	-rm tasks/json/c++/json.hpp

compilers:
	echo Testing compilers...
	gcc --version
	g++ --version
	go version
	mcs --version
	javac -version
	rustc --version
	
runtimes:
	mono --version
	java -version
	node --version
	perl -version
	php -version 
	python --version
	ruby --version
