type t =
  | Bool of bool
  | Var of string
  | Fun of string * t
  | App of t * t
