# jj_sha
An Eiffel implementation of Secure Hash Algorithms, conforming to FIPS Pub 180-4 (Mar 2012).

This library provides classes for calculating SHA-1, SHA-256, SHA-512, SHA-224, SHA-384, SHA-512/256, and SHA-256/224 hashes (i.e. message digest) for string or file input.

It depends on the JJ\_NATURAL\_xxx classes found [here](http://github.com/boxer41a/jj_naturals).  Using JJ_NATURAL reduced the number of classes required for this project and prevented code duplication.

To used the example ecf files, checkout the library to a location identified by the envirnment variable "JJ_GITHUB".

![](http://github.com/boxer41a/jj_sha/docs/SHA Classes (parsers).png)

