# This Makefile is for the Digest::SHA1 extension to perl.
#
# It was generated automatically by MakeMaker version
# 1.02 (Revision: ) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#	ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker Parameters:

#	NAME => q[Digest::SHA1]
#	VERSION_FROM => q[SHA1.pm]
#	dist => { COMPRESS=>q[gzip -9f], SUFFIX=>q[gz] }

# --- MakeMaker constants section:
NAME = Digest::SHA1
DISTNAME = Digest-SHA1
NAME_SYM = Digest_SHA1
VERSION = 1.02
VERSION_SYM = 1_02
XS_VERSION = 1.02
INST_LIB = :::::lib
INST_ARCHLIB = :::::lib
PERL_LIB = :::::lib
PERL_SRC = :::::
PERL = :::::miniperl
FULLPERL = :::::perl
SOURCE =  SHA1.c

MODULES = :SHA1.pm \
	:lib:SHA.pm \
	SHA1.pm
PMLIBDIRS = :lib


.INCLUDE : $(PERL_SRC)BuildRules.mk


# FULLEXT = Pathname for extension directory (eg DBD:Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT.
# ROOTEXT = Directory part of FULLEXT (eg DBD)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = Digest:SHA1
BASEEXT = SHA1
ROOTEXT = Digest:

# Handy lists of source code files:
XS_FILES= SHA1.xs
C_FILES = SHA1.c
H_FILES = 


.INCLUDE : $(PERL_SRC)ext:ExtBuildRules.mk


# --- MakeMaker dlsyms section:

dynamic :: SHA1.exp


SHA1.exp: Makefile.PL
	$(PERL) "-I$(PERL_LIB)" -e 'use ExtUtils::Mksymlists; Mksymlists("NAME" => "Digest::SHA1", "DL_FUNCS" => {  }, "DL_VARS" => []);'


# --- MakeMaker dynamic section:

all :: dynamic

install :: do_install_dynamic

install_dynamic :: do_install_dynamic


# --- MakeMaker static section:

all :: static

install :: do_install_static

install_static :: do_install_static


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean ::
	$(RM_RF) SHA1.c
	$(MV) Makefile.mk Makefile.mk.old


# --- MakeMaker realclean section:

# Delete temporary files (via clean) and also delete installed files
realclean purge ::  clean
	$(RM_RF) Makefile.mk Makefile.mk.old


# --- MakeMaker postamble section:


# --- MakeMaker rulez section:

install install_static install_dynamic :: 
	$(PERL_SRC)PerlInstall -l $(PERL_LIB)
	$(PERL_SRC)PerlInstall -l "Bird:MacPerl Ä:site_perl:"

.INCLUDE : $(PERL_SRC)BulkBuildRules.mk


# End.
