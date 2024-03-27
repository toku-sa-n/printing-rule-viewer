let test_extract_notations_from_expressions () =
  Alcotest.(check (list string))
    "same list"
    (Printing_rule_viewer.extract_notations_from_expressions "Theorem foo:1=1.")
    [ "_ = _" ]

let () = Printing_rule_viewer.init ()

let () =
  let open Alcotest in
  Alcotest.run "Printing rule viewer"
    [
      ( "test suite",
        [
          test_case "Extract notations from expressions" `Quick
            test_extract_notations_from_expressions;
        ] );
    ]
