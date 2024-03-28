let test_cases_for_extract_notations_from_expressions =
  let check_f input expected () =
    Alcotest.(check (list string))
      "same list"
      (Printing_rule_viewer.View.extract_notations_from_expressions input)
      expected
  in

  let test_case msg input expected =
    Alcotest.test_case msg `Quick (check_f input expected)
  in

  [
    test_case "From an AST" "Theorem foo:1=1." [ "_ = _" ];
    test_case "From multiple ASTs" "Theorem foo:1=1. Abort. Theorem bar:1=1."
      [ "_ = _"; "_ = _" ];
    test_case "Nested" "Theorem foo:1=1->1=1." [ "_ -> _"; "_ = _"; "_ = _" ];
  ]

let test_cases_for_extract_printing_rules_from_expressions =
  let check_f input expected () =
    Alcotest.(check (list (pair string (list string))))
      "same list"
      (Printing_rule_viewer.View.extract_printing_rules_from_expressions input)
      expected
  in

  let test_case msg input expected =
    Alcotest.test_case msg `Quick (check_f input expected)
  in

  [ test_case "From an AST" "Theorem foo:1=1." [ ("_ = _", [ "Block" ]) ] ]

let () = Printing_rule_viewer.Init.init ()

let () =
  Alcotest.run "Printing rule viewer"
    [
      ( "extract_notations_from_expressions",
        test_cases_for_extract_notations_from_expressions );
      ( "extract_printing_rules_from_expressions",
        test_cases_for_extract_printing_rules_from_expressions );
    ]
