build: pptoken

pptoken: pptoken.cpp IPPTokenStream.h DebugPPTokenStream.h
	g++ -g -std=gnu++11 -Wall -o pptoken pptoken.cpp

test: build
	scripts/run_all_tests.pl pptoken my
	scripts/compare_results.pl ref my

ref: pptoken-ref

ref-test: ref
	scripts/run_all_tests.pl pptoken-ref ref

pptoken-ref: pptoken-ref.cpp IPPTokenStream.h DebugPPTokenStream.h
	g++ -std=gnu++11 -Wall -o pptoken-ref pptoken-ref.cpp
	strip pptoken-ref

export: ref ref-test
	scripts/export_pa.sh

