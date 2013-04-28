;;
;;
;;

(compile-file "ecl-cmd.lisp" :output-file "ecl-cmd.o" :system-p t)
(c::build-program "ecl-cmd.exe" :lisp-files '("ecl-cmd.o"))
(ext:quit 0)
