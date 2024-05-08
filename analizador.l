%{
    #include <stdio.h>
%}

%%
\/\/.*                  { printf("COMMENT\n"); }
f[ \t]+[a-zA-Z][a-zA-Z0-9]* { printf("floatdcl id\n"); }
i[ \t]+[a-zA-Z][a-zA-Z0-9]* { printf("intdcl id\n"); }
[a-zA-Z][a-zA-Z0-9]*[ \t]*=[ \t]*[0-9]+ { printf("id assign inum\n"); }
[a-zA-Z][a-zA-Z0-9]*[ \t]*=[ \t]*[a-zA-Z][a-zA-Z0-9]*[ \t]*[+\-*/][ \t]*[0-9]+(\.[0-9]+)? { printf("id assign id plus fnum\n"); }
p[ \t]+[a-zA-Z][a-zA-Z0-9]* { printf("print id\n"); }
[ \t\n]
.
%%

int main(int argc, char **argv) {
    FILE *fd;

    if(argc == 2) {
        if(!(fd = fopen(argv[1], "r"))) {
            perror("Error: ");
            return(-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    } else {
        printf("Usage: a.out filename\n");
    }
    return 0;
}
