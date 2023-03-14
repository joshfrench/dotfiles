(list
  "(" @opening
  ")" @closing) @container

(fn
  (("(" @opening)
   (")" @closing))) @container

(parameters
  "[" @opening
  "]" @closing) @container

; possibilities from https://github.com/TravonteD/tree-sitter-fennel/tree/master/test/corpus
; let/let_clause
; binding/multi_value_binding
; table
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
; 

; (vec_lit
;   "[" @opening
;   "]" @closing) @container

; (map_lit
;   "{" @opening
;   "}" @closing) @container

; (set_lit
;   "{" @opening
;   "}" @closing) @container

; (anon_fn_lit
;   "(" @opening
;   ")" @closing) @container
