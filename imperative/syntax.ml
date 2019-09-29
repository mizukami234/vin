type expr_t =
  | FunCall of string * expr_t list
  | Literal of bool
  | Var of string
type stmt_t =
  | VarDec of string
  | Assign of string * expr_t
  | IfClause of expr_t * t * t option
  | Expr of expr_t
and t = stmt_t list
