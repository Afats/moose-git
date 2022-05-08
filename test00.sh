#!/bin/dash

### Test for legit-init

output_file="test00_o.txt"
expected_output="test00_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

ls -d .shrug >> $output_file
./shrug-init > $output_file
ls -d .shrug >> $output_file
./shrug-init >> $output_file

if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 0 (shrug-init)"
   rm $output_file
fi

