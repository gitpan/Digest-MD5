# This Makefile is for the Digest::MD5 extension to perl.
#
# It was generated automatically by MakeMaker version
# 2.02 (Revision: ) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#	ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker Parameters:

#	DEFINE => q[-DU32_ALIGNMENT_REQUIRED]
#	NAME => q[Digest::MD5]
#	VERSION_FROM => q[MD5.pm]
#	dist => { COMPRESS=>q[gzip -9f], SUFFIX=>q[gz] }

# --- MakeMaker constants section:
NAME = Digest::MD5
DISTNAME = Digest-MD5
NAME_SYM = Digest_MD5
VERSION = 2.02
VERSION_SYM = 2_02
XS_VERSION = 2.02
INST_LIB = ::::lib
INST_ARCHLIB = ::::lib
PERL_LIB = ::::lib
PERL_SRC = ::::
PERL = ::::miniperl
FULLPERL = ::::perl
SOURCE =  MD5.c

MODULES = :lib:Digest.pm \
	:lib:Digest:HMAC.pm \
	:lib:Digest:HMAC_MD5.pm \
	:lib:Digest:HMAC_SHA1.pm \
	:lib:MD5.pm \
	MD5.pm
PMLIBDIRS = lib


.INCLUDE : $(PERL_SRC)BuildRules.mk


# FULLEXT = Pathname for extension directory (eg DBD:Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT.
# ROOTEXT = Directory part of FULLEXT (eg DBD)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = Digest:MD5
BASEEXT = MD5
ROOTEXT = Digest:
DEFINE = -d U32_ALIGNMENT_REQUIRED

# Handy lists of source code files:
XS_FILES= MD5.xs
C_FILES = MD5.c
H_FILES = 


.INCLUDE : $(PERL_SRC)ext:ExtBuildRules.mk


# --- MakeMaker dlsyms section:

dynamic :: MD5.exp


MD5.exp: Makefile.PL
	$(PERL) "-I$(PERL_LIB)" -e 'use ExtUtils::Mksymlists; Mksymlists("NAME" => "Digest::MD5", "DL_FUNCS" => {  }, "DL_VARS" => []);'


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
	Set OldEcho {Echo}
	Set Echo 0
	Directory MD2
	If "`Exists -f Makefile.mk`" != ""
	    $(MAKE) clean
	End
	Set Echo {OldEcho}
		$(RM_RF) MD5.c
	$(MV) Makefile.mk Makefile.mk.old


# --- MakeMaker realclean section:

# Delete temporary files (via clean) and also delete installed files
realclean purge ::  clean
	Set OldEcho {Echo}
	Set Echo 0
	Directory MD2
	If "`Exists -f Makefile.mk.old`" != ""
	    $(MAKE) realclean
	End
	Set Echo {OldEcho}
		Set OldEcho {Echo}
	Set Echo 0
	Directory MD2
	If "`Exists -f Makefile.mk`" != ""
	    $(MAKE) realclean
	End
	Set Echo {OldEcho}
		$(RM_RF) Makefile.mk Makefile.mk.old


# --- MakeMaker postamble section:


# --- MakeMaker rulez section:

install install_static install_dynamic :: 
	$(PERL_SRC)PerlInstall -l $(PERL_LIB)
	$(PERL_SRC)PerlInstall -l "Bird:MacPerl Ä:site_perl:"

.INCLUDE : $(PERL_SRC)BulkBuildRules.mk


# End.
