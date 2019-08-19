(* token.ml *)

type t =
| LTrue
| LFalse
| TIdent of string
| TArrow
| KFn
| LParen
| RParen
