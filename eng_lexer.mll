(* eng_lexer.mll *)
rule main = parse
| ['a'-'z']+ { Lexing.lexeme lexbuf }
| [' ']+ { "SPACE" }
| '.' { "PERIOD" }
