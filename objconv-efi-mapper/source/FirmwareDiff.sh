#! /bin/bash

IFS=$'\n'
abs_input_dir1=`stat -f "$1"`
efi_list1=`find "$1" -name body.bin`
abs_input_dir2=`stat -f "$2"`
efi_list2=`find "$2" -name body.bin`

for efi1 in $efi_list1; do
	for efi2 in $efi_list2; do
		file_name1="${efi1#$abs_input_dir1}"
		file_name2="${efi2#$abs_input_dir2}"
		if [ "$file_name1" == "$file_name2" ]; then
			echo "***********************************************************************************"
			echo "mapper start:"
			echo "input1 : $efi1"
			echo "input2 : $efi2"
			printf '%s' "$(./efi-mapper "$efi1" "$efi2" --unmap)"
		fi
	done
done
