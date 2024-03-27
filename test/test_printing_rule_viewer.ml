let test_list_unparsing () =
  Alcotest.(check (list (list string)))
    "Parsing an equality notation"
    (Printing_rule_viewer.unparse "Theorem foo:1=1.")
    [ [ "Box" ] ]

let test_extract_notations_from_expressions () =
  Alcotest.(check (list string))
    "same list"
    (Printing_rule_viewer.extract_notations_from_expressions
       [ "Theorem foo:1=1." ])
    [ "_ = _" ]

let () = Printing_rule_viewer.init ()

let () =
  Alcotest.run "Printing rule viewer"
    [
      ( "test suite",
        [
          Alcotest.test_case "Parsing an equality notation" `Quick
            test_list_unparsing;
          Alcotest.test_case "Extract notations from expressions" `Quick
            test_extract_notations_from_expressions;
        ] );
    ]
