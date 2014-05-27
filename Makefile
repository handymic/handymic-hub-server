ROOT = $(shell pwd)
RUND = $(ROOT)/run
CONF = run/etc/umurmur.conf
CERT = run/certs/mumble.crt

run: setup
	umurmurd -d -c $(CONF)

run/clean: clean run

clean:
	rm run/*/*.*

setup: $(CONF) $(CERT)

$(CERT):
	openssl req -x509 -newkey rsa:2048 -nodes -days 1001 \
		-keyout $(subst .crt,.key,$@) -out $@

$(CONF):
	cat tpls/umurmur.conf | sed "s|@@RUND@@|$(RUND)|g" > $@

