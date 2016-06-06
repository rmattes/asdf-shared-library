(asdf:defsystem :foo
  :author "Nathan Nasenbaer"
  :license "GPLv2 or later"
  :version "0.1"
  :defsystem-depends-on (#:asdf-shared-library)
  :depends-on (#:cffi)
  :serial t
  :components
  ((:file "package")
   (:shared-library "libfoo"
                    :components ((:c-source "foo.c")
                                 (:c-header "foo.h")
                                 (:c-source "bar.c"))
                    :packages ("jack" "alsa"))
   (:file "foo")))
