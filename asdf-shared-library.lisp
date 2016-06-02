;;; -*- Mode: lisp -*-
;;;
;;; asdf-shared-library.lisp
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

(in-package #:asdf-shared-library)

(defclass shared-library ()
  ((so-file-type :accessor :so-file-type-of :initform  #+linux  "so" #+darwin "dly")
   (soures       :initarg  :sources         :accessor :sources-of  :initform ())
   (cflags       :initarg  :cflags          :accessor :cflags-of   :initform ())
   (libs         :initarg  :libs            :accessor :libs-of     :initform ())
   (packages     :initarg  :packages        :accessor :packages-of :initform ())
   )
  (:documentation
   "This ASDF component represent a shared library that will be
    loaded when the containing ASDF system gets loaded."))

(defmethod perform ((op compile-op) (component shared-library))
  (format *debug-io* "Compiling a shared library"))

(defmethod perform ((op load-op) (component shared-library))
  ;; FIXME: the real deal ...
  ;;  (cffi:load-foreign-library "")
  (format *debug-io* "Compiling a shared library"))

;; Allow for naked :grovel-file and :wrapper-file in asdf definitions.
;;; Register our component classes with asdf so we can use "naked"
;;; :shared-library and : c-source components in system definitions
(setf (find-class 'asdf::shared-library) (find-class 'shared-library))
; (setf (find-class 'asdf::c-source) (find-class 'c-source))


(asdf:defsystem :foo
  :serial t
  :components
  ((:shared-library "libfoo"
                    :sources ((:c-source "foo")
                              (:c-source "bar"))
                    :packages ("jack")
                    )))
