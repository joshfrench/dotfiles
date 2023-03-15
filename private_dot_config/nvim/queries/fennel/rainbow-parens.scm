(list
  "(" @opening
  ")" @closing) @container

(table
  "{" @opening
  (":" @intermediate)?
  "}" @closing) @container

(sequential_table
  "[" @opening
  "]" @closing) @container

; (sequential_table_binding
;   "[" @opening
;   "]" @closing) @container

(fn
  "(" @opening
   ")" @closing) @container

(lambda
  "(" @opening
   ")" @closing) @container

(let
  "(" @opening
  ; ((let_clause) @intermediate)
  ")" @closing) @container

; possibilities from https://github.com/TravonteD/tree-sitter-fennel/tree/master/test/corpus
; let/let_clause
; sequential_table_binding
; sequential_table
; set, assignment, multi_value_assignment
; each
; collect, icollect
; iter_bindings
; for, for_clause
; match, sequential_table_pattern, table_pattern
; guard_pattern
; where_pattern
; multi_value_pattern
; accumulate
; vararg
; not quoted things?
