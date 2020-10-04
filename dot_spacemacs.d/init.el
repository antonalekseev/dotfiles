;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     aaa-lispyville
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ansible
     (auto-completion :variables
                      spacemacs-default-company-backends '(company-yasnippet
                                                           (company-gtags company-etags company-keywords)
                                                           company-files
                                                           company-dabbrev)
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 2.0)
     ;; better-defaults
     bm
     common-lisp
     csv
     dap
     (dash :variables
           dash-docs-docset-newpath (concat (getenv "HOME")
                                            "/Library/Application Support/Dash/DocSets/"))
     docker
     emacs-lisp
     fzf
     (gtags :variables gtags-enable-by-default nil)
     git
     github
     (go :variables
         go-tab-width 4
         godoc-at-point-function 'godoc-gogetdoc
         go-use-golangci-lint t
         go-format-before-save t
         gofmt-command "goimports")
     (html :variables web-fmt-tool 'prettier)
     ipython-notebook
     ivy
     (json :variables json-fmt-tool 'prettier)
     (lsp :variables
          lsp-enable-symbol-highlighting nil
          lsp-ui-sideline-enable nil
          lsp-ui-doc-enable nil
          lsp-ui-flycheck-enable nil
          lsp-auto-guess-root t)
     (multiple-cursors :variables
                       multiple-cursors-backend 'evil-mc)
     aaa-nim
     (javascript :variables
                 javascript-fmt-tool 'prettier
                 javascript-backend 'lsp
                 js2-basic-offset 2
                 js-indent-level 2)
     markdown
     (org :variables
          org-confirm-babel-evaluate nil
          org-bullets-bullet-list '("■" "◆" "▲" "▶"))
     (python :variables
             python-backend 'lsp
             python-test-runner 'pytest
             python-formatter 'black
             python-auto-set-local-pyenv-version nil
             python-auto-set-local-pyvenv-virtualenv nil)
     racket
     restclient
     aaa-rmsbolt
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "zsh")
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil)
     (terraform :variables
                terraform-auto-format-on-save t)
     theming
     (version-control :variables
                      version-control-diff-tool 'diff-hl)
     yaml)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(test-simple
                                      evil-embrace
                                      direnv
                                      (dash-at-point :location
                                                     (recipe :fetcher github
                                                             :repo "antonalekseev/dash-at-point"
                                                             :branch "local"))
                                      keyfreq
                                      org-ref
                                      minimal-theme)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(overseer)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(minimal-light)
   ;; ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-default-font '("PragmataPro Liga"
                               :size 15
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Prettify titlebar on macOS
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . light))
  ;; Set frame dimensions on startup @pat
  (when (cl-equalp "pat" system-name)
    (progn (set-frame-width (selected-frame) 80)
           (set-frame-height (selected-frame) 50)))

  ;; Prevent emacs from cluttering init.el with custom settings
  (setq custom-file "~/.spacemacs.d/custom.el")

  ;; Resolve HTTP server port conflict with TW5
  (setq httpd-port 8081)

  ;; Unify diff-hl colours with magit-diff-*-highlight
  (setq-local theming-patch
              '((diff-hl-change :background "#eeeebb")
                (diff-hl-delete :background "#eecccc")
                (diff-hl-insert :background "#cceecc")))

  (setq-default theming-modifications
                (mapcar (lambda (x) (append (list x) theming-patch))
                        '(base16-grayscale-light
                          base16-grayscale-dark
                          base16-ocean))))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (use-package direnv
    :demand t
    :config
    (direnv-mode)
    (setq direnv-always-show-summary nil)
    :hook
    ((prog-mode) . direnv-update-environment))

  (use-package evil-embrace
    :config
    (evil-embrace-enable-evil-surround-integration))

  ;; Don't show *spacemacs* buffer at startup
  ;; https://github.com/syl20bnr/spacemacs/issues/6899#issue-172716215
  (when (string= "*scratch*" (buffer-name))
    (spacemacs/switch-to-scratch-buffer))

  ;; Don't highlight current line
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; Rebind SPC q q for convenience
  (spacemacs/set-leader-keys "qq" 'spacemacs/save-buffers-kill-emacs)
  (add-hook 'kill-emacs-query-functions
            (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
            'append)

  ;; Don't kill into system clipboard. Unfortunately, this way you can't paste
  ;; from system clipboard either and should use "+p instead
  (setq select-enable-clipboard t)

  ;; modes
  ;; =====

  ;; Tab indentation for shell scripts
  (add-hook 'sh-mode-hook
            (lambda () (setq
                        tab-width 4
                        sh-basic-offset 4
                        indent-tabs-mode t)))

  ;; Fix indentation of bulleted lists within block comments in racket-mode
  (add-hook 'racket-mode-hook
            (lambda() (setq-local adaptive-fill-mode t)))

  ;; Prog mode
  (add-hook 'prog-mode-hook
            (lambda () (spacemacs/toggle-fill-column-indicator-on)))

  ;; Enable Go Guru identifier highlighting
  (add-hook 'go-mode-hook 'go-guru-hl-identifier-mode)

  ;; Highlight changes on fly
  (diff-hl-flydiff-mode '(:global t))

  ;; Magit
  (with-eval-after-load 'magit (setq git-commit-summary-max-length 50))

  ;; Projectile
  (setq projectile-project-search-path '("~/p/"))

  ;; AsciiDoc
  (add-to-list 'auto-mode-alist '("\\.adoc\\'" . text-mode))

  ;; Counsel
  (when (eq system-type 'darwin)
    (setq counsel-locate-cmd 'counsel-locate-cmd-mdfind))

  ;; Don't highlight long lines in whitespace mode
  (with-eval-after-load 'whitespace (setq-default whitespace-style
                                                  (delete 'lines whitespace-style)))
  ;; Keyfreq
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  ;; LSP
  (add-hook 'view-mode-hook 'evil-evilified-state)
  (setq company-lsp-cache-candidates 'auto) 

  ;; Python
  (add-hook 'python-mode-hook (lambda ()
                                (progn
                                  (embrace-add-pair ?3 "\"\"\"" "\"\"\"")
                                  (embrace-build-help "\"\"\"" "\"\"\"")
                                  (setq python-shell-interpreter "python")
                                  (setq python-shell-interpreter-args "-i"))))

  ;; Org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp  . t)
     (python  . t)
     (shell  . t)
     ))

  ;; Markdown
  ;; Address syl20bnr/spacemacs#10836
  (with-eval-after-load 'markdown-mode (remove-hook 'markdown-mode-hook 'orgtbl-mode))

  ;; Enable semantic only for elisp-mode
  ;; from: https://emacs.stackexchange.com/a/15142
  (defun my-inhibit-semantic-p ()
    (not (equal major-mode 'elisp-mode)))

  (with-eval-after-load 'semantic
    (add-to-list 'semantic-inhibit-functions #'my-inhibit-semantic-p))

  ;; keys
  ;; ====

  ;; Set key for hippie-expand
  (global-set-key (kbd "<C-return>") 'hippie-expand)

  ;; Unshadow C-return in emmet-mode
  (with-eval-after-load 'emmet-mode
    (unbind-key "<C-return>" emmet-mode-keymap))

  ;; Set key for emmet-wrap-with-markup
  (spacemacs/set-leader-keys-for-major-mode 'web-mode
    "rW" 'emmet-wrap-with-markup)

  ;; Unshadow "q" binding in racket-describe mode
  ;; See also:
  ;; - https://github.com/noctuid/evil-guide#example-integration-with-pdf-tools
  ;; - https://github.com/greghendershott/racket-mode/blob/aea74aceddf112cdfb918aa5ddb9842f0d56c744/racket-complete.el#L292
  ;; - https://emacs.stackexchange.com/a/32133 (same issue solved another way)
  (evil-define-key 'normal racket-describe-mode-map
    "q" 'quit-window)

  ;; Use ESC to leave fzf mode ignoring all candidates
  ;; https://github.com/bling/fzf.el/issues/45#issuecomment-429893494
  (require 'term)
  (defun term-send-esc ()
    "Send ESC in term mode."
    (interactive)
    (term-send-raw-string "\e"))
  ;; to quit fzf with ESC key
  (define-key term-raw-map (kbd "<escape>") 'term-send-esc)
  (evil-set-initial-state 'term-mode 'emacs)

  ;; Toggle fullscreen on macOS
  (when (eq system-type 'darwin)
    (global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen))

  ;; ui
  ;; ==

  ;; Disable spacemacs startup screen, switch to *scratch* by default
  (setq inhibit-startup-screen t)
  (setq initial-buffer-choice t)

  ;; Spaceline
  (spaceline-toggle-hud-off)
  (spaceline-toggle-minor-modes-off)

  ;; yasnippet
  ;; =========

  ;; Don't expand snippets within fields
  (setq yas-triggers-in-field nil)

  (with-eval-after-load 'yasnippet
    (add-to-list 'yas-snippet-dirs "~/.spacemacs.d/snippets"))

  ;; Load custom-file if one exists
  (when (file-exists-p custom-file)
    (load-file custom-file)))

  ;; Make snippets work in fundamental mode
  ;; https://github.com/joaotavora/yasnippet/issues/557#issuecomment-72368826
  (add-hook 'yas-minor-mode-hook
            (lambda ()
              (yas-activate-extra-mode 'fundamental-mode)))
