NB. Tests for dirtrees

Note 'To run all tests:'
load 'general/dirtrees'
load 'general/test_dirtrees'
)

SRCDIR=: jpath '~.system/tools'
TRGDIR=: jpath '~temp/tools'
isMatch=: 'no difference' -: _1 {:: [: <;._2 LF ,~ ]

test=: 3 : 0
  TRGDIR copytree SRCDIR  NB. copy directory tree
  'Trees are not the same' assert isMatch 1 0 dircompare SRCDIR;TRGDIR
  
  res=. deltree TRGDIR
  'Tree not successfully deleted' assert res
  
  'Dir still exists' assert -. direxist TRGDIR

  'test_dirtrees passed'
)

smoutput test''
