rule main = parse
| ['A'-'z']+ { Lexing.lexeme lexbuf }
| [' ']+ { "space" }
