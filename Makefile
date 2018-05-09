all:
	bash script.compileTasks --directory task_tested_with_compile_script/

clean:
	-rm task_tested_with_compile_script/*/*/*.exe
	-rm task_tested_with_compile_script/*/*/*.class
	find task_tested_with_compile_script/*/*/ -type f -executable -delete
