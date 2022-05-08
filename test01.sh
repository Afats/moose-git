#!/usr/bin/env dash

# Test for/shrug-add

output_file="test01_o.txt"
expected_output="test01_exp.txt"
touch x y

if [ -e ".shrug" ]; then
    rm -r .shrug
fi 

./shrug-add x y > $output_file
./shrug-init >> $output_file
./shrug-add x y >> $output_file
./shrug-add cck >> $output_file
./shrug-add x y >> $output_file
rm x y
./shrug-add x y >> $output_file
./shrug-add x >> $output_file



if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 1 (add, no init) !!!"
   rm $output_file
fi