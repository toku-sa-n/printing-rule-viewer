let test_list_unparsing () =
  Alcotest.(check (list (list string)))
    "Parsing an equality notation"
    (Printing_rule_viewer.unparse "Theorem foo:1=1.")
    [ [ "Box" ] ]

let () = Printing_rule_viewer.init ()

let () =
  Alcotest.run "Printing rule viewer"
    [
      ( "test suite",
        [
          Alcotest.test_case "Parsing an equality notation" `Quick
            test_list_unparsing;
        ] );
    ]
