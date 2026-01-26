note
	description: "[
		Eiffel tests on the SHA classes that can be executed by testing tool.
	]"
	author: "Jimmy J. Johnson"
	date: "1/23/26"

class
	SHA_TESTS

inherit

	EQA_TEST_SET

feature {NONE}-- Initialization

	abc: STRING_8
			-- The string "abc"
		once
			Result := "abc"
		end

	char_56: STRING_8
			-- A string with 56 characters
			-- A partial block, but with add second block for length vector
		once
			Result := "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
		end

	char_62: STRING_8
			-- A string with 62 characters
			-- Results in one full block and a partial block.
		once
			Result := "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq123456"
		end

	sentence: STRING_8
			-- A sentence "The red fox..."
		once
			Result := "The red fox jumps over the blue dog."
		end

	lower_t_sentence: STRING_8
			-- Same as `the_red_fox_sentence" but with a lower-case "t"
		once
			Result := "the red fox jumps over the blue dog."
		end

	one_million_a: STRING_8
			-- A string containing 1,000,000 "a" characters
		once
			create Result.make_filled ('a', 1_000_000)
		end

feature {NONE} -- Implementation

	print_header (a_string: STRING_8)
			-- Draw a seperating line across the page
		do
			print ("%N------------- " + a_string + " ------------------------------------------- %N%N")
		end

	print_threshold: INTEGER_32 = 30
			-- Print only first charachters input strings

feature {NONE} -- Basic operations

	test (a_hasher: SHA_HASHER; a_input, a_expected: STRING_8)
			-- Test if the `hasher' produces `a_expected' digest
		local
			s: STRING_8
			d: STRING_8
		do
			s := a_hasher.generating_type.name + ":  "
			s := s + "'"
			if a_input.count > print_threshold then
				s := s + a_input.substring (1, print_threshold - 10)
				s := s + " ... "
				s := s + a_input.substring (a_input.count - 10, a_input.count)
			else
				s := s +  a_input
			end
			s := s + "'"
			s := s + "%N"
			print (s)
			a_hasher.set_with_string (a_input)
			a_hasher.show_stats
			d := a_hasher.digest.as_string
			print ("%Texpected = " + a_expected + "%N")
			print (" %T actual = " + d)
			print ("%N%N")
			assert (s, d ~ a_expected)
		end

feature -- Basic opeerartions

	test_sha_1
			-- Test {SHA_1_HASHER} as per FIPS PUB 180-2 (Aug 2002)
			-- Appendix A, pp 25-27
		local
			h: SHA_1_HASHER
		do
			print_header ("SHA_1_HASHER")
			create h
				-- One block
			test (h, abc, "a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d")
				-- Multi-block (55 char => partial block with length in second block)
			test (h, char_56, "84983e44 1c3bd26e baae4aa1 f95129e5 e54670f1")
				-- Multi-block (62 char => one full block and length in second
			test (h, char_62, "9d9d6d43 639baf54 bc62d95e 9804ca4c 03c82163")
				-- Test "The red fox..."
			test (h, sentence, "b43b7045 35995557 7698e22f 3c3cecc9 b6836923")
				-- Test "the red fox..."  (i.e. lower case "t")
			test (h, lower_t_sentence, "2755a0a0 b775476f fe6ddac0 b6f8aff3 51f366d6")
				-- Long message
--			test (h, one_million_a, "34aa973c d4c4daa4 f61eeb2b dbad2731 6534016f")
		end

	test_sha_256
			-- Test {SHA_1_HASHER} as per FIPS PUB 180-2 (Aug 2002)
			-- Appendix A, pp 33-40
		local
			h: SHA_256_HASHER
		do
			print_header ("SHA_256_HASHER")
			create h
				-- One block
			test (h, abc, "ba7816bf 8f01cfea 414140de 5dae2223 b00361a3 96177a9c b410ff61 f20015ad")
				-- Multi-block (55 char => partial block with length in second block)
			test (h, char_56, "248d6a61 d20638b8 e5c02693 0c3e6039 a33ce459 64ff2167 f6ecedd4 19db06c1")
				-- Long message
--			test (h, one_million_a, "cdc76e5c 9914fb92 81a1c7e2 84d73e67 f1809a48 a497200e 046d39cc c7112cd0")
		end

--	test_sha_224
--			-- Values compared to http://www.miniwebtool.com/sha224-hash-generator/
--		do
--			hasher := sha_224
--				-- One block
--			test_name := "sha-224:  single block"
--			hasher.set_with_string ("abc")
--			test ("23097d22 3405d822 8642a477 bda255b3 2aadbce4 bda0b3f7 e36c9da7")
--				-- Multi-block
--			test_name := "sha-224:  multiple blocks"
--			hasher.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
--									"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
--			test ("c97ca9a5 59850ce9 7a04a96d ef6d99a9 e0e0e2ab 14e6b8df 265fc0b3")
--				-- Long message
--			test_name := "sha-224:  one million a's"
----			hasher.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
----			test ("20794655 980c91d8 bbb4c1ea 97618a4b f03f4258 1948b2ee 4ee7ad67")
--			print_line
--		end

	test_sha_512
		local
			h: SHA_512_HASHER
			d: STRING_8
		do
			print_header ("SHA_512_HASHER")
			create h
				-- One block
			d := "ddaf35a193617aba cc417349ae204131 12e6fa4e89a97ea2 0a9eeee64b55d39a " +
					"2192992a274fc1a8 36ba3c23a3feebbd 454d4423643ce80e 2a9ac94fa54ca49f"
			test (h, abc,  d)



--			hasher.set_with_string ("abc")
--			test ("ddaf35a193617aba cc417349ae204131 12e6fa4e89a97ea2 0a9eeee64b55d39a " +
--					"2192992a274fc1a8 36ba3c23a3feebbd 454d4423643ce80e 2a9ac94fa54ca49f")
				-- Multi-block
--			test_name := "sha-512:  multiple blocks"
--			hasher.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
--					"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
--			test ("8e959b75dae313da 8cf4f72814fc143f 8f7779c6eb9f7fa1 7299aeadb6889018 " +
--					"501d289e4900f7e4 331b99dec4b5433a c7d329eeb6dd2654 5e96e55b874be909")
--				-- Long message
--			test_name := "sha-512:  one million a's"
------			hasher.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
------			test ("e718483d0ce76964 4e2e42c7bc15b463 8e1f98b13b204428 5632a803afa973eb " +
------					"de0ff244877ea60a 4cb0432ce577c31b eb009c5c2c49aa2e 4eadb217ad8cc09b")

		end

----	test_sha_384
----			-- FIPS Pub 108-2 (Aug 2002)
----		do
----				-- One block
----			hasher := sha_384
----				-- One block, pages 56-60
----			test_name := "sha-384:  single block"
----			hasher.set_with_string ("abc")
----			test ("cb00753f45a35e8b b5a03d699ac65007 272c32ab0eded163 1a8b605a43ff5bed " +
----					"8086072ba1e7cc23 58baeca134c825a7")
----				-- Multi-block, pages 61-70
----			test_name := "sha-384:  multiple blocks"
----			hasher.set_with_string ("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmn" +
----									"hijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu")
----			test ("09330c33f71147e8 3d192fc782cd1b47 53111b173b3b05d2 2fa08086e3b0f712 " +
----					"fcc7c71a557e2db9 66c3e9fa91746039")
----				-- Long message, page 70
----			test_name := "sha-384:  one million a's"
----			hasher.set_with_string (create {STRING_8}.make_filled ('a', 1_000_000))
----			test ("9d0e1809716474cb 086e834e310a4a1c ed149e9c00f24852 7972cec5704c2a5b " +
----					"07b8b3dc38ecc4eb ae97ddd87f3d8985")
----			print_line
----		end

--feature -- Test routines (hash a file)

--	hash_text_file
--			-- Test {SHA_1} on a text file that contains the string "abc".
--		local
--			fn: STRING_8
--			f: PLAIN_TEXT_FILE
--			sha: SHA_1
--			e: STRING_8
--			d: STRING_8
--		do
--			fn := "abc.txt"
--			create sha
--			create f.make_create_read_write (fn)
--			f.put_string ("abc")
--			f.close
--			sha.set_with_filename (fn)
--			d := sha.digest.as_string
--			e := "a9993e36 4706816a ba3e2571 7850c26c 9cd0d89d"
--			print ("{SHA_TESTS}.hash_text_file: %N")
--			print ("%T message = " + sha.out + "%N")
--			print ("%T expected = " + e + "%N")
--			print ("%T computed = " + d + "%N")
--			assert (sha.out, d ~ e)
--		end

--	hash_raw_file
--			-- Test {SHA_1} on a binary file that contains "abc" and a natural number.
--		local
--			f: RAW_FILE
--			sha: SHA_1
--			e: STRING_8
--			d: STRING_8
--			fn: STRING_8
--		do
--				-- Create the file
--			fn := "abc.raw"
--			create f.make_create_read_write (fn)
--			f.put_string ("abc")
--			f.put_natural_32 (0xFFF0AB80)
--			f.close
--			create sha.set_with_filename (fn)
--			d := sha.digest.as_string
--			e := "a42047ef 4571beb0 8e8810ed 65ef39b7 6a6587b9"
--			print ("{SHA_TESTS}.hash_raw_file: %N")
--			print ("%T message = " + sha.out + "%N")
--			print ("%T expected = " + e + "%N")
--			print ("%T computed = " + d + "%N")
--			assert (sha.out, d ~ e)
--		end

--	hash_large_file
--		-- Test {SHA-256} from NOOBS file (Raspberry Pi operating system).20015ad")
----		do
----			hasher := sha_256
----			hasher.set_with_filename ("NOOBS_v3_4_1.zip")
----			test ("7bb002bc 17689fdd 14a3e81b d733e317 b901746c 65e0c5dc c611f954 b00ecaae")
----		end
--		local
--			f: RAW_FILE
--			sha: SHA_256
--			e: STRING_8
--			d: STRING_8
--			fn: STRING_8
--		do
--				-- I picked a downloaded program for which the hash is known
----			fn := "NOOBS_v3_4_1.zip"
----			e := "7bb002bc 17689fdd 14a3e81b d733e317 b901746c 65e0c5dc c611f954 b00ecaae"
--			fn := "../../../jj_Downloads/VMware-Fusion-13.6.4-24832108_universal.dmg"
--				-- SHA2 hash from Broadcom
--			e := "a43fd031 165896bc 1b7ecc61 eb07b377 bfc01b01 4c9111b0 8e18a6a1 af121191"
--			create sha.set_with_filename (fn)
--			d := sha.digest.as_string
--			print ("{SHA_TESTS}.hash_raw_file: %N")
--			print ("%T message = " + sha.out + "%N")
--			print ("%T expected = " + e + "%N")
--			print ("%T computed = " + d + "%N")
--			assert (sha.out, d ~ e)
--		end

end


