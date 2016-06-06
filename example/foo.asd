;;; -*- Mode: lisp -*-
;;;
;;; foo.asd
;;;
;;; Copyright (C) 2016, Ralf Mattes <rm@mh.freiburg.de>
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


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
