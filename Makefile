all:
	bash script.compileTasks --directory task_tested_with_compile_script/

clean:
	-rm task_tested_with_compile_script/*/*/*.exe
	-rm task_tested_with_compile_script/*/*/*.class
	-rm -rf task_tested_with_compile_script/*/rust/*/target
	find task_tested_with_compile_script/*/*/ -type f -executable -delete
	-rm task_tested_with_compile_script/synchronous-concurrency/c/libco.c

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
