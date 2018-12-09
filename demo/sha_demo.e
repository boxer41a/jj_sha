note
	description : "[
		This class calls test functions to document, demonstrate,
		and test the SHA-xxx classes, which implement secure hash
		algorithms as described in FIPS Pub 180-4 (Mar 2012).
		
		It also demonstrates a new class, JJ_NATURAL, inserted below
		NUMERIC as ancestor to all the NATURAL_xx_REF classes.  The
		JJ_NATURAL class allows the same functions to work for
		64- and 32-bit calculations, greatly reducing code duplication.
		 
		This class is the root of the demo/sha_demo.ecf system.  It
		runs as an executable or in AutoTest.
		]"
	introduction: "[
		A Secure Hash Algorithm is a cryptographic hash function run on
		digital data, computing a result, called the message digest, which
		is compared to the known hash to ensure the integrity of the 
		input data.  For example, comparing the message digest computed
		for a downloaded file to a published digest shows whether the
		downloaded file has been tampered with.  A small change in the
		input string/file produces a large change in the output digest.
		]"
	dependencies: "[
		A project using these SHA classes must include the "override" 
		cluster from the jj_naturals project in order to override the
		NATURAL_xx classes in the Elks/kernel.
		(See github.com/boxer41a/jj_naturals.)
		]"
	example: "[	
		The intended usage pattern is to create an object of the type
		corresponding to the desired encryption (i.e. SHA-1, SHA-256, etc.),
		set the string or file message to be hashed, and then query the
		parser for the digest.
		
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
		do
		
		The output of the above code is:
			The two input strings were NOT the same.
			digest 1 = 0fec050f 02cd6201 e2ef871e cf8f9d94 c1dab7ae
			digest 2 = faf08572 98136eff 6c72af2f d0b6a9bf c76235a0
		
		Note that a small change, the first letter of the input changed
		to lower case, produced a large change in the computed digest.
		]"
	design: "[
		This library	divides its classes into an "interface" cluster and a
		"support" cluster.  The interface cluster contains the classes with
		which the programmer interacts; the support cluster contains the
		classes that perform the actual calculatios.  Each SHA_xxx class
		produces SHA_DIGEST_xxx, covariantly redefined to follow the type
		of the SHA_xxx parser.
			
		interface classes:
		
			{SHA_1} and {SHA_DIGEST_1}	
				Functions and parser that use 32-bit words, producing 
				a 160-bit digest.
				
			{SHA_256} and {SHA_DIGEST_256}
				Functions and parser that use 32-bit words, producing 
				a 256-bit digest.
				
			{SHA_224} and {SHA_DIGEST_224}
				Calculates a 224-bit digest using the same functions as
				the {SHA_256} class but starting from different initial
				values.
				
			{SHA_512} and {SHA_DIGEST_512}
				Functions and parser  that use 64-bit words, producing
				a 512-bit digest.
				
			{SHA_384} and {SHA_DIGEST_384}
				Calculates a 384-bit digest using the same functions as
				the {SHA_512} class but starting from different initial
				values.
			
			{SHA_512_224} and {SHA_DIGEST_512_224}
				Calculates a 224-bit digest using the same functions as
				the {SHA_512} class but starting from different initial
				values.
			
			{SHA_512_256} and {SHA_DIGEST_512_256}
				Calculates a 256-bit digest using the same functions as
				the {SHA_512} class but starting from different initial
				values.
				
		support classes:
		
			{SHA} [G -> {JJ_NATURAL}]}
				Common ancestor and top of the hierarchy for the various
				SHA classes.  Declares the features for input to and 
				output from the algorithms and converts the input (file
				or string) into a {SHA_MESSAGE}.
				
			{SHA_MESSAGE} [G -> {JJ_NATURAL}]
				The byte sequence (i.e. an ARRAY [NATURAL_8]), representing
				the message (as defined by FIPS Pub 180-4 (Mar 2012) to 
				calculate SHA digests for 32- or 64-bit hashes.

			{SHA_PARSER} [G -> {JJ_NATURAL}]
				-- Descendent of {SHA} and base class for the parser 
				-- classes.  It preprocess and pads an {SHA_MESSAGE} before
				-- calculation of a digest. 
				
			{SHA_FUNCTIONS_COMMON} [G -> {JJ_NATURAL}]
				-- This class extends the {SHA_PARSER} class, adding
				-- functions that are common to all the SHA algorithms.
				
			{SHA_PARSER_32_BIT} and {SHA_PARSER_64_BIT}
				-- Descendent of {SHA_PARSER} but with a concrete type
				-- for the generic (either NATURAL_32 or NATURAL_64),
				-- providing an anchor for features previously defined
				-- using the {JJ_NATURAL} type.
				
			{SHA_1_FUNCTIONS}	
				-- Descendent of {SHA_FUNCTIONS_COMMON} and {SHA_PARSER_32_BIT},
				-- containing functions specific to the {SHA_1} algorithm.
				-- Direct ancestor to the {SHA_1} interface class.
				
			{SHA_FUNCTIONS_256} 
				-- Descendent of {SHA_FUNCTIONS_COMMON} and {SHA_PARSER_32_BIT},
				-- containing functions specific to the {SHA_256} algorithm.
				-- Direct ancestor to the {SHA_256} interface class.

			{SHA_FUNCTIONS_512}
				-- Descendent of {SHA_FUNCTIONS_COMMON} and {SHA_PARSER_64_BIT},
				-- containing functions specific to the {SHA_512} algorithm.
				-- Direct ancestor to the {SHA_512} interface class.

	]"

	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"

class
	SHA_DEMO

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			i: INTEGER
			t: SHA_TESTS
		do
			create t
				-- Clear the console
			from i := 1
			until i > 30
			loop
				io.new_line
				i := i + 1
			end
			print ("Begin SHA_DEMO %N")
			io.new_line

			t.test_sha_1
			t.test_sha_256
			t.test_sha_224
			t.test_sha_512
--			t.test_sha_384

			t.hash_text_file
			t.hash_raw_file

			io.new_line
			print ("End SHA_DEMO %N")
		end

end
