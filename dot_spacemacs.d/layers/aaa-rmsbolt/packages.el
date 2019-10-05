;;; packages.el --- aaa-rmsbolt layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Anton Alekseev <anton [at] alekseev [dot] cc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `aaa-rmsbolt-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `aaa-rmsbolt/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `aaa-rmsbolt/pre-init-PACKAGE' and/or
;;   `aaa-rmsbolt/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst aaa-rmsbolt-packages
  '(rmsbolt
    popwin))

(defun aaa-rmsbolt/init-rmsbolt ()
  :init
  (progn (spacemacs/declare-prefix "ar" "rmsbolt")
         (spacemacs/set-leader-keys "ars" 'rmsbolt-mode))
  :config
  (spacemacs/set-leader-keys "arc" 'rmsbolt-compile))

(defun aaa-rmsbolt/pre-init-popwin ()
  (spacemacs|use-package-add-hook popwin
    :post-config
    (push
     '("*rmsbolt-output*"
       :dedicated t
       :position right
       :noselect t
       :width 0.5)
     popwin:special-display-config)))

;;; packages.el ends here
