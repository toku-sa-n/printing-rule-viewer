let test_one_equals_one () = Alcotest.(check int) "one equals one" 1 1

let () =
  Alcotest.run "Printing rule viewer"
    [
      ( "test suite",
        [ Alcotest.test_case "Test 1 = 1" `Quick test_one_equals_one ] );
    ]
