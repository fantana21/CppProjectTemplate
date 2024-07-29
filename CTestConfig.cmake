set(MEMORYCHECK_TYPE Valgrind)
# If --errors-for-leak-kinds=all is too strict, try --errors-for-leak-kinds=definite
set(VALGRIND_COMMAND_OPTIONS "--leak-check=full --show-leak-kinds=all --track-origins=yes --errors-for-leak-kinds=all --error-exitcode=1")
