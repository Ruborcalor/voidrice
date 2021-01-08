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
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private/layers")

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     pdf
     ansible
     terraform
     typescript
     vimscript
     auto-completion
     (ocaml :variables ocaml-format-on-save t)
     ;; spacemail
     (mu4e :variables mu4e-spacemacs-layout-name "@Mu4e"
           mu4e-spacemacs-layout-binding "m"
           mu4e-spacemacs-kill-layout-on-exit t
           mu4e-use-maildirs-extension t
           mu4e-enable-async-operations t)
     neotree
     tide
     (javascript :variables
                 javascript-backend 'tide
                 javascript-fmt-tool 'prettier
                 js2-basic-offset 2
                 js-indent-level 2)
     react
     octave
     lua
     rust
     html
     (python :variables python-backend 'lsp python-lsp-server 'pyright)
     (ranger :variables
             ranger-show-preview t)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     (auto-completion :variables auto-completion-enable-snippets-in-popup t auto-completion-enable-sort-by-usage t)
     tern
     better-defaults
     evil-commentary
     emacs-lisp
     git
     helm
     lsp
     markdown
     multiple-cursors
     ;; journal
     ;; rust
     (org :variables
          org-enable-hugo-support t
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-enable-org-journal-support t
          org-enable-hugo-support t
          org-enable-roam-support t
          org-project-file ".projects"
          org-want-todo-bindings t)
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/usr/bin/zsh"
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     treemacs
     (latex :variables
            latex-build-command "LaTeX"
            latex-enable-magic nil
            latex-enable-auto-fill nil)
     ;; latex-enable-folding t

     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      yasnippet-classic-snippets
                                      evil-org
                                      format-all
                                      anki-editor
                                      org-super-agenda
                                      org-roam
                                      org-noter
                                      org-gcal
                                      react-snippets
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default spacemacs-27.1.pdmp)
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

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

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         gruvbox
                         dracula)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq which-key-allow-multiple-replacements nil)

  (require 'package)
  (server-start)
  ;; (package-initialize)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

  (fset 'evil-visual-update-x-selection 'ignore)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (provide 'org-archive-subtree-hierarchical)
  (require 'org-archive)

  (defun org-archive-subtree-hierarchical--line-content-as-string ()
    "Returns the content of the current line as a string"
    (save-excursion
      (beginning-of-line)
      (buffer-substring-no-properties
       (line-beginning-position) (line-end-position))))

  (defun org-archive-subtree-hierarchical--org-child-list ()
    "This function returns all children of a heading as a list. "
    (interactive)
    (save-excursion
      ;; this only works with org-version > 8.0, since in previous
      ;; org-mode versions the function (org-outline-level) returns
      ;; gargabe when the point is not on a heading.
      (if (= (org-outline-level) 0)
          (outline-next-visible-heading 1)
        (org-goto-first-child))
      (let ((child-list (list (org-archive-subtree-hierarchical--line-content-as-string))))
        (while (org-goto-sibling)
          (setq child-list (cons (org-archive-subtree-hierarchical--line-content-as-string) child-list)))
        child-list)))

  (defun org-archive-subtree-hierarchical--org-struct-subtree ()
    "This function returns the tree structure in which a subtree
  belongs as a list."
    (interactive)
    (let ((archive-tree nil))
      (save-excursion
        (while (org-up-heading-safe)
          (let ((heading
                 (buffer-substring-no-properties
                  (line-beginning-position) (line-end-position))))
            (if (eq archive-tree nil)
                (setq archive-tree (list heading))
              (setq archive-tree (cons heading archive-tree))))))
      archive-tree))

  (defun org-archive-subtree-hierarchical ()
    "This function archives a subtree hierarchical"
    (interactive)
    (let ((org-tree (org-archive-subtree-hierarchical--org-struct-subtree))
          (this-buffer (current-buffer))
          (file (abbreviate-file-name
                 (or (buffer-file-name (buffer-base-buffer))
                     (error "No file associated to buffer")))))
      (save-excursion
        (setq location org-archive-location
              afile (car (org-archive--compute-location
  		                   (or (org-entry-get nil "ARCHIVE" 'inherit) location)))
              ;; heading (org-extract-archive-heading location)
              infile-p (equal file (abbreviate-file-name (or afile ""))))
        (unless afile
          (error "Invalid `org-archive-location'"))
        (if (> (length afile) 0)
            (setq newfile-p (not (file-exists-p afile))
                  visiting (find-buffer-visiting afile)
                  buffer (or visiting (find-file-noselect afile)))
          (setq buffer (current-buffer)))
        (unless buffer
          (error "Cannot access file \"%s\"" afile))
        (org-cut-subtree)
        (set-buffer buffer)
        (org-mode)
        (goto-char (point-min))
        (while (not (equal org-tree nil))
          (let ((child-list (org-archive-subtree-hierarchical--org-child-list)))
            (if (member (car org-tree) child-list)
                (progn
                  (search-forward (car org-tree) nil t)
                  (setq org-tree (cdr org-tree)))
              (progn
                (goto-char (point-max))
                (newline)
                (org-insert-struct org-tree)
                (setq org-tree nil)))))
        (newline)
        (org-yank)
        (when (not (eq this-buffer buffer))
          (save-buffer))
        (message "Subtree archived %s"
                 (concat "in file: " (abbreviate-file-name afile))))))

  (defun org-insert-struct (struct)
    "TODO"
    (interactive)
    (when struct
      (insert (car struct))
      (newline)
      (org-insert-struct (cdr struct))))

  (setq org-archive-default-command #'org-archive-subtree-hierarchical)

  ;; ;; archive subtree better
  ;; (defadvice org-archive-subtree (around fix-hierarchy activate)
  ;;   (let* ((fix-archive-p (and (not current-prefix-arg)
  ;;                              (not (use-region-p))))
  ;;          (afile (org-extract-archive-file (org-get-local-archive-location)))
  ;;          (buffer (or (find-buffer-visiting afile) (find-file-noselect afile))))
  ;;     ad-do-it
  ;;     (when fix-archive-p
  ;;       (with-current-buffer buffer
  ;;         (goto-char (point-max))
  ;;         (while (org-up-heading-safe))
  ;;         (let* ((olpath (org-entry-get (point) "ARCHIVE_OLPATH"))
  ;;                (path (and olpath (split-string olpath "/")))
  ;;                (level 1)
  ;;                tree-text)
  ;;           (when olpath
  ;;             (org-mark-subtree)
  ;;             (setq tree-text (buffer-substring (region-beginning) (region-end)))
  ;;             (let (this-command) (org-cut-subtree))
  ;;             (goto-char (point-min))
  ;;             (save-restriction
  ;;               (widen)
  ;;               (-each path
  ;;                 (lambda (heading)
  ;;                   (if (re-search-forward
  ;;                        (rx-to-string
  ;;                         `(: bol (repeat ,level "*") (1+ " ") ,heading)) nil t)
  ;;                       (org-narrow-to-subtree)
  ;;                     (goto-char (point-max))
  ;;                     (unless (looking-at "^")
  ;;                       (insert "\n"))
  ;;                     (insert (make-string level ?*)
  ;;                             " "
  ;;                             heading
  ;;                             "\n"))
  ;;                   (cl-incf level)))
  ;;               (widen)
  ;;               (org-end-of-subtree t t)
  ;;               (org-paste-subtree level tree-text))))))))

  ;; https://develop.spacemacs.org/layers/+completion/auto-completion/README.html for nicer looking faces auto-completion
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

  ;; word wrapping
  (setq-default word-wrap t)

  (setq-default TeX-engine 'luatex)

  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        ;; org-latex-pdf-process
        ;; '("xelatex"
        ;;   "xelatex")
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
  )

  ;; (customize-set-value 'org-latex-with-hyperref nil)

  ;; ;; use msmtp as a sendmail replacement to send mails
  ;; (setq message-send-mail-function 'message-send-mail-with-sendmail)
  ;; (setq sendmail-program "/usr/bin/msmtp")
  ;; ;; get the "From:" address from the envelope Emacs generates
  ;; (setq message-sendmail-envelope-from 'header)

  (global-auto-revert-mode t)

  ;; auto expand yas snippet if it has auto
  (defun my-yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))
  (add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)

  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

  (setq ac-dwim t)
  (ac-config-default)
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-abbrev
                     ac-source-words-in-same-mode-buffers))

  (ac-set-trigger-key "TAB")

  (add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser) t)

  (add-to-list 'load-path "/home/gautierk/.emacs-conf/")
  (add-to-list 'load-path "/home/gautierk/.emacs-conf/emacs-calfw")
  ;; (require 'mu4e-multi)
  ;; (require 'react-snippets)
  ;; (setq cfw:org-agenda-schedule-args '(:timestamp))
  (require 'calfw)
  (require 'calfw-org)


  ;; (setq mu4e-multi-account-alist
  ;;       '(("gautier"
  ;;          (user-mail-address . "g.cole.killian@gmail.com")
  ;;          (mu4e-drafts-folder . "/gautier/[Gmail].Drafts")
  ;;          (mu4e-follow-up-folder . "/gautier/FollowUp")
  ;;          (mu4e-hold-folder . "/gautier/Hold")
  ;;          (mu4e-refile-folder . "/gautier/[Gmail].All Mail")
  ;;          (mu4e-sent-folder . "/gautier/")
  ;;          (mu4e-trash-folder . "/gautier/Trash"))
  ;;         ("mcgill"
  ;;          (user-mail-address . "gautier.killian@mail.mcgill.ca")
  ;;          (mu4e-drafts-folder . "/mcgill/Drafts")
  ;;          (mu4e-follow-up-folder . "/mcgill/FollowUp")
  ;;          (mu4e-hold-folder . "/mcgill/Hold")
  ;;          (mu4e-refile-folder . "/mcgill/Archived")
  ;;          (mu4e-sent-folder . "/mcgill/Sent")
  ;;          (mu4e-trash-folder . "/mcgill/Trash"))))

  ;; (mu4e-multi-enable)

  ;; (add-hook 'message-send-mail-hook 'mu4e-multi-smtpmail-set-msmtp-account)
  ;; (setq mu4e-contexts
  ;;   `( ,(make-mu4e-context
  ;;   :name "Gautier"
  ;;   :enter-func (lambda () (mu4e-message "Switch to the Gautier context"))
  ;;   ;; leave-func not defined
  ;;   :match-func (lambda (msg)
  ;;     (when msg
  ;;       (mu4e-message-contact-field-matches msg
  ;;         :to "g.cole.killian@gmail.com")))
  ;;   :vars '(  ( user-mail-address      . "g.cole.killian@gmail.com"  )
  ;;      ( user-full-name     . "Cole Killian" )
  ;;      ( mu4e-compose-signature .
  ;;        (concat
  ;;          "Cole Killian\n"
  ;;          "Lauttasaari, Finland\n"))))
  ;;      ,(make-mu4e-context
  ;;   :name "Cole"
  ;;   :enter-func (lambda () (mu4e-message "Switch to the Cole context"))
  ;;   ;; leave-fun not defined
  ;;   :match-func (lambda (msg)
  ;;     (when msg
  ;;       (mu4e-message-contact-field-matches msg
  ;;         :to "cole@colekillian.com")))
  ;;   :vars '(  ( user-mail-address      . "cole@colekillian.com" )
  ;;      ( user-full-name     . "Cole Killian" )
  ;;      ( mu4e-compose-signature .
  ;;        (concat
  ;;          "Cole Killian\n"
  ;;          "Miskatonic University, Dept. of Occult Sciences\n"))))))

  ;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
  ;; guess or ask the correct context, e.g.

  ;; start with the first (default) context;
  ;; default is to ask-if-none (ask when there's no context yet, and none match)
  ;; (setq mu4e-context-policy 'pick-first)

  ;; compose with the current context is no context matches;
  ;; default is to ask
  ;; (setq mu4e-compose-context-policy nil)

  ;; Standard key bindings
  (spacemacs/set-leader-keys "o l" 'org-store-link)
  (spacemacs/set-leader-keys "o a" 'org-agenda)
  (spacemacs/set-leader-keys "o b" 'org-switchb)
  ;; (spacemacs/set-leader-keys "z b" 'org-switchb)

  (define-key evil-insert-state-map (kbd "C-l") 'sp-up-sexp)

  (use-package magit-popup
    :ensure t ; make sure it is installed
    :demand t ; make sure it is loaded
    )

  (use-package org-pomodoro
    :ensure t
    :commands (org-pomodoro)
    :config
    (setq
     alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))
     org-pomodoro-length 50
     org-pomodoro-short-break-length 10
     ))

  (defun ruborcalor/org-pomodoro-time ()
    "Return the remaining pomodoro time"
    (if (org-pomodoro-active-p)
        (cl-case org-pomodoro-state
          (:pomodoro
             (format "Pomo: %d minutes - %s" (/ (org-pomodoro-remaining-seconds) 60) org-clock-heading))
          (:short-break
           (format "Short break time: %d minutes" (/ (org-pomodoro-remaining-seconds) 60)))
          (:long-break
           (format "Long break time: %d minutes" (/ (org-pomodoro-remaining-seconds) 60)))
          (:overtime
           (format "Overtime! %d minutes" (/ (org-pomodoro-remaining-seconds) 60))))
      "No active pomo"))

  (with-eval-after-load "ox-latex"
    (add-to-list 'org-latex-classes
                 '("koma-article" "\\documentclass{scrartcl}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


  ;; (setq org-reveal-root "file:///home/gautierk/.npm-global/lib/node_modules/reveal.js/")
  (setq org-re-reveal-root "file:///home/gautierk/.npm-global/lib/node_modules/reveal.js/")

  (setq tramp-histfile-override "/dev/null")
  ;; These variables control whether separate commands are bound in the GUI to
  ;; the key pairs C-i, TAB and C-m, RET.
  ;; Setting it to a non-nil value, allows for separate commands under <C-i>
  ;; and TAB or <C-m> and RET.
  ;; In the terminal, these pairs are generally indistinguishable, so this only
  ;; works in the GUI. (default nil)
  dotspacemacs-distinguish-gui-tab t

  ;; always start clock from last stopping point
  (setq org-clock-continuously t)
  ;; (setq org-archive-default-command #'org-archive-subtree-hierarchically)

  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    )
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  (setq neo-vc-integration '(char))

  (setq terminal-here-terminal-command (list "st"))
  (spacemacs/toggle-auto-fill-mode-off)
  (setq projectile-require-project-root t)
  (setq projectile-git-submodule-command nil)
  (setq org-habit-show-all-today t)
  (setq org-use-fast-todo-selection 'expert)
  (setq spaceline-org-clock-p t)
  (setq js-indent-level 2)
  (setq prettier-js-args '(
                           "--tab-width" "2"
                           ))
  (setq prettier-html-args '(
                             "--tab-width" "2"
                             ))

  (setq org-hugo-default-section-directory "post")
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (setq scroll-margin 5
        scroll-preserve-screen-position t)

  ;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; (eval-after-load "tex"
  ;;   '(progn
  ;;      (add-to-list TeX-view-program-selection '(output-pdf "Zathura"))))
  ;; (setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
  ;;                                  ;(add-to-list 'TeX-command-list '("View" "evince %g" TeX-run-command nil t :help "Run evince on your document"))
  ;; (setq TeX-view-program-selection '((output-pdf "Evince")))))

  ;; (add-to-list TeX-view-program-selection '(output-pdf "Zathura"))

  ;; Use pdf-tools to open PDF files

  ;; (add-to-list TeX-view-program-selection '(output-pdf "Zathura"))
  (setq TeX-view-program-selection '((output-pdf "Zathura")))
  ;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
  ;;       TeX-source-correlate-start-server t)

  ;; ;; Update PDF buffers after successful LaTeX runs
  ;; (add-hook 'TeX-after-compilation-finished-functions
  ;;           #'TeX-revert-document-buffer)

  ;; (use-package ox-hugo
  ;;   :ensure t          ;Auto-install the package from Melpa (optional)
  ;;   :after ox)


  ;; ;; Populates only the EXPORT_FILE_NAME property in the inserted headline.
  ;; (with-eval-after-load 'org-capture
  ;;   )

  ;; (use-package ox-reveal
  ;;   :ensure t          ;Auto-install the package from Melpa (optional)
  ;;   :after ox)




  (use-package anki-editor
    :after org
    :bind (:map org-mode-map
                ("<f12>" . anki-editor-cloze-region-auto-incr)
                ("<f11>" . anki-editor-cloze-region-dont-incr)
                ("<f10>" . anki-editor-reset-cloze-number)
                ("<f9>"  . anki-editor-push-tree))
    :hook (org-capture-after-finalize . anki-editor-reset-cloze-number) ; Reset cloze-number after each capture.
    :config
    (setq anki-editor-create-decks t ;; Allow anki-editor to create a new deck if it doesn't exist
          anki-editor-org-tags-as-anki-tags t)

    (defun anki-editor-cloze-region-auto-incr (&optional arg)
      "Cloze region without hint and increase card number."
      (interactive)
      (anki-editor-cloze-region my-anki-editor-cloze-number "")
      (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
      (forward-sexp))
    (defun anki-editor-cloze-region-dont-incr (&optional arg)
      "Cloze region without hint using the previous card number."
      (interactive)
      (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
      (forward-sexp))
    (defun anki-editor-reset-cloze-number (&optional arg)
      "Reset cloze number to ARG or 1"
      (interactive)
      (setq my-anki-editor-cloze-number (or arg 1)))
    (defun anki-editor-push-tree ()
      "Push all notes under a tree."
      (interactive)
      (anki-editor-push-notes '(4))
      (anki-editor-reset-cloze-number))
    ;; Initialize
    (anki-editor-reset-cloze-number)
    )


  ;; (add-to-list TeX-view-program-selection '(output-pdf "Zathura"))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
    )
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-w") 'evil-delete-backward-word)
    )

  (with-eval-after-load 'org
    (setq org-directory "~/.org")
    (setq org-roam-directory "~/.org/roam")
    (setq org-use-fast-todo-selection t)
    (setq org-journal-dir "~/.org/journal")
    (setq org-default-notes-file "~/.org/agenda/inbox.org")
    (setq org-startup-truncated nil)
    ;; (setq org-super-agenda-mode t)
    (setq org-agenda-files '("~/.org/agenda/inbox.org"
                             "~/.org/agenda/todo.org"
                             "~/.org/agenda/school.org"
                             "~/.org/agenda/work.org"
                             "~/.org/agenda/timetracking.org"
                             "~/.org/agenda/schedule.org"
                             "~/.org/agenda/all-posts.org"
                             "~/.org/agenda/projects.org"))


    (setq org-highlight-latex-and-related '(latex))

    (defun org-hugo-new-subtree-post-capture-template ()
      "Returns `org-capture' template string for new Hugo post.
       See `org-capture-templates' for more information."
      (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
             (fname (org-hugo-slug title)))
        (mapconcat #'identity
                   `(
                     ,(concat "* TODO " title)
                     ":PROPERTIES:"
                     ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                     ":EXPORT_FILE_NAME: index"
                     ":END:"
                     "%?\n")                ;Place the cursor here finally
                   "\n")))


    ;; (require 'org-tempo)
    ;; (require 'org-protocol)
    ;; (require 'org-roam-protocol)

    (add-to-list 'org-modules 'org-protocol)
    (add-to-list 'org-modules 'org-habit)

    (use-package org-roam
      :ensure t
      :custom
      (org-roam-directory "/home/gautierk/.org/roam/")
      :config
      (setq org-roam-completion-everywhere t)
      )

    ;; (use-package org-roam
    ;;   :ensure t
    ;;   :hook
    ;;   (after-init . org-roam-mode)
    ;;   :custom
    ;;   (org-roam-directory "/home/gautierk/.org/roam/")
    ;;   :config
    ;;   (setq org-roam-completion-everywhere t)
    ;;   :init
    ;;   (progn
    ;;     ;; (spacemacs/declare-prefix "af" "org-roam")
    ;;     (spacemacs/set-leader-keys
    ;;       "afl" 'org-roam
    ;;       "aft" 'org-roam-dailies-today
    ;;       "aff" 'org-roam-find-file
    ;;       "afg" 'org-roam-graph)

    ;;     ;; (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
    ;;     (spacemacs/set-leader-keys-for-major-mode 'org-mode
    ;;       "fl" 'org-roam
    ;;       "ft" 'org-roam-dailies-today
    ;;       "fb" 'org-roam-switch-to-buffer
    ;;       "ff" 'org-roam-find-file
    ;;       "fi" 'org-roam-insert
    ;;       "fI" 'org-roam-insert-immediate
    ;;       "fg" 'org-roam-graph)))

    ;; (use-package org-roam-server
    ;;   :ensure t
    ;;   :config
    ;;   (setq org-roam-server-host "0.0.0.0"
    ;;         org-roam-server-port 8080
    ;;         org-roam-server-authenticate nil
    ;;         org-roam-server-export-inline-images t
    ;;         org-roam-server-serve-files nil
    ;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
    ;;         org-roam-server-network-poll t
    ;;         org-roam-server-network-arrows nil
    ;;         org-roam-server-network-label-truncate t
    ;;         org-roam-server-network-label-truncate-length 60
    ;;         org-roam-server-network-label-wrap-length 20))
      ;; :bind (:map org-roam-mode-map
      ;;             (("C-c n l" . org-roam)
      ;;              ("C-c n f" . org-roam-find-file)
      ;;              ("C-c n g" . org-roam-graph-show))
      ;;             :map org-mode-map
      ;;             (("C-c n i" . org-roam-insert))
      ;;             (("C-c n I" . org-roam-insert-immediate))))

    (setq org-agenda-custom-commands
          '(("n" "Next View"
             ((agenda "" ((org-agenda-span 'day)
                          (org-super-agenda-groups
                           '((:name "Today"
                                    :time-grid t
                                    :todo "TODAY"
                                    :scheduled today
                                    :order 0)
                             (:habit t)
                             (:name "Scheduled Soon"
                                    :scheduled future
                                    :order 2)
                             (:name "Due Today"
                                    :deadline today
                                    :order 3)
                             (:name "Due Soon"
                                    :deadline future
                                    :order 8)
                             (:name "Overdue"
                                    :deadline past
                                    :order 7)
                             ))))
              (alltodo "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Inbox"
                                  :file-path "inbox"
                                  :order 0
                                  )
                           (:discard (:todo "TODO"))
                           (:auto-category t
                                           :order 9)
                           ))))))
            ("t" "Todo View"
             (
              (todo "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Inbox"
                                  :file-path "inbox"
                                  :order 0
                                  )
                           (:auto-category t
                                           :order 9)
                           ))))))
            ))

    (org-super-agenda-mode)



    )


  (setq line-move-visual t)
  (spacemacs/set-leader-keys "a o C e" 'org-clock-modify-effort-estimate)
  (spacemacs/set-leader-keys "p i" 'projectile-add-known-project)
  ;; (spacemacs/set-leader-keys "h s" 'hugo-server)
  ;; (spacemacs/set-leader-keys "h e" 'hugo-new-post)
  ;; ;; (define-key my-keys-minor-mode-map (kbd "C-c C-h p") 'hugo-publish)
  ;; (spacemacs/set-leader-keys "h u" 'hugo-undraft)

  (setq create-lockfiles nil)


  (spacemacs/set-leader-keys "a o j r"
    (lambda() (interactive) (org-journal-new-entry t)))

  (use-package evil-org
    :ensure t
    :after org
    :config
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook
              (lambda ()
                (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
                )))


  ;;
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;;
  ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 23)
  ;; ;; Resume clocking task on clock-in if the clock is open
  ;; (setq org-clock-in-resume nil)
  ;; ;; Change tasks to NEXT when clocking in
  ;; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;; ;; Separate drawers for clocking and logs
  ;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; Save clock data and state changes and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; ;; Do not prompt to resume an active clock
  ;; (setq org-clock-persist-query-resume nil)
  ;; ;; Enable auto clock resolution for finding open clocks
  ;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "orange" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))

  (setq org-startup-indented t)
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  (setq org-my-anki-file "~/.org/anki.org")
  (setq org-capture-templates
        (quote (
                ("t" "todo" entry (file "~/.org/agenda/inbox.org")
                 "* TODO %?\n%U\n" :clock-in t :clock-resume t)
                ("r" "respond" entry (file "~/.org/agenda/inbox.org")
                 "%a\n" :clock-in t :clock-resume t :immediate-finish t)
                ;; ("n" "note" entry (file "~/.org/agenda/inbox.org")
                ;;  "* %? :NOTE:\n%U\n" :clock-in t :clock-resume t)
                ("j" "Journal" entry (file+datetree "~/.org/journal/diary.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("s" "Story" entry (file+datetree "~/.org/dailystory.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("d" "Draft" entry (file+datetree "~/.org/drafts.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("m" "Meeting" entry (file "~/.org/agenda/inbox.org")
                 "* TODO Meeting with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                ;; ("p" "Phone call" entry (file "~/.org/agenda/inbox.org")
                ;;  "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("h" "Habit" entry (file "~/.org/agenda/inbox.org")
                 "* TODO %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:END:\n")
                )))


  ;; Org-capture templates
  (add-to-list 'org-capture-templates
               '("a" "Anki basic"
                entry
                (file+headline org-my-anki-file "Dispatch Shelf")
                "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Mega\n:END:\n** Front\n%?\n** Back\n%x\n"))

  (add-to-list 'org-capture-templates
               '("A" "Anki cloze"
                entry
                (file+headline org-my-anki-file "Dispatch Shelf")
                "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: Mega\n:END:\n** Text\n%x\n** Extra\n"))

  (add-to-list 'org-capture-templates
               '("l" "Log tracking"
                 entry
                 (file+datetree "~/.org/agenda/timetracking.org")
                 "* %? %^g\n" :clock-in t :clock-resume t))

  (add-to-list 'org-capture-templates
               '("p"                ;`org-capture' binding + h
                 "Hugo Post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "agenda/all-posts.org" "Posts")
                 (function org-hugo-new-subtree-post-capture-template)))

  ;; ;; Allow Emacs to access content from clipboard.
  ;; (setq x-select-enable-clipboard t
  ;;       x-select-enable-primary t)

  (setq org-refile-targets '(("~/.org/agenda/todo.org" :maxlevel . 3)
                             ("~/.org/agenda/projects.org" :maxlevel . 3)
                             ("~/.org/agenda/work.org" :maxlevel . 3)
                             ("~/.org/agenda/school.org" :maxlevel . 3)
                             ("~/.org/agenda/org-roam.org" :maxlevel . 3)
                             ("~/.org/agenda/someday.org" :maxlevel . 3)))

                                        ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;; (setq org-refile-targets (quote ((nil :maxlevel . 5)
  ;;                                  (org-agenda-files :maxlevel . 5))))

  ; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path 'file)

  ; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

  ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;; Hugo Stuff
  ;; More here https://blog.tohojo.dk/2015/10/integrating-hugo-into-emacs.html

  (setq hugo-base-dir "~/Projects/cole-website/"
        hugo-buffer "*hugo*")
  (defun hugo-server (&optional arg)
    (interactive "P")
    (let* ((default-directory (concat (expand-file-name hugo-base-dir) "/"))
           (proc (get-buffer-process hugo-buffer)))
      (if (and proc (process-live-p proc))
          (progn (interrupt-process proc)
                 (message "Stopped Hugo server"))
        (start-process "hugo" hugo-buffer "hugo" "server" "--buildDrafts" "--watch" "-d" "dev" "--disableFastRender")
        (message "Started Hugo server")
        (unless arg
          (browse-url "http://localhost:1313/")))))

  (defvar valeriy-alist '((?1 "Posts" "posts/")
                          (?2 "Snippets" "snippets/"))
    "List that associates number letters to descriptions and actions.")


  (defun iso-timestamp ()
    (concat (format-time-string "%Y-%m-%dT%T")
            ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
             (format-time-string "%z"))))
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style 'emacs)
 '(org-agenda-files
   '("~/.org/dailystory.org" "~/.org/agenda/inbox.org" "~/.org/agenda/todo.org" "~/.org/agenda/school.org" "~/.org/agenda/work.org" "~/.org/agenda/timetracking.org" "~/.org/agenda/all-posts.org" "~/.org/agenda/projects.org"))
 '(org-gcal-recurring-events-mode 'nested)
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("colorlinks=true" "hyperref" nil nil)))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-re-reveal-revealjs-version "4")
 '(org-refile-use-outline-path 'file)
 '(package-selected-packages
   '(ox-gfm org-re-reveal merlin-eldoc react-snippets pdf-tools tablist org-gcal persist request-deferred mu4e-maildirs-extension mu4e-alert helm-mu w3m notmuch-labeler org-roam-server org-tempo company-org-roam org-noter ox-reveal anki-editor anki-connect orgit ts emacsql-sqlite3 org-cliplink org-brain helm-org-rifle helm-org evil-org posframe company-terraform terraform-mode hcl-mode csv-mode format-all language-id wakatime-mode jinja2-mode company-ansible ansible-doc ansible helm-notmuch notmuch gnu-elpa-keyring-update evil-commentary rjsx-mode multi-web-mode vimrc-mode dactyl-mode import-js grizzl ranger lua-mode easy-hugo org-roam emacsql-sqlite emacsql org-super-agenda toml-mode racer flycheck-rust cargo rust-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data add-node-modules-path stickyfunc-enhance helm-gtags helm-cscope xcscope ggtags dap-mode bui counsel-gtags counsel swiper ivy ox-hugo org-sticky-header org-journal yapfify yaml-mode web-beautify utop tuareg caml tide typescript-mode seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake pytest pyenv-mode py-isort prettier-js pippel pipenv pyvenv pip-requirements ocp-indent ob-elixir nodejs-repl mvn minitest meghanada maven-test-mode lsp-ui lsp-treemacs lsp-python-ms lsp-java livid-mode skewer-mode simple-httpd live-py-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc importmagic epc ctable concurrent deferred helm-pydoc helm-lsp groovy-mode groovy-imports pcache gradle-mode flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus dune cython-mode tern company-lsp lsp-mode dash-functional company-emoji company-anaconda chruby bundler inf-ruby blacken anaconda-mode pythonic alchemist elixir-mode xterm-color unfill smeargle shell-pop org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode markdown-toc markdown-mode htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck magit git-commit with-editor transient eshell-z eshell-prompt-extras esh-help company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete gruvbox-theme autothemer ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "/home/gautierk"))
 '(projectile-require-project-root nil)
 '(setq org-modules t)
 '(tramp-copy-size-limit 1024000)
 '(web-mode-markup-indent-offset 2)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
