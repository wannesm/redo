rm -f *.out *.log

../../flush-cache.sh
redo-ifchange 1.out 2.out
[ "$(cat 1.log | wc -l)" -eq 1 ] || exit 55
[ "$(cat 2.log | wc -l)" -eq 1 ] || exit 56
../../flush-cache.sh
touch 1.in
redo-ifchange 1.out 2.out
[ "$(cat 2.log | wc -l)" -eq 1 ] || exit 58
. ../../skip-if-minimal-do.sh
[ "$(cat 1.log | wc -l)" -eq 2 ] || exit 57

