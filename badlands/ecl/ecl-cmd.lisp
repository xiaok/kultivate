#|
To create a program called ls.exe type the following lines
from a lisp prompt:

(compile-file "ecl-cmd.lisp" :output-file "ecl-cmd.o" :system-p t)
(c::build-program "ecl-cmd.exe" :lisp-files '("ecl-cmd.o"))

NOTE: The content of this file must match the example in the
      documentation.
|#
(setq ext:*help-message* "
ecl-cmd usage:
\t nothing
")

(defun default-behaviour (args)
  (format t "~A~%" args))

(defconstant +ls-rules+
  '(("--help" 0 (progn (princ ext:*help-message* *standard-output*) (ext:quit 0)))
    ("-?" 0 (progn (princ ext:*help-message* *standard-output*) (ext:quit 0)))
    ("*DEFAULT*" 1 (default-behaviour 1) :stop)))

(let ((ext:*lisp-init-file-list* NIL)) ; No initialization files
  (handler-case (ext:process-command-args :rules +ls-rules+)
    (error (c)
      (princ ext:*help-message* *error-output*)
      (ext:quit 1))))
(ext:quit 0)
