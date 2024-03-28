open Sexplib.Sexp

let extract_notations_and_printing_rules ast =
  let cond = function
    | List
        [
          List [ Atom "v"; List (Atom "CNotation" :: _) ]; List (Atom "loc" :: _);
        ] ->
        true
    | _ -> false
  in

  let extract_pair = function
    | Constrexpr.CNotation (scope, notation, _) ->
        (snd notation, Ppextend.find_notation_printing_rule scope notation)
    | _ -> failwith "unreachable"
  in

  let rec map_to_string = function
    | Ppextend.UnpBox (_, xs) ->
        "UnpBox" :: List.concat (List.map (fun (_, x) -> map_to_string x) xs)
    | Ppextend.UnpMetaVar _ -> [ "UnpMetaVar" ]
    | Ppextend.UnpBinderMetaVar _ -> [ "UnpBinderMetaVar" ]
    | Ppextend.UnpCut _ -> [ "UnpCut" ]
    | Ppextend.UnpListMetaVar _ -> [ "UnpListMetaVar" ]
    | Ppextend.UnpBinderListMetaVar _ -> [ "UnpBinderListMetaVar" ]
    | Ppextend.UnpTerminal _ -> [ "UnpTerminal" ]
  in

  Serlib.Ser_vernacexpr.sexp_of_vernac_control ast
  |> Sexp.find_sexp_recursively cond
  |> List.map Serlib.Ser_constrexpr.constr_expr_of_sexp
  |> List.map (fun x -> x.CAst.v)
  |> List.map extract_pair
  |> List.map (fun (x, y) ->
         (x, List.map map_to_string y.Ppextend.notation_printing_unparsing))
  |> List.map (fun (x, y) -> (x, List.concat y))

let extract_printing_rules_from_expressions code =
  let rec f parser =
    match Astparser.next parser with
    | None -> []
    | Some ast -> extract_notations_and_printing_rules ast :: f parser
  in
  f (Astparser.make code) |> List.concat
