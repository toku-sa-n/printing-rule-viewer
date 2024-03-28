open Sexplib.Sexp

let rec find_sexp_recursively cond = function
  | Atom x -> if cond (Atom x) then [ Atom x ] else []
  | List xs ->
      let tail = List.concat_map (find_sexp_recursively cond) xs in
      if cond (List xs) then List xs :: tail else tail
