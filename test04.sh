#!/bin/dash

# Test for shrug-show errors

output_file="test04_o.txt"
expected_output="test04_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

echo line 1 > x
echo hello > y 
./shrug-init > $output_file
./shrug-add x y >> $output_file
./shrug-commit -m "first commit" >> $output_file
echo line 2 >> x
./shrug-add x
./shrug-show 1:x >> $output_file
echo world > z
./shrug-show 0:z >> $output_file
./shrug-show 1:z >> $output_file
./shrug-show :z >> $output_file
./shrug-commit -m "second commit" >> $output_file
./shrug-show 2:x >> $output_file
rm x y z
./shrug-show 2:x >> $output_file
./shrug-show 1:z >> $output_file



if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 4 (show errors)"
   rm $output_file
fi