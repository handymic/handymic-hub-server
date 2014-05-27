ROOT = $(shell pwd)
RUND = $(ROOT)/run

run: setup
	umurmurd -d -c run/etc/umurmur.conf

run/clean: clean run

clean:
	rm run/*/*.*

setup: run/etc/umurmur.conf run/certs/cert.pem

run/certs/cert.pem:
	openssl req -x509 -newkey rsa:2048 -nodes -days 1001 \
		-keyout $(subst cert.pem,key.pem,$@) -out $@

run/etc/umurmur.conf:
	cat tpls/umurmur.conf | sed "s|@@RUND@@|$(RUND)|g" > $@

