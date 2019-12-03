CXX=		g++ $(CCFLAGS)
HELLO=	hello.o
OBJS = $(HELLO)

LIBS=

CCFLAGES= -g

all:	hello

hello: $(HELLO)
	$(CXX) -o hello $(HELLO) $(LIBS)
  
clean:
     rm -f $(OBJS)
     
realclean:
	rm -f $(OBJS) hello 
 
# These lines ensure that dependencies are handled automatically.
%.d:	%.cc
	$(SHELL) -ec '$(CC) -M $(CPPFLAGS) $< \
		| sed '\''s/\($*\)\.o[ :]*/\1.o $@ : /g'\'' > $@; \
		[ -s $@ ] || rm -f $@'

include	$(OBJS:.o=.d)
