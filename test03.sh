#!/bin/dash

# Test for shrug-show, wit add and commit

output_file="test03_o.txt"
expected_output="test03_exp.txt"

if [ -e ".shrug" ]; then
    rm -r .shrug
fi

echo 1 > x
echo 2 > y 
./shrug-init > $output_file
./shrug-add x y >> $output_file
./shrug-commit -m "first commit" >> $output_file
echo 2 >> x
./shrug-add x 
./shrug-commit -m "second commit" >> $output_file
echo 3 >> x 
./shrug-show 0:x >> $output_file
./shrug-show 1:x >> $output_file
./shrug-show :x >> $output_file
./shrug-show 0:y >> $output_file
./shrug-show 1:y >> $output_file
rm y
./shrug-show 1:y >> $output_file




if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 3 (add,commit,show) !!!"
   rm $output_file
fi