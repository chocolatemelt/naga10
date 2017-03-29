bdf = 5x10a.bdf 5x10B.bdf 5x10rk.bdf knj10B.bdf knj10.bdf
pcf = $(bdf:%.bdf=out/%.pcf.gz)
cache = out/fonts.dir out/fonts.scale
unicode_version = 9.0.0

all: $(pcf)

fontdir: $(pcf) $(cache)

out:
	mkdir -p out

out/%.pcf.gz: %.bdf out
	bdftopcf $< | gzip -9 > $@

out/fonts.scale: $(pcf)
	mkfontscale out

out/fonts.dir: $(pcf) out/fonts.scale
	mkfontdir out
	xset fp rehash
	fc-cache

clean:
	rm -rf out *.bak

.PHONY: all build clean
