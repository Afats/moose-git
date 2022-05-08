#!/bin/dash

# Test for shrug-rm errors

output_file="test07_o.txt"
expected_output="test07_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

./shrug-init > $output_file
echo 1 > x
echo 2 > y
./shrug-add x y 
./shrug-rm x >> $output_file
./shrug-commit -m "first commit" >> $output_file
./shrug-rm y
./shrug-commit -m "second commit" >> $output_file
./shrug-rm --cached x
./shrug-commit -m "third commit" >> $output_file


if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 7 (rm)"
   rm $output_file
fi
