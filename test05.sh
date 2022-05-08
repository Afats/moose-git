#!/bin/dash

### Test for shrug-commit -a

output_file="test05_o.txt"
expected_output="test05_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

echo "amazing" > x
./shrug-init > $output_file
./shrug-add x > $output_file
./shrug-commit -m "first commit" >> $output_file
echo 2 >> x
./shrug-commit -a -m "second commit" >> $output_file
echo hello world > y 
./shrug-commit -a -m "third commit" >> $output_file
./shrug-commit -a -m "fourth commit" >> $output_file
./shrug-commit -a -m "fifth commit" >> $output_file
./shrug-show 0:x >> $output_file
./shrug-show :y >> $output_file
./shrug-show :y >> $output_file



if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 5 (add & commit)"
   rm $output_file
fi