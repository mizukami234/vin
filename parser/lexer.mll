{
  (* lexer.mll *)

  open Parser
}

let space = ['\t' '\n' '\r' ' ']
rule main = parse
| space+ { main lexbuf (* ignored *) }
| "fn" { KFn }
| "true" { LTrue }
| "false" { LFalse }
| ['a'-'z']+ { TIdent (Lexing.lexeme lexbuf) }
| "->" { TArrow }
| '(' { LParen }
| ')' { RParen }
| eof { EOF }
