(* lexer.mll *)

let space = ['\t' '\n' '\r' ' ']
rule main = parse
| space+ { main lexbuf (* ignored *) }
| "fn" { Token.KFn }
| "true" { Token.LTrue }
| "false" { Token.LFalse }
| ['a'-'z']+ { Token.TIdent (Lexing.lexeme lexbuf) }
| "->" { Token.TArrow }
| '(' { Token.LParen }
| ')' { Token.RParen }
