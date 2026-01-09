#! /usr/bin/python3
import os
import sys
import re

def usage(prog_name: str):
    print(f"1. generate build system with: {prog_name}")
    print(f"2. run tests with: {prog_name} test")
    print(f"3. clean up test artifact with: {prog_name} clean")


# depending on input argument (sys.argv[1]), either test, build, or cleanup (remove executable) 
argc = len(sys.argv)
if argc > 2:
    usage(sys.argv[0])
    sys.exit(1)

if argc == 1:
    print("generating build system with cmake in build/...")
    ret = os.system("cmake -S . -B build")
    sys.exit(ret)

# match statements are NOT switch statements, it's more similar to Rust/Haskell type pattern matching.
# it will try to match one of the cases specified with the *case* keyword, if match, execute the statements
# specified under the case keyword

match sys.argv[1]:
    case "test":
        print("building project...")
        if os.system("cmake --build build") != 0:
            sys.exit(1)

        print("running tests...")
        if os.system("ctest --test-dir build --output-on-failure") != 0:
            sys.exit(1)

        print("tests passed")

    case "clean":
        print("cleaning...")
        print("done")

    case _:
        # wild card case (none of the above matches)
        usage(sys.argv[0])
        sys.exit(1)

sys.exit(0)
