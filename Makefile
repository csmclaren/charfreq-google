.PHONY: all clean input output

all: clean input output set-permissions set-timestamps

include tools/charfreq-tools/common.mk

INPUT := \
	input/google-books-common-words.txt \
	input/ngrams-all.tsv.gz \
	input/ngrams-all.tsv
ORDERS := 1 2 3
OUTPUT_NGRAMS_UC := $(foreach N,$(ORDERS),output/$(N)-grams-uc.tsv)
OUTPUT_NGRAMS := $(OUTPUT_NGRAMS_UC)
OUTPUT_NGRAMS_WITH_C_AND_P := $(OUTPUT_NGRAMS:%.tsv=%-with-c-and-p.tsv)
OUTPUT := $(OUTPUT_NGRAMS) $(OUTPUT_NGRAMS_WITH_C_AND_P)

clean: clean-output clean-venv

input: $(INPUT)

input/google-books-common-words.txt: | input-dir
	curl -L -o $@ https://norvig.com/google-books-common-words.txt

input/ngrams-all.tsv.gz: | input-dir
	curl -L -o $@ https://norvig.com/tsv/ngrams-all.tsv.zip

input/ngrams-all.tsv: input/ngrams-all.tsv.gz
	gunzip -c $< > $@

output: $(OUTPUT)

output/1-grams-all-uc.tsv: input/ngrams-all.tsv | output-dir
	tools/charfreq-tools/filter-between-rows '^1-gram' '^2-gram' < $< > $@

output/2-grams-all-uc.tsv: input/ngrams-all.tsv | output-dir
	tools/charfreq-tools/filter-between-rows '^2-gram' '^3-gram' < $< > $@

output/3-grams-all-uc.tsv: input/ngrams-all.tsv | output-dir
	tools/charfreq-tools/filter-between-rows '^3-gram' '^4-gram' < $< > $@

output/%-grams-uc.tsv: output/%-grams-all-uc.tsv
	cut -f1,2 $< > $@

output/%-with-c-and-p.tsv: output/%.tsv
	tools/charfreq-tools/append-c-and-p 2 < $< > $@
