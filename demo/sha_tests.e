note
	description: "[
		Eiffel tests that can be executed by testing tool.
		
		Each `test_sha_xxx' features follow this pattern: 
			test_name := "sha-1: single block"
			parser.set_with_string ("abc")
			test ("a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d")
		Feature test prints the `test_name' along with the expected
		and computed digest values and calls assert to perform the
		actual test.
	]"
	author: "Jimmy J. Johnson"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	SHA_TESTS

inherit

	EQA_TEST_SET
		redefine
			on_prepare
		end

feature -- Initialization

	on_prepare
		do
			create sha_1
			create sha_224
			create sha_256
			create sha_384
			create sha_512
			create sha_512_224
			create sha_512_256
			parser := sha_1
			test_name := "not set yet"
		end

feature {NONE} -- Implementation

	test_name: STRING_8
			-- The particular test being done

	parser: SHA_FUNCTIONS_COMMON [JJ_NATURAL]
			-- Polymorphic holder for the particular version being tested

	sha_1: SHA_1
			-- Parser to produce an SHA-1 digest of a string.
			-- See class {SHA}.

	sha_224: SHA_224
			-- Parser to produce an SHA-224 digest of a string.
			-- See class {SHA}.

	sha_256: SHA_256
			-- Parser to produce an SHA-256 digest of a string.
			-- See class {SHA}.

	sha_384: SHA_384
			-- Parser to produce an SHA-384 digest of a string.
			-- See class {SHA}.

	sha_512: SHA_512
			-- Parser to produce an SHA-512 digest of a string.
			-- See class {SHA}.

	sha_512_224: SHA_512_224
			-- Parser to produce an SHA-512 (224) digest of a string.
			-- See class {SHA}.

	sha_512_256: SHA_512_256
			-- Parser to produce an SHA-512 (256) digest of a string.
			-- See class {SHA}.

feature -- Basic operations

	print_line
			-- Draw a seperating line across the page
		do
			print ("-------------------------------------------------------- %N")
		end

	test (a_expected: STRING_8)
			-- Test if the `parser' produces `a_expected' digest
		local
			s: STRING_8
			d: STRING_8
		do
			s := parser.generating_type + "." + test_name
			d := parser.digest.as_string
			print (s + "%N")
			print ("%T expected = " + a_expected + "%N")
			print ("%T   actual = " + d + "%N")
			assert (s, d ~ a_expected)
		end

feature -- Usage demo and test

--	demo_test
--			-- Demonstrate usage of interface classes
--		local
--			sha_1: SHA_1
--			sha_512: SHA_512
--			d_1: SHA_DIGEST_1
--			d_512: SHA_DIGEST_512
--			m: STRING_8			-- The message
--			e, e2: STRING_8		-- Expected result
--		do
--				-- Example classes and two ways to use an SHA_xxx class
--			m := "abc"
--			create sha_1.set_with_string (m)
--			create sha_512
--			sha_512.set_with_string (m)
--				-- Calculate and print the SHA hash tags
--			d_1 := sha_1.digest
--			d_512 := sha_512.digest
--			print ("{SHA_TESTS}.demo_test %N")
--			print ("SHA-1 value:    " + d_1.as_string + "%N")
--			print ("SHA-512 value:  " + d_512.as_string + "%N")
--				-- Might as well test the results
--			e :=  "a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d"
--			e2 := "ddaf35a193617aba cc417349ae204131 12e6fa4e89a97ea2 0a9eeee64b55d39a " +
--					"2192992a274fc1a8 36ba3c23a3feebbd 454d4423643ce80e 2a9ac94fa54ca49f"
--			assert ("Demo_test one", d_1.as_string ~ e)
--			assert ("Demo_test e2", d_512.as_string ~ e2)
--		end

feature -- Test routines (SHA-1)

	test_sha_1
			-- Test {SHA_1_ENCODER} as per FIPS PUB 180-2 (Aug 2002)
			-- Appendix A, pp 25-27
		do
			parser := sha_1
				-- One block
			test_name := "sha-1: single block"
			parser.set_with_string ("abc")
			test ("a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d")
				-- Multi-block (55 char => partial block with lenth in second block)
			test_name := "sha-1: multi-block (56 chars)"
			parser.set_with_string ("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
			test ("84983e44 1c3bd26e baae4aa1 f95129e5 e54670f1")
				-- Multi-block (62 char => one full block and length in second
				-- Checked with website "onlinemd5.com"
			test_name := "sha-1: multi-block (62 chars)"
			parser.set_with_string ("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq123456")
			test ("9d9d6d43 639baf54 bc62d95e 9804ca4c 03c82163")
				-- Long message
			test_name := "sha-1: one million a's"
--			parser.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
--			test ("34aa973c d4c4daa4 f61eeb2b dbad2731 6534016f")
				-- Test "The red fox..."
			test_name := "sha-1:  The red fox..."
			parser.set_with_string ("The red fox jumps over the blue dog")
			test ("0fec050f 02cd6201 e2ef871e cf8f9d94 c1dab7ae")
			test_name := "sha-1:  the red fox... (lower case t)"
			parser.set_with_string ("the red fox jumps over the blue dog")
			test ("faf08572 98136eff 6c72af2f d0b6a9bf c76235a0")
			print_line
		end

	test_sha_256
		do
			parser := sha_256
				-- One block
			test_name := "sha-256:  single block"
			parser.set_with_string ("abc")
			test ("ba7816bf 8f01cfea 414140de 5dae2223 b00361a3 96177a9c b410ff61 f20015ad")
				-- Multi-block
			test_name := "sha-256:  multiple blocks"
			parser.set_with_string ("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
			test ("248d6a61 d20638b8 e5c02693 0c3e6039 a33ce459 64ff2167 f6ecedd4 19db06c1")
				-- Long message
			test_name := "sha-256:  one million a's"
--			parser.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
--			test ("cdc76e5c 9914fb92 81a1c7e2 84d73e67 f1809a48 a497200e 046d39cc c7112cd0")
			print_line
		end

	test_sha_224
			-- Values compared to http://www.miniwebtool.com/sha224-hash-generator/
		do
			parser := sha_224
				-- One block
			test_name := "sha-224:  single block"
			parser.set_with_string ("abc")
			test ("23097d22 3405d822 8642a477 bda255b3 2aadbce4 bda0b3f7 e36c9da7")
				-- Multi-block
			test_name := "sha-224:  multiple blocks"
			parser.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
									"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
			test ("c97ca9a5 59850ce9 7a04a96d ef6d99a9 e0e0e2ab 14e6b8df 265fc0b3")
				-- Long message
			test_name := "sha-224:  one million a's"
--			parser.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
--			test ("20794655 980c91d8 bbb4c1ea 97618a4b f03f4258 1948b2ee 4ee7ad67")
			print_line
		end


	test_sha_512
		do
				-- One block
			parser := sha_512
				-- One block
			test_name := "sha-512:  single block"
			parser.set_with_string ("abc")
			test ("ddaf35a193617aba cc417349ae204131 12e6fa4e89a97ea2 0a9eeee64b55d39a " +
					"2192992a274fc1a8 36ba3c23a3feebbd 454d4423643ce80e 2a9ac94fa54ca49f")
				-- Multi-block
			test_name := "sha-512:  multiple blocks"
			parser.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
					"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
			test ("8e959b75dae313da 8cf4f72814fc143f 8f7779c6eb9f7fa1 7299aeadb6889018 " +
					"501d289e4900f7e4 331b99dec4b5433a c7d329eeb6dd2654 5e96e55b874be909")
				-- Long message
			test_name := "sha-512:  one million a's"
--			parser.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
--			test ("e718483d0ce76964 4e2e42c7bc15b463 8e1f98b13b204428 5632a803afa973eb " +
--					"de0ff244877ea60a 4cb0432ce577c31b eb009c5c2c49aa2e 4eadb217ad8cc09b")
			print_line
		end

	test_sha_384
			-- FIPS Pub 108-2 (Aug 2002)
		do
				-- One block
			parser := sha_384
				-- One block, pages 56-60
			test_name := "sha-384:  single block"
			parser.set_with_string ("abc")
			test ("cb00753f45a35e8b b5a03d699ac65007 272c32ab0eded163 1a8b605a43ff5bed " +
					"8086072ba1e7cc23 58baeca134c825a7")
				-- Multi-block, pages 61-70
			test_name := "sha-384:  multiple blocks"
			parser.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
									"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
			test ("09330c33f71147e8 3d192fc782cd1b47 53111b173b3b05d2 2fa08086e3b0f712 " +
					"fcc7c71a557e2db9 66c3e9fa91746039")
				-- Long message, page 70
			test_name := "sha-384:  one million a's"
			parser.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
			test ("9d0e1809716474cb 086e834e310a4a1c ed149e9c00f24852 7972cec5704c2a5b " +
					"07b8b3dc38ecc4eb ae97ddd87f3d8985")
			print_line
		end

feature -- Test routines (hash a file)

	hash_text_file
			-- Test {SHA_1} on a text file that contains the string "abc".
		local
			fn: STRING_8
			f: PLAIN_TEXT_FILE
			m: STRING_8
			sha: SHA_1
			e: STRING_8
			d: STRING_8
		do
			fn := "abc.txt"
			create sha
			create f.make_create_read_write (fn)
			f.put_string ("abc")
			f.close
			sha.set_with_filename (fn)
			d := sha.digest.as_string
			e := "a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d"
			print ("{SHA_TESTS}.hash_text_file: %N")
			print ("%T message = " + sha.out + "%N")
			print ("%T expected = " + e + "%N")
			print ("%T computed = " + d + "%N")
			assert (sha.out, d ~ e)
		end

	hash_raw_file
			-- Test {SHA_1} on a binary file that contains "abc" and a natural number.
		local
			f, f2: RAW_FILE
			m: SHA_MESSAGE [NATURAL_8]
			sha: SHA_1
			e: STRING_8
			d: STRING_8
			fn: STRING_8
			i: INTEGER
			p: MANAGED_POINTER
		do
				-- Create the file
			fn := "abc.raw"
			create f.make_create_read_write (fn)
			f.put_string ("abc")
			f.put_natural_32 (0xFFF0AB80)
			f.close
			create sha.set_with_filename (fn)
			d := sha.digest.as_string
			e := "a42047ef 4571beb0 8e8810ed 65ef39b7 6a6587b9"
			print ("{SHA_TESTS}.hash_raw_file: %N")
			print ("%T message = " + sha.out + "%N")
			print ("%T expected = " + e + "%N")
			print ("%T computed = " + d + "%N")
			assert (sha.out, d ~ e)
		end


end


