#!/usr/bin/python3
# This program was created to simplify the creation of files that are
# certain sizes, to test the feasability of Git-LFS for some of the 
# animation students.

megabyte = 1048576
gigabyte = 1073741824 

# Create 50mb file.
with open('fifty_mb.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (megabyte*50))

# Create 1gb file.
with open('one_g.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (gigabyte*1))

# Create 2gb file.
with open('two_g.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (gigabyte*2))

# Create 3gb file.
with open('three_g.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (gigabyte*3))

# Create 4gb file.
with open('four_g.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (gigabyte*4))

# Create 5gb file.
with open('five_g.bintest', 'wb') as binfile:
    binfile.write(b'\x00' * (gigabyte*5))
