let test_list_unparsing () =
  Alcotest.(check (list (list string)))
    "Parsing an equality notation"
    (Printing_rule_viewer.unparse "Theorem foo:1=1.")
    [ [ "Box" ] ]

let test_one_equals_one () = Alcotest.(check int) "one equals one" 1 1

let () =
  Alcotest.run "Printing rule viewer"
    [
      ( "test suite",
        [
          Alcotest.test_case "Test 1 = 1" `Quick test_one_equals_one;
          Alcotest.test_case "Parsing an equality notation" `Quick
            test_list_unparsing;
        ] );
    ]
