;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! modus-themes)

(package! rmsbolt)

(package! whitespace4r
  :recipe (:type git
           :host github
           :protocol ssh
           :repo "twlz0ne/whitespace4r.el"))

;; Use the version that includes https://github.com/emacs-evil/evil-collection/pull/705/commits/30b5a2d79cd8526781ebe276223997b07645bef0
(unpin! evil-collection)
(package! evil-collection
  :pin "0df5c4815d7be01ab52e9f957c56e6318c871217"
  :recipe (:host github :repo "emacs-evil/evil-collection")
  )

;; Disable solaire-mode to make scrolling and cursor movement less painful on macOS
;; see https://github.com/doomemacs/doomemacs/issues/2217 for the details
(package! solaire-mode :disable t)

;; Fix broken ts-ls
;; https://github.com/doomemacs/doomemacs/issues/7540
(unpin! lsp-mode)

(package! annotate.el
  :recipe (:host github
           :repo "bastibe/annotate.el"))

(package! symex)
