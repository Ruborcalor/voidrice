(TeX-add-style-hook
 "test"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "colorlinks=true") ("cleveref" "nameinlink") ("mdframed" "framemethod=TikZ") ("tocstyle" "tocindentauto") ("enumitem" "shortlabels") ("todonotes" "obeyFinal" "textsize=scriptsize" "shadow") ("scrlayer-scrpage" "headsepline") ("CJK" "encapsulated") ("inputenc" "utf8x")))
   (TeX-run-style-hooks
    "hints"
    "amsmath"
    "amssymb"
    "patch-asy"
    "asymptote"
    "amsthm"
    "xcolor"
    "hyperref"
    "cleveref"
    "thmtools"
    "mdframed"
    "tocstyle"
    "von"
    "listings"
    "mathrsfs"
    "textcomp"
    "enumitem"
    "todonotes"
    "mathtools"
    "microtype"
    "titling"
    "diagrams"
    "tikz-cd"
    "fancyhdr"
    "scrlayer-scrpage"
    "CJK"
    "ucs"
    "inputenc"
    "answers")
   (TeX-add-symbols
    '("cn" 1)
    '("prototype" 1)
    '("taking" 1)
    '("arc" 1)
    '("seg" 1)
    '("ray" 1)
    '("norm" 1)
    '("abs" 1)
    '("plusemail" 1)
    '("vocab" 1)
    '("mailto" 1)
    '("ceil" 1)
    '("floor" 1)
    '("cbrt" 1)
    "ol"
    "ul"
    "wt"
    "wh"
    "eps"
    "alert"
    "half"
    "catname"
    "hrulebar"
    "cis"
    "lcm"
    "argmin"
    "argmax"
    "cycsum"
    "symsum"
    "cycprod"
    "symprod"
    "CC"
    "FF"
    "NN"
    "QQ"
    "RR"
    "ZZ"
    "EE"
    "charin"
    "sign"
    "Aut"
    "Inn"
    "Syl"
    "Gal"
    "GL"
    "SL"
    "dang"
    "id"
    "inv"
    "diam"
    "ord"
    "defeq"
    "ts"
    "dg"
    "ii"
    "liff"
    "lthen"
    "opname"
    "surjto"
    "injto"
    "On"
    "img"
    "Img"
    "coker"
    "Coker"
    "Ker"
    "rank"
    "Spec"
    "Tr"
    "pr"
    "ext"
    "pred"
    "dom"
    "ran"
    "Hom"
    "End"
    "kb"
    "kg"
    "kh"
    "kn"
    "ku"
    "kz"
    "Ext"
    "Tor"
    "gl"
    "SA"
    "SB"
    "SC"
    "SD"
    "SE"
    "SF"
    "SG"
    "SH"
    "OO"
    "LL"
    "SX"
    "listhack"
    "thesubtitle"
    "makehints")
   (LaTeX-add-environments
    '("subproof" LaTeX-env-args ["argument"] 0)
    "soln"
    "parlist"
    "gobble"
    "moral"
    "theorem"
    "lemma"
    "proposition"
    "corollary"
    "claim"
    "conjecture"
    "definition"
    "fact"
    "answer"
    "case"
    "ques"
    "exercise"
    "hwexercise"
    "problem"
    "hwproblem"
    "recall"
    "example"
    "note"
    "remark"
    "abuse"
    "bsmi")
   (LaTeX-add-lengths
    "posttitledrop"
    "postauthordrop"))
 :latex)

