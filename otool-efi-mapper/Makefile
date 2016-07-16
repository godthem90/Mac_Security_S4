export USE_APPLE_PB_SUPPORT = all

DSTROOT = /
RC_OS = macos
RC_CFLAGS =

INSTALLSRC_SUBDIRS = $(COMMON_SUBDIRS) $(SUBDIRS_32) include libmacho
COMMON_SUBDIRS = libstuff otool
SUBDIRS = $(COMMON_SUBDIRS)

OLD_LIBKLD = NO
BUILD_DYLIBS = YES
LTO = -DLTO_SUPPORT

ifeq "macos" "$(RC_OS)"
  TRIE := $(shell if [ "$(RC_MAJOR_RELEASE_TRAIN)" = "Tiger" ] || \
		     [ "$(RC_MAJOR_RELEASE_TRAIN)" = "Leopard" ] || \
		     [ "$(RC_PURPLE)" = "YES" ]; then \
			    echo "" ; \
			else \
			    echo "-DTRIE_SUPPORT" ; fi; )
else
  TRIE =
endif

ifneq "" "$(wildcard /bin/mkdirs)"
  MKDIRS = /bin/mkdirs
else
  MKDIRS = /bin/mkdir -p
endif

all clean: $(DSTROOT)
	@if [ "$(SRCROOT)" != "" ] && \
	    [ "$(OBJROOT)" != "" ] && \
	    [ "$(SYMROOT)" != "" ];			\
	then								\
	    CWD=`pwd`; cd "$(DSTROOT)"; DSTROOT=`pwd`; cd "$$CWD";	\
	    for i in `echo $(SUBDIRS)`;					\
	      do							\
		    echo =========== $(MAKE) $@ for $$i =============;	\
		    (cd $$i; $(MAKE) RC_CFLAGS="$(RC_CFLAGS) $(HIDE)"	\
			RC_ARCHS="$(RC_ARCHS)" RC_OS="$(RC_OS)"		\
			VERS_STRING_FLAGS="$(VERS_STRING_FLAGS)"	\
			TRIE="$(TRIE)" LTO="$(LTO)" DSTROOT=$$DSTROOT	\
			SRCROOT=$(SRCROOT)/$$i				\
			OBJROOT=$(OBJROOT)/$$i				\
			SYMROOT=$(SYMROOT)/$$i $@) || exit 1 ;		\
	      done;							\
	    SED_RC_CFLAGS=`echo "$(RC_CFLAGS)" | sed 's/-arch ppc64//'  \
 		| sed 's/-arch x86_64//' | sed 's/-arch armv5//'	\
 		| sed 's/-arch arm64//' | sed 's/-arch x86_64h//'	\
		| sed 's/-arch armv6//' | sed 's/-arch armv7[f,k,s]*//g'`; \
	    EMPTY=`echo "$$SED_RC_CFLAGS" | sed 's/ //g'		\
		| sed 's/-pipe//'`;					\
	    if [ "$$EMPTY"x != "x" ];					\
	    then							\
	      for i in `echo $(SUBDIRS_32)`;				\
	        do							\
		    echo =========== $(MAKE) $@ for $$i =============;	\
		    (cd $$i; $(MAKE) "RC_CFLAGS=$$SED_RC_CFLAGS" 	\
			RC_ARCHS="$(RC_ARCHS)" RC_OS="$(RC_OS)"		\
			VERS_STRING_FLAGS="$(VERS_STRING_FLAGS)"	\
			TRIE="$(TRIE)" LTO="$(LTO)" DSTROOT=$$DSTROOT	\
			SRCROOT=$(SRCROOT)/$$i				\
			OBJROOT=$(OBJROOT)/$$i				\
			SYMROOT=$(SYMROOT)/$$i $@) || exit 1 ;		\
	        done;							\
	    fi								\
	else								\
	    CWD=`pwd`; cd "$(DSTROOT)"; DSTROOT=`pwd`; cd "$$CWD";	\
	    for i in `echo $(SUBDIRS)`;					\
	      do							\
		    echo =========== $(MAKE) $@ for $$i =============;	\
		    (cd $$i; $(MAKE) RC_CFLAGS="$(RC_CFLAGS) $(HIDE)"	\
			RC_ARCHS="$(RC_ARCHS)" RC_OS="$(RC_OS)"		\
			TRIE="$(TRIE)" LTO="$(LTO)" DSTROOT=$$DSTROOT 	\
			$@) || exit 1 ; 				\
	      done;							\
	    SED_RC_CFLAGS=`echo "$(RC_CFLAGS)" | sed 's/-arch ppc64//'  \
 		| sed 's/-arch x86_64//' | sed 's/-arch armv5//'	\
 		| sed 's/-arch arm64//' | sed 's/-arch x86_64h//'	\
		| sed 's/-arch armv6//' | sed 's/-arch armv7[f,k,s]*//g'`; \
	    EMPTY=`echo "$$SED_RC_CFLAGS" | sed 's/ //g'		\
		| sed 's/-pipe//'`;					\
	    if [ "$$EMPTY"x != "x" ];					\
	    then							\
	      for i in `echo $(SUBDIRS_32)`;				\
	        do							\
		    echo =========== $(MAKE) $@ for $$i =============;	\
		    (cd $$i; $(MAKE) RC_CFLAGS="$$SED_RC_CFLAGS"	\
			RC_ARCHS="$(RC_ARCHS)" RC_OS="$(RC_OS)"		\
			TRIE="$(TRIE)" LTO="$(LTO)" DSTROOT=$$DSTROOT	\
			$@) || exit 1 ; 				\
	        done;							\
	    fi								\
	fi

$(DSTROOT):
	$(MKDIRS) $@

SRCROOT:
	@if [ -n "${$@}" ]; \
	then \
		exit 0; \
	else \
		echo Must define $@; \
		exit 1; \
	fi
