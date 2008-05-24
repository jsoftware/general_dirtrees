NB. Tests for dirtrees
NB. To run all tests, select all file contents and choose Run|Selection

load '~addons/general/dirtrees/dirtrees.ijs'
SRCDIR=: jpath '~.system/tools'
TRGDIR=: jpath '~temp/tools'
isMatch=: 'no difference' -: _1 {:: [: <;._2 LF ,~ ]

TRGDIR copytree SRCDIR  NB. copy directory tree
'Trees are not the same' assert isMatch 1 0 dircompare SRCDIR;TRGDIR

]res=: deltree TRGDIR
'Tree not successfully deleted' assert res

'Dir still exists' assert -. direxist TRGDIR
'All tests passed OK'
