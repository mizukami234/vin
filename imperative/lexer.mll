{
  (* lexer.mll *)

  open Parser
}

let space = ['\t' '\n' '\r' ' ']
rule main = parse
| space+ { main lexbuf (* ignored *) }
| "if" { KIf }
| "else" { KElse }
| "var" { KVar }
| "true" { LTrue }
| "false" { LFalse }
| ['a'-'z']+ { TIdent (Lexing.lexeme lexbuf) }
| "=" { Equal }
| '(' { LParen }
| ')' { RParen }
| '{' { LMParen }
| '}' { RMParen }
| ';' { ISep }
| ',' { Comma }
| eof { EOF }
