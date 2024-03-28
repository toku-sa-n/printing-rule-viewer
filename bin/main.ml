let input () =
  let rec loop acc =
    match read_line () with
    | line -> loop (line :: acc)
    | exception End_of_file -> List.rev acc |> String.concat "\n"
  in
  loop []

let () = Printing_rule_viewer.Init.init ()

let () =
  input () |> Printing_rule_viewer.View.extract_notations_from_expressions
  |> List.iter print_endline
