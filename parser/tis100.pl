% TIS-100 Grammar
stmt --> noarg |
         unary, arg1 |
         ["mov"], arg1, non_literal|    % mov is the only binary instruction in tis-100
         branch, lblOrComment | 
         ["#"], lblOrComment | lblOrComment, [":"].

noarg --> ["nop"] | ["swp"] | ["sav"] | ["neg"]. % no argument instructions
unary --> ["add"] | ["sub"]. % unary

branch --> ["jmp"] | ["jez"] | ["jnz"] | ["jgz"] | ["jlz"] | ["jro"]. % branch instructions

reg --> ["up"] | ["down"] | ["left"] | ["right"] | ["acc"].
arg1 --> reg | literal.
non_literal --> reg | ["nil"].
literal --> [S], {number_string(Int, S), between(-99, 99, Int)}. % yep, TIS instruction set supports only +- 99
lblOrComment --> [X], {string(X)}.

% prolog IO, https://stackoverflow.com/questions/23411139/prolog-unexpected-end-of-file
read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_codes(Stream,Codes),
    atom_chars(X, Codes),
    split_string(X, " ", " ", SubStrings),
    % check
    write(SubStrings),
    ( phrase(stmt, SubStrings) ->
        writeln(" <-- Good");
        writeln(" <-- Syntax error")
    ),
    read_file(Stream,L), 
    !.

% driver function for testing purposes, argv[1] should be a filename, ascii text
main(Argv) :-
    open(Argv, read, Str),
    read_file(Str,Lines),
    close(Str),
    write(Lines), nl.
