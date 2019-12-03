CXX=		g++ $(CCFLAGS)
HELLO=	helloworld.o
OBJS = $(HELLO)

LIBS=

CCFLAGES= -g

all:	hello

hello: $(HELLO)
	$(CXX) -o helloworld $(HELLO) $(LIBS)
  
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
