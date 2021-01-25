
## PHP 7.x - Using php-stemmer master
```
$ docker build --build-arg PHP_VERSION=7.4 --tag test:7.4 .
...
$ docker run -t test:7.4 && echo $?
dakpann
balletj
0
```

## PHP 8.x - Using php-stemmer master
```
$ docker build --build-arg PHP_VERSION=8.0 --tag test:8.0 .
...
#6 17.28 /tmp/php-stemmer-master/stemmer.c: In function 'zif_stemword':
#6 17.28 /tmp/php-stemmer-master/stemmer.c:87:47: error: expected ')' before 'TSRMLS_CC'
#6 17.28      if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "zzz", &arg,&lang,&enc) == FAILURE)RETURN_NULL();
#6 17.28                                                ^~~~~~~~~
#6 17.28 /tmp/php-stemmer-master/stemmer.c:87:9: error: too few arguments to function 'zend_parse_parameters'
#6 17.28      if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "zzz", &arg,&lang,&enc) == FAILURE)RETURN_NULL();
#6 17.28          ^~~~~~~~~~~~~~~~~~~~~
#6 17.28 In file included from /usr/local/include/php/main/php.h:35,
#6 17.28                  from /tmp/php-stemmer-master/stemmer.c:5:
#6 17.28 /usr/local/include/php/Zend/zend_API.h:304:22: note: declared here
#6 17.28  ZEND_API zend_result zend_parse_parameters(uint32_t num_args, const char *type_spec, ...);
#6 17.28                       ^~~~~~~~~~~~~~~~~~~~~
#6 17.30 make: *** [Makefile:209: stemmer.lo] Error 1
```

## PHP 7.x - Using php-stemmer php-8 branch
```
$ docker build --build-arg PHP_STEMMER_VERSION=php-8 --build-arg PHP_VERSION=7.4 --tag test-pr:7.4 .
...
$ docker run -t test-pr:7.4 && echo $?
dakpann
balletj
0
```

## PHP 8.x - Using php-stemmer php-8 branch
```
$ docker build --build-arg PHP_STEMMER_VERSION=php-8 --build-arg PHP_VERSION=8.0 --tag test-pr:8.0 .
...
$ docker run -t test-pr:8.0 && echo $?
dakpann
balletj
0
```