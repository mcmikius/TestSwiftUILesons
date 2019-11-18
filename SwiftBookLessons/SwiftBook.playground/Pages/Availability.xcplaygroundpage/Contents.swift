let string = "some string"

let multithreadString =
"""
this is multithread string
this is multithread string
this is multithread string
this is multithread string
"""

for character in string {
    print(character)
}

let array = ["1", "2", "3", "4"]
print(array[..<2])
print(array[...2])
