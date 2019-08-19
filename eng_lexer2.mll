(* eng_lexer2.mll *)
rule main = parse
| ['A'-'z']+ { Eng_token.Word (Lexing.lexeme lexbuf) }
| [' ']+ { Eng_token.Space }
| '.' { Eng_token.EndOfSentence }
