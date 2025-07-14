;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Anton Alekseev"
      user-mail-address "anton@alekseev.cc")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font "PragmataPro-16")

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Parameters for the initial frame
 (setq initial-frame-alist
       '((top . 1) (left . 1) (width . 85) (height . 40)))

;; Prefer vertical splits
(setq split-width-threshold nil
      split-height-threshold 1)

(after! magit
  (setq-default +magit-open-windows-in-direction 'down))

;; Use M-less alt-leader keys
( setq doom-leader-alt-key "C-SPC"
       doom-localleader-alt-key "C-SPC m")

;; Don't create per-project workspaces
(setq +workspaces-on-switch-project-behavior nil)

;; Disable modeline icons as advised here
;; https://github.com/seagle0128/doom-modeline/issues/558#issuecomment-1220565602
(after! doom-modeline
  (setq doom-modeline-height 1
        doom-modeline-bar-width 0
        doom-modeline-icon nil
        doom-modeline-lsp-icon nil))

;; Projectile
(after! projectile
  (setq projectile-project-search-path '(
                                         "~/p/"
                                         ("~/workspace/antonalekseev" . 2)
                                         ("~/workspace/" . 4))))
;; Multiple cursors
(after! evil-multiedit
  (evil-multiedit-default-keybinds))

;; Trigger company-mode completion manually
(after! company
  (setq company-idle-delay nil))

;; Key bindings
(map! "C-," 'company-complete
      :leader
      :desc "Set input method" "\\" #'set-input-method
      :desc "Run RMSbolt" "c g" #'rmsbolt-compile
      :desc "Show non-printable chars" "t s" #'whitespace-mode)

(map!
 (:when (modulep! :completion vertico)
   (:after vertico
    :map vertico-map
    (:when (modulep! :editor evil +everywhere)
      "C-h"  #'vertico-directory-up
      "C-l"  #'vertico-directory-enter))))

;; Suppress annoying "Warning: docstring has wrong usage of unescaped single quotes (use \= or different quoting)"
;; https://yhetil.org/emacs-devel/87pmjl2br2.fsf@posteo.net/
(setq byte-compile-warnings (not 'docstrings))

;; Set remote type to `gitlab` for URLs starting with `gitlab.`
(after! browse-at-remote
  (add-to-list 'browse-at-remote-remote-type-regexps
               '("^gitlab\\..*" . "gitlab")))

;; Use GNU grep on macOS for faster `consult-grep`
;; `doom doctor` is still complaining, because of hard-coded `grep` command
(after! consult
  (when IS-MAC (setq consult-grep-args (append '("ggrep") (cdr consult-grep-args) ))))

;; LSP
(after! lsp-mode
  (setq lsp-go-use-gofumpt t
        lsp-headerline-breadcrumb-icons-enable nil
        lsp-modeline-code-action-icons-enable nil
        lsp-modeline-code-actions-enable nil))

;; annotate.el
;; Source https://github.com/danilevy1212/doom#annotateel

;; Activate `annotate-mode` in file buffers that have annotations.
(use-package! annotate
  :commands (annotate-load-annotation-data))

(add-hook! find-file
  (let ((file-name (buffer-file-name))
        (annotation-files (mapcar #'car (annotate-load-annotation-data t))))
    (when (and file-name
               (member file-name annotation-files))
      (annotate-mode +1))))

;; The current database for annotations is contained in the file indicated by the variable annotate-file.
(after! annotate
  (setq annotate-file (expand-file-name "annotate" doom-cache-dir)))

;; Key bindings.
(after! annotate
  (setq annotate-mode-map (make-sparse-keymap))
  (map! :map annotate-mode-map
        :leader
        :prefix ("b a" . "annotate")
        "a" #'annotate-annotate
        "d" #'annotate-delete-annotation
        "s" #'annotate-show-annotation-summary
        "]" #'annotate-goto-next-annotation
        "[" #'annotate-goto-previous-annotation))

;; symex
(use-package symex
  :config
  (symex-initialize)
  (global-set-key (kbd "C-;") 'symex-mode-interface))

;; LaTeX
(setq +latex-viewers '(pdf-tools))

;; whitespace-mode
;; revert Doom-specific whitespace-mode behaviour, instead toggle whitespace-mode manually
;; $HOME/.emacs.d/modules/config/default/config.el
;; https://github.com/doomemacs/doomemacs/issues/2673#issuecomment-595361339
(remove-hook 'after-change-major-mode-hook #'+emacs-highlight-non-default-indentation-h)
(setq whitespace-style '(face tabs spaces trailing lines space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark missing-newline-at-eof))
