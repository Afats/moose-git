#!/bin/dash

# Test for shrug-rm, using add and commit

output_file="test06_o.txt"
expected_output="test06_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

./shrug-init > $output_file
echo "testing rm" > $output_file
echo 2 > fil2
echo 1 > fil
./shrug-add fil fil2
./shrug-commit -m "first commit" >> $output_file
./shrug-rm fil2 
./shrug-add fil2 >> $output_file
./shrug-rm fil1 
./shrug-add a >> $output_file
touch fil fil2
./shrug-add fil fil2 
./shrug-commit -m "second commit" >> $output_file
./shrug-rm --cached fil 
./shrug-commit -m "third commit" >> $output_file
./shrug-add fil 
./shrug-commit -m "another commit" >> $output_file
./shrug-commit -m "4th commit" >> $output_file



if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 6 (rm)"
   rm $output_file
fi
