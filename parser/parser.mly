%{
  (* parser.mly *)

  open Syntax
%}

%token LParen RParen TArrow KFn LTrue LFalse EOF
%token <string> TIdent

%start program
%type <Syntax.t> program
%%

program: | term EOF { $1 }
term:    | term term2 { App($1, $2) }
         | term2 { $1 }
term2:   | LTrue { Bool true }
         | LFalse { Bool false }
         | TIdent { Var $1 }
         | LParen term RParen { $2 }
         | func { $1 }
func:    | KFn TIdent TArrow term { Fun($2, $4) }
