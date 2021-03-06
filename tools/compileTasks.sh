#!/bin/bash


# Adding fancy label for error messages
redlabel=$(tput setab 1)
default=$(tput sgr0)

# Compilation flags
C_FLAGS="-lm -pthread -fopenmp -std=c99 -w -lyajl"
C_PLUS_PLUS_FLAGS="-std=c++11 -D_GLIBCXX_USE_NANOSLEEP -lpthread"
C_SHARP_FLAGS=" -r:/usr/lib/mono/newtonsoft-json/Newtonsoft.Json.dll"
VB_DOT_NET_FLAGS="-r:/usr/lib/mono/newtonsoft-json/Newtonsoft.Json.dll"

if [ "$1" == "-h" -o "$1" == "--help" ]; then
	echo
	echo "-d | --directory"
	echo "	provide directory name where the files for compilation are located"
	echo
	echo "-h | --help"
	echo "	print help message and exit"
	echo
	exit
fi

# Initiallize global variables
DIRECTORY=false
DIRECTORY_PATH=""

# If there is no : after a letter it means the specific letter has no argument, if it has :: it means the particular has optional, and a : has required argument.
OPTIONS=`getopt -o d: --long directory: -n 'script.compileTasks' -- "$@"`
eval set -- "$OPTIONS"
while true; do
	case "$1" in 
		-d|--directory) DIRECTORY=true ;
			case $2 in 
				*/*) DIRECTORY_PATH=$2 ; shift 2 ;;
				*) >&2 echo "[Error] Directory path was not provided." ; shift 2 ;;
			esac ;;
		--) shift ; break ;;
		*) >&2 echo "Wrong command line argument, please try again." ; exit 1 ;;
	esac
done

echo
echo "Compiling tasks..."

for containesTasks in `ls ${DIRECTORY_PATH}`;
do
        #For all the programming languages enter and compile the content
        for containesLanguages in `ls ${DIRECTORY_PATH}/$containesTasks`;
        do
                #For all the tasks compile them based on the language
		for tasksImplementation in `ls ${DIRECTORY_PATH}/$containesTasks/$containesLanguages`;
                do
                        case "$containesLanguages" in 
                        ("c")
				if [[ $tasksImplementation == *".c" ]];
				then
					sourceFile=${DIRECTORY_PATH}"/"$containesTasks"/"$containesLanguages"/"$tasksImplementation
					objectFile=$(echo $sourceFile | awk -F "." '{print $1}')

					if [ "$containesTasks" = "synchronous-concurrency" ]; then 
						if [ "$tasksImplementation" = "synchronous-concurrency.c" ]; then
							eval=$(gcc -o $objectFile $sourceFile -O3 ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/libco.c)
						fi
					else
						eval=$(gcc ${C_FLAGS} -o $objectFile $sourceFile -O3)
					fi
		
					if [ $? -eq 0 ];
					then
                                       			echo "[C] $tasksImplementation successfully compiled"
                                		else
                                                	>&2 echo "${redlabel}[C] $tasksImplementation ${default}" 
  	                        	fi
				fi
			;;
                        ("c++")
				if [[ $tasksImplementation == *".cpp"  ]]; 
				then
					sourceFile=${DIRECTORY_PATH}"/"$containesTasks"/"$containesLanguages"/"$tasksImplementation
                                	objectFile=$(echo $sourceFile | awk -F "." '{print $1}')
                                	eval=$(g++ ${C_PLUS_PLUS_FLAGS} -o $objectFile $sourceFile -O3)
                                	if [ $? -eq 0 ];
                                	then
                                                echo "[C++] $tasksImplementation successfully compiled"
                                        else
                                                >&2 echo "${redlabel}[C++] $tasksImplementation ${default}" 
                                	fi
				fi
			;;
			("java")
				if [[ $tasksImplementation == *".java"  ]];
				then
					# if it the json task behave differently
                                	if [ "$containesTasks" = "json" ]; then	
						eval=$(javac -cp ./${DIRECTORY_PATH}/$containesTasks/$containesLanguages/ ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
						#javac -cp ./json/java json/java/JsonExample.java
					else
						eval=$(javac ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
                                	fi

					if [ $? -eq 0 ];
                                	then
                                                echo "[Java] $tasksImplementation successfully compiled"
                                        else
                                                >&2 echo "${redlabel}[Java] $tasksImplementation ${default}"
                                	fi
				fi
                        ;;
			("c-sharp")
				if [[ $tasksImplementation == *".cs"  ]];
				then
                                	eval=$(mcs -optimize+ -warn:0 $C_SHARP_FLAGS ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
                         
					if [ $? -eq 0 ];
                                	then
                                                echo "[C#] $tasksImplementation successfully compiled"
                                        else
                                                >&2 echo "${redlabel}[C#] $tasksImplementation ${default}"
                                	fi
				fi
                        ;;
			("visual-basic-.net")
				if [[ $tasksImplementation == *".vb" ]]; 	
				then
                                	eval=$(vbnc -optimize+ /nowarn ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
                              
					if [ $? -eq 0 ];
                                	then
                                                >&2 echo "${redlabel}[VB.NET] $tasksImplementation ${default}"
                                        else
                                                echo "[VB.NET] $tasksImplementation successfully compiled"
                                	fi
				fi
                        ;;
                        ("swift")
				if [[ $tasksImplementation == *".swift" ]];
				then 
                                	eval=$(swiftc -suppress-warnings -O ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
				
					# Now move the executable back to its directory
					if [ "$containesTasks" = "json" ]; then
						mv json ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/
					else
						mv main ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/	
        				fi               
			        fi

				if [ $? -eq 0 ];
                                then
                                                echo "[Swift] $tasksImplementation successfully compiled"
                                        else
                                                >&2 echo "${redlabel}[Swift] $tasksImplementation${default}"
                                fi
                        ;;
                        ("rust_no")
				if [[ $tasksImplementation == *".rust" ]];
				then
					# This is for cargo projects
					if [ "$containesTasks" = "concurrent-computing" -o "$containesTasks" = "json" ]; then
						cd ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$containesTasks/
						cargo build --release -q
						getExecutable=$(echo $tasksImplementation | awk -F "." '{print $1}')
						cp target/release/${getExecutable} ../${getExecutable}_exec
						cd ../../../../
					else
                                		eval=$(~/.cargo/bin/rustc -O -Awarnings ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/$tasksImplementation)
						getExecutableName=$(echo $tasksImplementation | awk -F "." '{print $1}') 
						mv $getExecutableName ${DIRECTORY_PATH}/$containesTasks/$containesLanguages/    
					fi
					if [ $? -eq 0 ];
                                	then
                                                echo "[Rust] $tasksImplementation successfully compiled"
                                        else
                                                >&2 echo "${redlabel}[Rust] $tasksImplementation${default}"
                                	fi
				fi
                        ;;

                        esac
                done
        done
done

exit
done

exit	
