(lang dune 3.14)

(name printing_rule_viewer)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name printing_rule_viewer)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
  (alcotest :with-test)
  (coq
   (= 8.19.0))
  ocaml
  dune)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
