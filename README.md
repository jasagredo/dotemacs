# DotEmacs

To prepare this configuration:
```
cd
git clone https://github.com/Jasagredo/dotemacs .emacs.d
cd .emacs.d
git submodule update --init --recursive
(
    cd lisp/fira-code-emacs
    make
)
(
    cd org-mode
    make
)
```

Then open Emacs, navigate to the first block of the file and execute `org-babel-execute-src-block` followed by `org-babel-tangle-file`.

For byte-compiling everything, use:
```
emacs -batch -f batch-byte-compile ~/.emacs.d/**/*.el
```

Open Emacs, let it install everything and then do `byte-compile-file` on `config.el`.
