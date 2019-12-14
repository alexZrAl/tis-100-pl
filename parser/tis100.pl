line --> unary, reg1 | binary, reg1, reg2 | branch, _ | [#], _ | _, [:] | noarg.

noarg --> [nop] | [swp] | [sav] | [neg]. % no argument instructions
unary --> [add] | [sub]. % unary
binary --> [mov]. % binary
branch --> [jmp] | [jez] | [jnz] | [jgz] | [jlz] | [jro]. % branch instructions

reg1 --> [up] | [down] | [left] | [right] | [acc] | literal.
reg2 --> [up] | [down] | [left] | [right] | [acc].
literal --> [nil] | [Int], {between(-9, 9, Int)}. % yep, TIS instruction set supports only +- 99, in debug phase we use +- 9 for simplicity