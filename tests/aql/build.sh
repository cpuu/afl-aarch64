gcc -c -o aql-parser.o_plain aql-parser.c -Wall -Wno-unused-variable 
gcc -c -o lvm.o_plain lvm.c -Wall -Wno-unused-variable  
gcc -c -o aql-adt.o_plain aql-adt.c -Wall -Wno-unused-variable  
gcc -c -o test_aql.o_plain test_aql.c -Wall -Wno-unused-variable
gcc -c -o aql-lexer.o_plain aql-lexer.c -Wall -Wno-unused-variable 
gcc -o test_aql_plain.exe aql-parser.o_plain lvm.o_plain aql-adt.o_plain test_aql.o_plain aql-lexer.o_plain 
