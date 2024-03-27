val extract_notations_from_expressions : string -> string list
(** Extract notations from expressions in the given Coq source code. *)

val init : unit -> unit
(** Initialize the Coq environment and the handler of command line arguments.

    This function must be called once and only once, and in the very early
    stage. *)
