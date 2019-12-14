line --> ins, reg1 | ins, reg1, reg2 | branch, lbl | [#], _ | _, [:]. % unary instruction | binary instruction | comment | label
ins --> [nop] | [mov] | [swp] | [sav] | [add] | [sub] | [neg]. % normal instructions
branch --> [jmp] | [jez] | [jnz] | [jgz] | [jlz] | [jro]. % branch instructions
reg1 --> [up] | [down] | [left] | [right] | [acc] | literal.
reg2 --> [up] | [down] | [left] | [right] | [acc] | literal. % do we need to ensure that reg2 != reg1? and how?
literal --> [nil] | [Int], {between(-99, 99, Int)}. % yep, TIS instruction set supports only +- 99