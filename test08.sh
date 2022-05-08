#!/bin/dash

#Tes t for shrug-status errors

output_file="test08_o.txt"
expected_output="test08_exp.txt"

if [ -e ".shrug" ]; then
    rm -R .shrug
fi

./shrug-init > $output_file
echo 1 > a
echo 2 > b 
./shrug-add a b 
./shrug-rm a >> $output_file
./shrug-rm b 
./shrug-commit -m "second commit" >> $output_file
./shrug-rm --cached a 
touch a b c x e f y z
./shrug-commit -m 'first commit'
echo hello >a
echo hello >b
echo hello >c
./shrug-add a b
echo world >a
rm x
./shrug-rm e
./shrug-add g
./shrug-status



if diff -b $output_file $expected_output >/dev/null; then
   echo "Passed Test 8 (status errors) !!!"
   rm $output_file
fi