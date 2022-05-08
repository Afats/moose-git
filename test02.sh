#!/bin/dash

### Test for shrug-commit and shrug-log

output_file="test02_o.txt"
expected_output="test02_exp.txt"

if [ -e ".shrug" ]; then
    rm -r .shrug
fi

touch a b 
echo hello > a
echo world > b 

./shrug-init > $output_file
./shrug-add a b >> $output_file
./shrug-commit -m "first commit" >> $output_file
./shrug-log >> $output_file
touch a 
./shrug-commit -m "second commit" >> $output_file
echo line 2 >> a 
./shrug-add a >> $output_file
./shrug-commit -m "second commit" >> $output_file
./shrug-log >> $output_file


if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 2 (commit & log)"
   rm $output_file
fi