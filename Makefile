.PHONY: doc

REBAR3 ?= rebar3

ifeq ($(shell which $(REBAR3) 2>/dev/null),)
  REBAR=./rebar
  DOC=doc
else
  REBAR=rebar3
  DOC=edoc
endif

all:
	$(REBAR) compile
	$(REBAR) $(DOC)
	$(REBAR) xref
	$(REBAR) eunit

compile:
	$(REBAR) compile

doc:
	$(REBAR) doc

xref: compile
	$(REBAR) xref

clean:
	$(REBAR) clean

test: xref
	$(REBAR) eunit

