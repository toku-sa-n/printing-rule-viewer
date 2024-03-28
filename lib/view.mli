val extract_notations_from_expressions : string -> string list
(** Extract notations from expressions in the given Coq source code. *)

val extract_printing_rules_from_expressions :
  string -> (string * string list) list
(** Extract notations and their printing rules from the given Coq source code. *)
