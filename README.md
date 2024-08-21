# phpldapadmin-docker
PhpLdapAdmin with LDAPS on docker

```docker
wget https://github.com/leenooks/phpLDAPadmin/archive/refs/tags/1.2.6.7.tar.gz

mkdir -p src/config
cp -ra config.php pla/src/config/
cp -ra phpLDAPadmin-1.2.6.7/htdocs pla/src/
cp -ra phpLDAPadmin-1.2.6.7/index.php pla/src/
cp -ra phpLDAPadmin-1.2.6.7/hooks pla/src/
cp -ra phpLDAPadmin-1.2.6.7/lib pla/src/
cp -ra phpLDAPadmin-1.2.6.7/locale pla/src/
cp -ra phpLDAPadmin-1.2.6.7/queries pla/src/
cp -ra phpLDAPadmin-1.2.6.7/templates pla/src/
cp -ra pla/config pla/src/
cp -ra phpLDAPadmin-1.2.6.7/VERSION

podman build --no-cache -t pla-1.2.6.7 .
```
