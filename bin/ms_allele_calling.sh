######
# Input
#  No inpout. Samples should be in a file calles Sample.ls

awk '{system("sh bin/shell_for_all.sh "$1" "$2" "$3)}'
