open Sexplib.Sexp

let rec find_sexp cond = function
  | x when cond x -> [ x ]
  | Atom _ -> []
  | List xs -> List.concat_map (find_sexp cond) xs

let extract_cnotations ast =
  let cond = function
    | List
        [
          List [ Atom "v"; List (Atom "CNotation" :: _) ]; List (Atom "loc" :: _);
        ] ->
        true
    | _ -> false
  in

  let extract_notations = function
    | Constrexpr.CNotation (_, (_, notation), _) -> notation
    | _ -> failwith "unreachable"
  in

  Serlib.Ser_vernacexpr.sexp_of_vernac_control ast
  |> find_sexp cond
  |> List.map Serlib.Ser_constrexpr.constr_expr_of_sexp
  |> List.map (fun x -> x.CAst.v)
  |> List.map extract_notations

let extract_notations_from_expressions code =
  let rec f parser =
    match Astparser.next parser with
    | None -> []
    | Some ast -> extract_cnotations ast :: f parser
  in
  f (Astparser.make code) |> List.concat
