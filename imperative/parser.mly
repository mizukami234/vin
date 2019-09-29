%{
  (* parser.mly *)

  open Syntax
%}

%token LTrue LFalse LParen RParen LMParen RMParen Comma KIf KElse KVar Equal ISep EOF
%token <string> TIdent

%start program
%type <Syntax.t> program
%%

program:    | stmts { $1 }
stmts:      | stmt stmts { $1::$2 }
            | { [] }
stmt:       | stmt_body ISep { $1 }
stmt_body:  | KVar TIdent { VarDec($2) }
            | TIdent Equal expr { Assign($1, $3) }
            | if_stmt { $1 }
            | expr { Expr($1) }
if_stmt:    | KIf LParen expr RParen LMParen stmts RMParen { IfClause($3, $6, None) }
            | KIf LParen expr RParen LMParen stmts RMParen KElse LMParen stmts RMParen { IfClause($3, $6, Some($10)) }
expr:       | TIdent LParen fun_args RParen { FunCall($1, $3) }
            | LTrue { Literal(true) }
            | LFalse { Literal(false) }
            | TIdent { Var($1) }
fun_args:   | expr Comma fun_args { $1::$3 }
            | expr { [$1] }
            | { [] }
