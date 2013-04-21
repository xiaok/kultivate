
(define (inspect ff)
      (with-bindings ((*print-pretty* #t)
                      (*print-readably* #t))
        (let ((syms
               (filter ff (simple-sort (environment)))))
          (for-each (lambda (s)
                      (princ "\t")
                      (princ s)
                      (princ "\n"))
                    syms)
          (princ *linefeed*))))

(princ "\nBUILTINS:\n")
(inspect (lambda (s) (builtin? (top-level-value s))))

(princ "\nSYSTEM LIB:\n")
(inspect (lambda (s)
           (let ((excludes '(*linefeed* *directory-separator* *argv* that
                             *print-pretty* *print-width* *print-readably*
                             *print-level* *print-length* *os-name*)))
             (and (bound? s)
                  (not (constant? s))
                  (or (not (builtin? (top-level-value s)))
                      (not (equal? (string s) ; alias of builtin
                                   (string (top-level-value s)))))
                  (not (memq s excludes))
                  (not (iostream? (top-level-value s)))))))

(princ "\nMACROS:\n")
(table.foldl (lambda (name y z)
               (princ "\t")
               (princ name)
               (princ "\n"))
             ()
             *syntax-environment*)
