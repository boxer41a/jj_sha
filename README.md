# jj_sha
###An Eiffel implementation of Secure Hash Algorithms

This repository contains classes for calculating various SHA hashes, conforming to [FIPS Pub 180-4 (Mar 2012)](./docs/FIPS PUB 180-4 (Mar 2012).pdf).  All the neccessary classes are in the [classes](./classes) directory.  To use the library, include [jj_sha.ecf](./classes/jj_sha.ecf) in a project.  

This library provides classes for calculating SHA-1, SHA-256, SHA-512, SHA-224, SHA-384, SHA-512/256, and SHA-256/224 hashes (i.e. a message digest) from string or file input.  The [interface classes](./classes/interface), shown below the [support classes](./classes/support) in the diagram include:  

- [SHA-1](./classes/interface/32-bit/sha_1.e) - produces a 160-bit [SHA\_1\_DIGEST](./classes/interface/32-bit/sha_256.e), implemented as 32-bit words
- [SHA-256](./classes/interface/32-bit/sha_256.e) - produces a 256-bit [SHA\_256\_DIGEST](./classes/interface/32-bit/sha_256_digest.e), implemented as 32-bit words.
- [SHA-224](./classes/interface/32-bit/sha_224.e) - produces a 224-bit [SHA\_224\_DIGEST](./classes/interface/32-bit/sha_224_digest.e), calcualted similarly to SHA_256, but the final hash value is truncated.
- [SHA-512](./classes/interface/64-bit/sha_512.e) - produces a 512-bit [SHA\_512\_DIGEST](./classes/interface/64-bit/sha_512_digest.e), implemented using 64-bit words.
- [SHA\_384](./classes/interface/64-bit/sha_384.e), [SHA\_512\_224](./classes/interface/64-bit/sha_512_224.e), and [SHA\_512\_256](./classes/interface/64-bit/sha_512_256.e) - calculated the same as SHA_512, but with different initial values and results truncated to 384 bits, 224 bits, and 256 bits. 

<img 
	src="./docs/Class Diagram.png?"
	title="Class Diagram showing JJ_SHA's hierarchy"
	width="90%"
	alt="Class Diagram"
	border="2px solid"
/>

###Example Use

Create an object of the type corresponding to the desired encryption (i.e. SHA-1, SHA-256, etc.), set the string or file message to be hashed, and then query the parser for the digest.  Multiple queries will return the same message digest.

```			
local
	parser: SHA_1
	d, d2: SHA_DIGEST_1
do
	create parser	
	parser.set_with_string ("The red fox jumps over the blue dog")
	d := parser.digest
	parser.set_with_string ("the red fox jumps over the blue dog")
	d2 := parser.digest
	if d1 ~ d2 then
		io.put_string ("The two input strings were the same. %N")
	else
		io.put_string ("The two input strings were NOT the same. %N")
		io.put_string ("digest 1 = " + d.as_hex_string + "%N")
		io.put_string ("digest 2 = " + d2.as_hex_string + "%N")
	end
end
```		
	
The output of the above code is: 

```
	The two input strings were NOT the same.
		digest 1 = 0fec050f 02cd6201 e2ef871e cf8f9d94 c1dab7ae
		digest 2 = faf08572 98136eff 6c72af2f d0b6a9bf c76235a0
```

Note that a small change, the first letter of the input changed to lower case, produced a large change in the computed digest.

###Demo
The demo program [SHA_DEMO](./demo/sha_demo.e) uses [SHA_TESTS](./demo/sha_tests.e), to display feature calls and the results of the calls.  It also verifies the output digests against values given in the FIPS PUB or from other hasher programs.  When the demo system is open in [EiffelStudio](www.eiffel.com), you can also execute some features in [AutoTest](https://www.eiffel.org/doc/eiffelstudio/AutoTest).


#Experimental Cluster
Though not required but useful as an academic exercise and historical record, this repository also includes an implementation of the SHA library that demonstrates the use of the [JJ_NATURAL classes](http://github.com/boxer41a/jj_naturals) as an override cluster.  It was a first attempt at the SHA library and also showed how a common ancestor to the NATURAL\_xxx classes could be incorporated into the base library hierarchy.  Using the JJ\_NATURAL cluster reduced the number of classes and eliminated code duplication.  Notice the use of the generic parameter, JJ\_NATURAL, in the class diagram.

<img 
	src="./with_jj_naturals/docs/all_classes.png"
	title="Class Diagram showing JJ_NATURAL's hierarchy"
	width="90%"
	alt="Class Diagram"
	border="2px solid"
/>

A class if particular interest is SHA\_FUNCRTIONS\_COMMON.  Both 64-bit and 32-bit functions are defined in this class and anchored to type type of the generic parameter.  Descendent classes redefine the anchor to a concrete type, NATURAL_64 or NATURAL_32, and all the features follow.



