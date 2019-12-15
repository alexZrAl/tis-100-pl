% TIS-100 Grammar
line --> noarg |
         unary, reg1 |
         [mov], reg1, non_literal| 
         branch, lblOrComment | 
         [#], lblOrComment | lblOrComment, [:].

noarg --> [nop] | [swp] | [sav] | [neg]. % no argument instructions
unary --> [add] | [sub]. % unary

branch --> [jmp] | [jez] | [jnz] | [jgz] | [jlz] | [jro]. % branch instructions

reg1 --> [up] | [down] | [left] | [right] | [acc] | literal.
non_literal --> [up] | [down] | [left] | [right] | [acc] | [nil].
literal --> [Int], {between(-3, 3, Int)}. % yep, TIS instruction set supports only +- 99, in debug phase we use +- 3 for simplicity
lblOrComment --> [X], {string(X)}.


% driver function for testing purposes, argv[1] should be a single line
main(Argv) :-
    [Line | _] = Argv,
    split_string(Line, " ", " ", SubStrings),   % still a bit problematic.....
    phrase(line, SubStrings).