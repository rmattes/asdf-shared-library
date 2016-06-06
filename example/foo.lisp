
;;; From foo.c
(cffi:defcfun ("strange_number" strange-number) :int
  (in :int))

;;; From bar.c
(cffi:defcfun ("say_hello" say-hello) :void)
