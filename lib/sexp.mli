val find_sexp_recursively :
  (Sexplib.Sexp.t -> bool) -> Sexplib.Sexp.t -> Sexplib.Sexp.t list
(** Traverse the given S-expression recursively, and returns a list of
    S-expressions that satisfy the given condition. *)
